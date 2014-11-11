package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("maincont");
		String url="";
		String cmd = req.getParameter("cmd");
		if(cmd == null|| cmd.equals("INDEX")){
			url="/index.jsp";
			
		}else	if(cmd.equals("LOGIN")){
			url="/Join_v1/login.html";
		}else	if(cmd.equals("JOIN")){
			url="/Join_v1/emaildup.jsp";
		}else	if(cmd.equals("VALIDEMAIL")){
			//model로 이전해야함. 
			url="/Join_v1/emaildup_Proc.jsp";	
		}else	if(cmd.equals("CONJOIN")){
			url="/Join.jsp";	
		}
		
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
