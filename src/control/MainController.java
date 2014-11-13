package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

public class MainController extends HttpServlet {

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
		System.out.println("maincont");
		String url = "";
		String cmd = req.getParameter("cmd");
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberDTO");
		MemberDAO memberDAO = new MemberDAO();
		if (cmd == null || cmd.equals("INDEX")) {//����
			url = "/index.jsp";
		} else if (cmd.equals("LOGIN")) {//�α���
			System.out.println("login");
			url = "/Join_v1/login.jsp";
		} else if (cmd.equals("LOGINPROC")) {//�α��� ���Ͻ�
			System.out.println("loginproc");
			url = "/Join_v1/login_Proc.jsp";
		} else if (cmd.equals("MEMINFO")) {//ȸ������ ��ȸ/����â
			System.out.println("meminfo");
			url = "/Join_v1/EditMember.jsp";
		}else if (cmd.equals("EDITINFO")) {//���� ����
			System.out.println("editinfo");
			// model�̵��ؾ���.
			String pass = req.getParameter("password");
			String npass = req.getParameter("newpassword1");
			String email = req.getParameter("email");
			// ��� ����
			boolean flag = memberDAO.checkPass(email, pass);
			// �ű� �Է� ����� ������ ��� ����.
			if (npass != null && npass.length() >= 4) {
				pass = npass;
			}
			// ������ ���� ó��
			if (flag) {// ����� ������ ������ ����.
				mdto.setName(req.getParameter("name"));
				mdto.setPassword(pass);
				mdto.setPhone_number(req.getParameter("phone_number"));
				mdto.setEmail(email);
				memberDAO.updateMember(mdto);
			}
			req.setAttribute("flag", flag);
			url = "/Join_v1/editmember_Proc.jsp";
		} else if (cmd.equals("DELETEMEM")) {//����Ȯ��â
			System.out.println("deletemem");
			String email = req.getParameter("email");
			req.setAttribute("email", email);
			url = "/Join_v1/deletemember.jsp";
		} else if (cmd.equals("DELETEMEMPROC")) {//����
			System.out.println("deletememproc");
			String email = req.getParameter("email");
			String pass = req.getParameter("password");
			// ��� ����
			boolean flag = memberDAO.checkPass(email, pass);
			// ������ ���� ó��
			if (flag) {// ����� ������ ������ ����.
				memberDAO.deleteMember(email);
				req.removeAttribute("memberDTO");
			}
			req.setAttribute("flag", flag);
			url = "/Join_v1/deletemember_Proc.jsp";
		}  else if (cmd.equals("LOGOUT")) {//�α׾ƿ�
			// model?
			url = "/Join_v1/logout_Proc.jsp";
		} else if (cmd.equals("JOIN")) {//ȸ������:�����ߺ��˻�
			url = "/Join_v1/Emaildup.jsp";
		} else if (cmd.equals("VALIDEMAIL")) {// ���� �ߺ� �˻�
			// model�� �����ؾ���.
			url = "/Join_v1/emaildup_Proc.jsp";
		} else if (cmd.equals("CONJOIN")) {// ȸ������ �Է�
			url = "/Join_v1/join.jsp";
		} else if (cmd.equals("REGMEM")) {// ���
			// modelization �ؾߵ�.
			url = "/Join_v1/join_Proc.jsp";
		} else if (cmd.equals("MSGLIST")) {// �����۸�� ����
			// ���� ���̵� �޾Ƽ� ��������. .
			url = "msg?cmd=MSGLIST";
		}
		else if (cmd.equals("FRIENDS")) {//ģ�� ���/�߰�
			url = "friends?cmd=FRIENDS";
		} else if (cmd.equals("CONTENT")) {// �� ����
			// ���� ���̵� �޾Ƽ� ��������. .
			url = "/board/Read.jsp";
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}