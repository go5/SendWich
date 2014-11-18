package control.pq_board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class boardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		String url = "";
		

		CommandFactory factory = CommandFactory.getInstance();
		Command icmd = factory.createCommand(cmd);
		url = (String)icmd.processCommand(req, resp);

		System.out.println(cmd);
		RequestDispatcher view = req.getRequestDispatcher(url); // 요청시 해당페이지로
																// 이동을 지시하는 메서드
		view.forward(req, resp);
	}

}
