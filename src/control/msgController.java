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
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
//		System.out.println("test");
		msgDAO msgDAO = new msgDAO();
	//�⺻������ �α��� �� �� �;ߵǹǷ� ���� dto�� ȸ�� ������ �־�� ��. 
		HttpSession session = req.getSession();
		//��, ���ǿ� �ö�� ��� ���� ȣ��.
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		
		//�׽�Ʈ��.
		memberDTO=msgDAO.MemberInfo("2");
		session.setAttribute("memberDTO", memberDTO);
		
		if(memberDTO==null){
			//������ ���� �޼��� ������ ��.
		}
		
		Vector vList = null;
		String cmd = req.getParameter("cmd");
		
		
		String url="";;
		if(cmd.equals("MSGLIST")){
			vList = msgDAO.msgList(memberDTO.getMember_id());
			session.setAttribute("msgList", vList);
			url="/message/msglist.jsp";
	}
		System.out.println(url);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

		
	}

}
