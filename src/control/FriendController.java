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

		// �⺻������ �α��� �� �� �;ߵǹǷ� ���� dto�� ȸ�� ������ �־�� ��.
		// ��, ���ǿ� �ö�� ��� ���� ȣ��.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");

		if (memberDTO == null) {
			// ������ ���� �޼��� ������ ��.
		}

		Vector vList = null;// �۸��
		Vector fList = null;// ģ�����
		String cmd = req.getParameter("cmd");


		// ���� ���� �Ǻ�
		if (cmd.equals("FRIENDS")) {//������ ģ�� ���.
			url = "/friends/FriendList.jsp";
		} else if (cmd.equals("")) {
			url = "/message/write.jsp";
		} else{
			//���������� �޼���.
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
