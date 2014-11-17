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
		HttpSession session = req.getSession();
		String url, cmd; 
		Vector fList, inviteList;
		MemberDTO friendDTO, memberDTO;
		msgDAO msgDAO = new msgDAO();
		MemberDAO memberDAO = new MemberDAO();
		FriendsDAO friendsDAO = new FriendsDAO();
		

		// �⺻������ �α��� �� �� �;ߵǹǷ� ���� dto�� ȸ�� ������ �־�� ��.
		// ��, ���ǿ� �ö�� ��� ���� ȣ��.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");

		if (memberDTO == null) {
			url = "error/NeedLogin.html";
			RequestDispatcher view = req.getRequestDispatcher(url);
			view.forward(req, resp);
		}

		// System.out.println("cmd: " + cmd);
		

		// ���� ���� �Ǻ� ���ο��� FRIENDS�� ���� �⺻���ӵ�.
		// â �̵��� �����Ƿ� �Ʒ��� �⺻ ��.
		
		String femail = req.getParameter("femail");
		friendDTO = memberDAO.getInfo(femail);
		int sender_id = memberDTO.getMember_id();
		int reciever_id = friendDTO.getMember_id();
		url = "/friends/FriendList.jsp";
		
		// ģ�� ��� ���� ȣ��.
		fList = friendsDAO.FriendsInfo(memberDTO.getMember_id());
		session.setAttribute("friendsList", fList);
		
		if (req.getParameter("frSearch") != null) {// �˻��� ��� ���.
			String email = req.getParameter("frSearch");
			System.out.println(email);
			friendDTO = memberDAO.getInfo(email);
			req.setAttribute("searchfriend", friendDTO);
		}
		//������ ģ�� ��û ��� ���
		inviteList = friendsDAO.FriendResponse(memberDTO.getMember_id());
		req.setAttribute("inviteList", inviteList);
		
		
		// cmd �б�
		cmd=req.getParameter("cmd");
		if (cmd.equals("INVITEFRIEND")) {// ģ�� ��û. �����»���� ���
			friendsDAO.InviteFriend(sender_id, reciever_id);
		} else if (cmd.equals("RESFRIEND")) {// ģ����û����. �޴��̰� ��
			friendsDAO.AllowFriend(reciever_id,sender_id);
		} else if (cmd.equals("DELETEFRIEND")) {// ģ�� ����. �Ѵ� ������.
			friendsDAO.DeleteFriend(reciever_id,sender_id);//���, ģ�� �Ѵ� ������.
			// ģ����û����, ���� ģ�� ����
		} else {
			// ���������� �޼���.
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
