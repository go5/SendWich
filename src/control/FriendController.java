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
		

		// 기본적으로 로그인 된 후 와야되므로 세션 dto에 회원 정보가 있어야 함.
		// 즉, 세션에 올라온 멤버 정보 호출.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");

		if (memberDTO == null) {
			url = "error/NeedLogin.html";
			RequestDispatcher view = req.getRequestDispatcher(url);
			view.forward(req, resp);
		}

		// System.out.println("cmd: " + cmd);
		

		// 접근 조건 판별 메인에서 FRIENDS로 오면 기본접속됨.
		// 창 이동이 없으므로 아래는 기본 값.
		
		String femail = req.getParameter("femail");
		friendDTO = memberDAO.getInfo(femail);
		int sender_id = memberDTO.getMember_id();
		int reciever_id = friendDTO.getMember_id();
		url = "/friends/FriendList.jsp";
		
		// 친구 목록 정보 호출.
		fList = friendsDAO.FriendsInfo(memberDTO.getMember_id());
		session.setAttribute("friendsList", fList);
		
		if (req.getParameter("frSearch") != null) {// 검색시 결과 출력.
			String email = req.getParameter("frSearch");
			System.out.println(email);
			friendDTO = memberDAO.getInfo(email);
			req.setAttribute("searchfriend", friendDTO);
		}
		//수락할 친구 신청 목록 출력
		inviteList = friendsDAO.FriendResponse(memberDTO.getMember_id());
		req.setAttribute("inviteList", inviteList);
		
		
		// cmd 분기
		cmd=req.getParameter("cmd");
		if (cmd.equals("INVITEFRIEND")) {// 친구 신청. 보내는사람이 멤버
			friendsDAO.InviteFriend(sender_id, reciever_id);
		} else if (cmd.equals("RESFRIEND")) {// 친구신청수락. 받는이가 멤
			friendsDAO.AllowFriend(reciever_id,sender_id);
		} else if (cmd.equals("DELETEFRIEND")) {// 친구 삭제. 둘다 삭제됨.
			friendsDAO.DeleteFriend(reciever_id,sender_id);//멤버, 친구 둘다 삭제됨.
			// 친구신청삭제, 기존 친구 삭제
		} else {
			// 비정상접근 메세지.
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
