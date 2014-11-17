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
		// 기본적으로 로그인 된 후 와야되므로 세션 dto에 회원 정보가 있어야 함.
		// 즉, 세션에 올라온 멤버 정보 호출.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");

		if (memberDTO == null) {
			url = "error/NeedLogin.html";
			RequestDispatcher view = req.getRequestDispatcher(url);
			view.forward(req, resp);
		}

		int member_id = memberDTO.getMember_id();// 아이디 정보

		// System.out.println("cmd: " + cmd);

		// 친구 목록 정보 호출.
		fList = friendsDAO.FriendsInfo(memberDTO.getMember_id());
		session.setAttribute("friendsList", fList);

		// 수락할 친구 신청 목록 출력
		inviteList = friendsDAO.FriendResponse(memberDTO.getMember_id());
		req.setAttribute("inviteList", inviteList);

		// 기본 정보
		url = "/friends/FriendList.jsp";


		// cmd 분기
		// 접근 조건 판별 메인에서 FRIENDS로 오면 기본접속됨.
		// 이하 FRIENDSLIST에서 움직이는 경우임.
		cmd = req.getParameter("cmd");
		System.out.println(cmd);

		if (cmd.equals("INVITEFRIEND")) {// 친구 신청. 보내는사람이 멤버
			url = "/main?cmd=FRIENDS";
			String fiemail = req.getParameter("femail");
			friendDTO = friendsDAO.SearchInfo(fiemail, member_id);
			friend_id = friendDTO.getMember_id();
			friendsDAO.InviteFriend(member_id, friend_id);
		} else if (cmd.equals("FIND")) {//검색 버튼 입력.
			url = "/main?cmd=FRIENDS";
			String fsemail = req.getParameter("frSearch");
			System.out.println(fsemail);
			friendDTO = friendsDAO.SearchInfo(fsemail, member_id);
			friend_id = friendDTO.getMember_id();
			if(friendDTO.getName()==null){
				friendDTO.setName("null");
			}
			req.setAttribute("searchfriend", friendDTO);
		} else if (cmd.equals("RESFRIEND")) {// 친구신청수락. 받는이가 멤
			url = "/main?cmd=FRIENDS";
			
			String fremail = req.getParameter("femail");
			System.out.println(fremail);
			friendDTO = memberDAO.getInfo(fremail);
			friend_id = friendDTO.getMember_id();
			
			friendsDAO.AllowFriend(member_id, friend_id );
		} else if (cmd.equals("DELETEFRIEND")) {// 친구 삭제. 둘다 삭제됨.
			url = "/main?cmd=FRIENDS";

			String fremail = req.getParameter("femail");
			System.out.println(fremail);
			friendDTO = memberDAO.getInfo(fremail);
			friend_id = friendDTO.getMember_id();
			System.out.println("del");
			friendsDAO.DeleteFriend( member_id,friend_id);// 멤버, 친구 둘다 삭제됨.
			// 친구신청삭제, 기존 친구 삭제

		} else{
			
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
