package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;

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
		String url = "";
		String cmd = req.getParameter("cmd");
		HttpSession session=req.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("memberDTO");
		
		if (cmd == null || cmd.equals("INDEX")) {
			url = "/index.jsp";
		} else if (cmd.equals("LOGIN")) {
			url = "/Join_v1/login.html";
		}else if (cmd.equals("LOGINPROC")) {
			url = "/Join_v1/login_Proc.jsp";
		}else if (cmd.equals("MEMINFO")) {
			url = "/index.jsp";
			System.out.println(mdto.getEmail());
		} else if (cmd.equals("LOGOUT")) {
			//session.removeAttribute("memberDTO");
			url = "/Join_v1/logout_Proc.jsp";
			//url = "main?cmd=INDEX";
		} else if (cmd.equals("JOIN")) {
			url = "/Join_v1/emaildup.jsp";
		} else if (cmd.equals("VALIDEMAIL")) {
			// model로 이전해야함.
			url = "/Join_v1/emaildup_Proc.jsp";
		} else if (cmd.equals("CONJOIN")) {
			url = "join.jsp";
		} else if (cmd.equals("REGMEM")) {
			url = "/Join_v1/join_Proc.jsp";
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
