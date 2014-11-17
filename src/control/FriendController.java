package control;

import java.io.IOException;
import java.sql.SQLException;
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
		String url="", cmd;
		int friend_id = 0;
		Vector fList, inviteList;
		MemberDTO friendDTO = null, memberDTO;
		FriendsDAO friendsDAO = new FriendsDAO();
		MemberDAO memberDAO = new MemberDAO();
		// �⺻������ �α��� �� �� �;ߵǹǷ� ���� dto�� ȸ�� ������ �־�� ��.
		// ��, ���ǿ� �ö�� ��� ���� ȣ��.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");

		if (memberDTO == null) {
			url = "error/NeedLogin.html";
			RequestDispatcher view = req.getRequestDispatcher(url);
			view.forward(req, resp);
		}

		int member_id = memberDTO.getMember_id();// ���̵� ����

		// System.out.println("cmd: " + cmd);

		// ģ�� ��� ���� ȣ��.
		fList = friendsDAO.FriendsInfo(memberDTO.getMember_id());
		session.setAttribute("friendsList", fList);

		// ������ ģ�� ��û ��� ���
		inviteList = friendsDAO.FriendResponse(memberDTO.getMember_id());
		req.setAttribute("inviteList", inviteList);

		// �⺻ ����
		url = "/friends/FriendList.jsp";


		// cmd �б�
		// ���� ���� �Ǻ� ���ο��� FRIENDS�� ���� �⺻���ӵ�.
		// ���� FRIENDSLIST���� �����̴� �����.
		cmd = req.getParameter("cmd");
		System.out.println(cmd);

		if (cmd.equals("INVITEFRIEND")) {// ģ�� ��û. �����»���� ���
			url = "/main?cmd=FRIENDS";
			String fiemail = req.getParameter("femail");
			friendDTO = friendsDAO.SearchInfo(fiemail, member_id);
			friend_id = friendDTO.getMember_id();
			friendsDAO.InviteFriend(member_id, friend_id);
		} else if (cmd.equals("FIND")) {//�˻� ��ư �Է�.
			url = "/main?cmd=FRIENDS";
			String fsemail = req.getParameter("frSearch");
			System.out.println(fsemail);
			friendDTO = friendsDAO.SearchInfo(fsemail, member_id);
			friend_id = friendDTO.getMember_id();
			if(friendDTO.getName()==null){
				friendDTO.setName("null");
			}
			req.setAttribute("searchfriend", friendDTO);
		} else if (cmd.equals("RESFRIEND")) {// ģ����û����. �޴��̰� ��
			url = "/main?cmd=FRIENDS";
			
			String fremail = req.getParameter("femail");
			System.out.println(fremail);
			friendDTO = memberDAO.getInfo(fremail);
			friend_id = friendDTO.getMember_id();
			
			friendsDAO.AllowFriend(member_id, friend_id );
		} else if (cmd.equals("DELETEFRIEND")) {// ģ�� ����. �Ѵ� ������.
			url = "/main?cmd=FRIENDS";

			String fremail = req.getParameter("femail");
			System.out.println(fremail);
			friendDTO = memberDAO.getInfo(fremail);
			friend_id = friendDTO.getMember_id();
			System.out.println("del");
			friendsDAO.DeleteFriend( member_id,friend_id);// ���, ģ�� �Ѵ� ������.
			// ģ����û����, ���� ģ�� ����

		} else{
			
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
