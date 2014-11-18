package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dao.MemberDAO;
import dto.BoardDTO;
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
		//System.out.println("maincont");
		String url = "";
		String cmd = req.getParameter("cmd");
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberDTO");
		MemberDAO memberDAO = new MemberDAO();
		BoardDAO boardDAO = new BoardDAO();
		Vector boardList= null;
	//글목록 불러오기	
		if(mdto!=null){
		boardList = boardDAO.BoradList(mdto.getMember_id());
		req.setAttribute("boardList", boardList);
		}
		
		if (cmd == null || cmd.equals("INDEX")) {//메인
			
			url = "/index.jsp";
		}
		//로그인 부분
		else if (cmd.equals("LOGINPROC")) {//로그인 프록시
			System.out.println("loginproc");
			url = "/Join_v1/login_Proc.jsp";
		}
		//회원 정보 조회/ 수정
		else if (cmd.equals("MEMINFO")) {//회원정보 조회/수정창
			//System.out.println("meminfo");
			url = "/Join_v1/EditMember.jsp";
		}else if (cmd.equals("EDITINFO")) {//정보 수정
			//System.out.println("editinfo");
			// model이동해야함.
			String pass = req.getParameter("password");
			String npass = req.getParameter("newpassword1");
			String email = req.getParameter("email");
			// 비번 검증
			boolean flag = memberDAO.checkPass(email, pass);
			// 신규 입력 비번이 있으면 비번 변경.
			if (npass != null && npass.length() >= 4) {
				pass = npass;
			}
			// 검증에 따른 처리
			if (flag) {// 비번이 맞으면 수정을 진행.
				mdto.setName(req.getParameter("name"));
				mdto.setPassword(pass);
				mdto.setPhone_number(req.getParameter("phone_number"));
				mdto.setEmail(email);
				memberDAO.updateMember(mdto);
			}
			req.setAttribute("flag", flag);
			url = "/Join_v1/editmember_Proc.jsp";
		} 
		//회원 탈퇴
		else if (cmd.equals("DELETEMEM")) {//삭제확인창
			//System.out.println("deletemem");
			String email = req.getParameter("email");
			req.setAttribute("email", email);
			url = "/Join_v1/deletemember.jsp";
		} else if (cmd.equals("DELETEMEMPROC")) {//삭제
			//System.out.println("deletememproc");
			String email = req.getParameter("email");
			String pass = req.getParameter("password");
			// 비번 검증
			boolean flag = memberDAO.checkPass(email, pass);
			// 검증에 따른 처리
			if (flag) {// 비번이 맞으면 삭제을 진행.
				memberDAO.deleteMember(email);
				req.removeAttribute("memberDTO");
			}
			req.setAttribute("flag", flag);
			url = "/Join_v1/deletemember_Proc.jsp";
		}  
		//로그아웃
		else if (cmd.equals("LOGOUT")) {//로그아웃
			// model?
			url = "/Join_v1/logout_Proc.jsp";
		} 
		//회원 가입
		else if (cmd.equals("JOIN")) {//회원가입:메일중복검사
			url = "/Join_v1/Emaildup.jsp";
		} else if (cmd.equals("VALIDEMAIL")) {// 메일 중복 검사
			// model로 이전해야함.
			url = "/Join_v1/emaildup_Proc.jsp";
		} else if (cmd.equals("CONJOIN")) {// 회원정보 입력
			url = "/Join_v1/join.jsp";
		} else if (cmd.equals("REGMEM")) {// 등록
			// modelization 해야됨.
			url = "/Join_v1/join_Proc.jsp";
		} 
		//메세지 보드
		else if (cmd.equals("MSGLIST")) {// 쪽지글목록 보기
			// 보드 아이디 받아서 보내야함. .
			url = "msg?cmd=MSGLIST";
		}
		
		//친구 관리
		else if (cmd.equals("FRIENDS")) {//친구 목록/추가
			url = "friends?cmd=FRIENDS";
		} 
		//글 보기
		else if (cmd.equals("CONTENT")) {// 글 보기 
			// 보드 아이디 받아서 보내야함. .
			BoardDTO boardDTO = boardDAO.GetBoard(Integer.parseInt(req.getParameter("board_id")));
			req.setAttribute("boardDTO", boardDTO);
			url = "/board/Read.jsp";
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
