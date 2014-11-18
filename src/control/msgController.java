package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FriendsDAO;
import dao.MemberDAO;
import dao.msgDAO;
import dto.MemberDTO;

public class msgController extends HttpServlet {

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
		msgDAO msgDAO = new msgDAO();
		MemberDAO memberDAO = new MemberDAO();
		FriendsDAO friendsDAO = new FriendsDAO();
		HttpSession session = req.getSession();
		MemberDTO memberDTO;
		String url = "";
		

		// 기본적으로 로그인 된 후 와야되므로 세션 dto에 회원 정보가 있어야 함.
		// 즉, 세션에 올라온 멤버 정보 호출.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");

		//세션에 없는 경우 세션없음 에러 창으로 이동.
		if (memberDTO == null) {
			url="/error/NeedLogin.html";
			RequestDispatcher view = req.getRequestDispatcher(url);
			view.forward(req, resp);
			return;
		}

		Vector vList = null;// 글목록
		Vector fList = null;// 친구목록
		String cmd = req.getParameter("cmd");


		// 접근 조건 판별
		if (cmd.equals("MSGLIST")) {
			vList = msgDAO.msgList(memberDTO.getMember_id());
			session.setAttribute("msgList", vList);
			url = "/message/msglist.jsp";
		} else if (cmd.equals("MSGWRITE")) {
			fList = msgDAO.FriendsInfo(memberDTO.getMember_id());
			session.setAttribute("FriendsList", fList);
			url = "/message/write.jsp";
		} else if (cmd.equals("MSGSEND")) {
			msgDAO.SendMessage(Integer.parseInt(req.getParameter("friend_id")),
					(req.getParameter("msg_text")), memberDTO.getMember_id());
			url = "/message/writeProc.jsp"; 
		}else if (cmd.equals("MSGDELETE")) {
			msgDAO.DeleteMessage(req.getParameter("msg_ids"));
			url = "/message/deleteProc.jsp";
		}else{
			//비정상접근 메세지.
		}
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
