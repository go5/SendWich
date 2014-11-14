package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
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
		String url = "";

		msgDAO msgDAO = new msgDAO();
		HttpSession session = req.getSession();
		MemberDTO friendDTO;
		MemberDTO memberDTO;
		MemberDAO memberDAO = new MemberDAO();

		String cmd = req.getParameter("cmd");

		// �⺻������ �α��� �� �� �;ߵǹǷ� ���� dto�� ȸ�� ������ �־�� ��.
		// ��, ���ǿ� �ö�� ��� ���� ȣ��.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");

		if (memberDTO == null) {
			url = "error/NeedLogin.html";
			RequestDispatcher view = req.getRequestDispatcher(url);
			view.forward(req, resp);
		}

		//System.out.println("cmd: " + cmd);
		// ģ�� ��� ���� ȣ��.
		Vector fList = memberDAO.FriendsInfo(memberDTO.getMember_id());
		session.setAttribute("friendsList", fList);

		
		// ���� ���� �Ǻ�
		if (cmd.equals("FRIENDS")) {// ������ ģ�� ���.
			url = "/friends/FriendList.jsp";
			if (req.getParameter("frSearch") != null) {
				String email = req.getParameter("frSearch");
				System.out.println(email);
				friendDTO = memberDAO.getInfo(email);
				req.setAttribute("friendDTO", friendDTO);
			}
		} 
		else if (cmd.equals("INVITE")) {
			url = "/friends/FriendList.jsp";
			String femail = req.getParameter("femail");
			friendDTO = memberDAO.getInfo(femail);
			int sender_id = memberDTO.getMember_id();
			int reciever_id = friendDTO.getMember_id();
			memberDAO.FriendInvite(sender_id, reciever_id);
			
		}
			else {
			// ���������� �޼���.
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
