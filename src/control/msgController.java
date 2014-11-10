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
		//System.out.println("entercontroller");
		msgDAO msgDAO = new msgDAO();
		HttpSession session = req.getSession();
		MemberDTO memberDTO;
		String url = "";
		;

		// �⺻������ �α��� �� �� �;ߵǹǷ� ���� dto�� ȸ�� ������ �־�� ��.
		// ��, ���ǿ� �ö�� ��� ���� ȣ��.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");

		// �׽�Ʈ��.
		memberDTO = msgDAO.MemberInfo(1);
		session.setAttribute("memberDTO", memberDTO);

		if (memberDTO == null) {
			// ������ ���� �޼��� ������ ��.
		}

		Vector vList = null;// �۸��
		Vector fList = null;// ģ�����
		String cmd = req.getParameter("cmd");


		// ���� ���� �Ǻ�
		if (cmd.equals("MSGLIST")) {
			vList = msgDAO.msgList(memberDTO.getMember_id());
			session.setAttribute("msgList", vList);
			url = "/message/msglist.jsp";
		} else if (cmd.equals("MSGWRITE")) {
			fList = msgDAO.FriendsInfo(memberDTO.getMember_id());
			// System.out.println(fList.size());
			session.setAttribute("FriendsList", fList);
			url = "/message/write.jsp";
		} else if (cmd.equals("MSGSEND")) {
			//System.out.println("sendmsg");

			msgDAO.SendMessage(Integer.parseInt(req.getParameter("friend_id")),
					(req.getParameter("msg_text")), memberDTO.getMember_id());
			url = "/message/writeProc.jsp"; // �ܺ�â���� �����Ƿ� �̵��� �ʿ� ����.
		}else if (cmd.equals("MSGDELETE")) {
			//System.out.println("deletemsg");
			msgDAO.DeleteMessage(req.getParameter("msg_ids"));
			url = "/message/deleteProc.jsp";
		}else{
			//���������� �޼���.
		}
		
		//System.out.println(url);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
