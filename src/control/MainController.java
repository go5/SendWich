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
		if (cmd == null || cmd.equals("INDEX")) {
			url = "/index.jsp";
		} else if (cmd.equals("LOGIN")) {
			System.out.println("login");
			url = "/Join_v1/login.jsp";
		} else if (cmd.equals("LOGINPROC")) {
			System.out.println("loginproc");
			url = "/Join_v1/login_Proc.jsp";
		} else if (cmd.equals("MEMINFO")) {
			System.out.println("meminfo");
			url = "/Join_v1/EditMember.jsp";
		} else if (cmd.equals("EDITINFO")) {
			System.out.println("editinfo");
			// model이동해야함.
			String pass = req.getParameter("password");
			String npass = req.getParameter("newpassword1");
			String email = req.getParameter("email");
			// 비번 검증
			boolean flag = memberDAO.checkPass(email, pass);
			// 신규 입력 비번이 있으면 비번 변경.
			if (npass != null && npass.length() >= 4 ) {
				pass = npass;
			}
			// 검증에 따른 처리
			if (flag) {//비번이 맞으면 수정을 진행.
				mdto.setName(req.getParameter("name"));
				mdto.setPassword(pass);
				mdto.setPhone_number(req.getParameter("phone_number"));
				mdto.setEmail(email);
				memberDAO.updateMember(mdto);
			}
			
			req.setAttribute("flag", flag);
			url = "/Join_v1/editmember_Proc.jsp";
		} else if (cmd.equals("LOGOUT")) {
			// model?
			url = "/Join_v1/logout_Proc.jsp";
		} else if (cmd.equals("JOIN")) {// 메일 입력 창으로
			url = "/Join_v1/Emaildup.jsp";
		} else if (cmd.equals("VALIDEMAIL")) {// 검증
			// model로 이전해야함.
			url = "/Join_v1/emaildup_Proc.jsp";
		} else if (cmd.equals("CONJOIN")) {// 회원정보 입력
			url = "/Join_v1/join.jsp";
		} else if (cmd.equals("REGMEM")) {// 등록
			// modelization 해야됨.
			url = "/Join_v1/join_Proc.jsp";
		}
		else if (cmd.equals("MSGLIST")) {// 쪽지글 보기
			// 보드 아이디 받아서 보내야함. .
			url = "msg?cmd=MSGLIST";
		}

		else if (cmd.equals("FRIENDS")) {// 
			url = "friends?cmd=FRIENDS";
		}
		else if (cmd.equals("CONTENT")) {// 글 보기
			// 보드 아이디 받아서 보내야함. .
			url = "/board/Read.jsp";
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
