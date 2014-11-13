package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.msgDAO;
import dto.MemberDTO;

public class FriendController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		//System.out.println("entercontroller");
		msgDAO msgDAO = new msgDAO();
		HttpSession session = req.getSession();
		MemberDTO memberDTO;
		String url = "";
		;

		// 기본적으로 로그인 된 후 와야되므로 세션 dto에 회원 정보가 있어야 함.
		// 즉, 세션에 올라온 멤버 정보 호출.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");

		if (memberDTO == null) {
			// 비정상 접속 메세지 내놔야 함.
		}

		Vector vList = null;// 글목록
		Vector fList = null;// 친구목록
		String cmd = req.getParameter("cmd");


		// 접근 조건 판별
		if (cmd.equals("FRIENDS")) {//시작은 친구 목록.
			url = "/friends/FriendList.jsp";
		} else if (cmd.equals("")) {
			url = "/message/write.jsp";
		} else{
			//비정상접근 메세지.
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
