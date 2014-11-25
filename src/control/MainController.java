package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.fileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDAO;
import dao.ChartDAO;
import dao.MapDAO;
import dao.MemberDAO;
import dto.BoardDTO;
import dto.ChartDTO;
import dto.MapDTO;
import dto.MemberDTO;
import dto.ReplyDTO;
import encode.Encode;

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
		// System.out.println("maincont");
		String url = "";
		double gis_x = 0.0, gis_y = 0.0;
		String loc_name = null;
		String cmd = req.getParameter("cmd");
		HttpSession session = req.getSession();

		MemberDAO memberDAO = new MemberDAO();
		BoardDAO boardDAO = new BoardDAO();
		MapDAO mapDAO = new MapDAO();
		ChartDAO chartDAO = new ChartDAO();
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberDTO");
		BoardDTO boardDTO = null;
		MapDTO mapDTO = null;
		ChartDTO chartDTO = null;
		ReplyDTO replyDTO = null;

		Vector memboardList = null;
		Vector boardList = null;
		Vector chartList = null;

		// 글목록 불러오기
		if (mdto != null) {
			boardList = boardDAO.BoradList(mdto.getMember_id());
			req.setAttribute("boardList", boardList);
		}
		// 커맨드 분기 시작점.
		if (cmd == null || cmd.equals("INDEX")) {// 메인

			url = "/index.jsp";
		} else if (cmd.equals("ABOUTUS")) {// 메인의 소개글.
			url = "/board/aboutus.jsp";
		}
		// 로그인 부분
		else if (cmd.equals("LOGINPROC")) {// 로그인 프록시
			url = "/Join_v1/login_Proc.jsp";

		} else if (cmd.equals("REPASS")) {// 로그인 프록시
			url = "/Join_v1/passReset.jsp";
		} else if (cmd.equals("PASSUPDATE")) {// 로그인 프록시
			url = "/Join_v1/passUpdate.jsp";

		} else if (cmd.equals("PASSRESETCHK")) {// 비밀번호 변경을 위해 개인정보 체크
			String chkEmail = req.getParameter("email");
			String chkPhone = req.getParameter("phone_number");
			System.out.println("체크" + chkEmail + ", " + chkPhone);
			req.setAttribute("email", chkEmail);

			boolean flag = memberDAO.checkReset(chkEmail, chkPhone);
			System.out.println("정보체크" + flag);

			req.setAttribute("flag", flag);
			url = "/Join_v1/passResetChk.jsp";
		} else if (cmd.equals("PASSEDIT")) {// 비밀번호 변경
			String email = req.getParameter("email");
			String password = req.getParameter("newpassword1");
			password = Encode.encrypt(password);

			System.out.println("비밀번호 변경" + email);
			System.out.println("비밀번호 변경" + password);

			memberDAO.updatePass(email, password);

			url = "/Join_v1/passEditComplete.jsp";
		}
		// 회원 정보 조회/ 수정
		else if (cmd.equals("MEMINFO")) {// 회원정보 조회/수정창
			// System.out.println("meminfo");
			url = "/Join_v1/EditMember.jsp";
		} else if (cmd.equals("EDITINFO")) {// 정보 수정
			// System.out.println("editinfo");
			// model이동해야함.

			String pass = req.getParameter("password");
			pass = Encode.encrypt(pass);
			// 기존 비밀번호 암호화

			String npass = req.getParameter("newpassword1");
			npass = Encode.encrypt(npass);
			// 새로운 비밀번호 암호화

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
		// 회원 탈퇴
		else if (cmd.equals("DELETEMEM")) {// 삭제확인창
			// System.out.println("deletemem");
			String email = req.getParameter("email");
			req.setAttribute("email", email);
			url = "/Join_v1/deletemember.jsp";
		} else if (cmd.equals("DELETEMEMPROC")) {// 삭제
			// System.out.println("deletememproc");
			String email = req.getParameter("email");
			String pass = req.getParameter("password");
			pass = Encode.encrypt(pass);
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

		// 로그아웃
		else if (cmd.equals("LOGOUT")) {// 로그아웃
			// model?
			url = "/Join_v1/logout_Proc.jsp";
		}
		// 회원 가입
		else if (cmd.equals("JOIN")) {// 회원가입:메일중복검사
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

		// 메세지 보드
		else if (cmd.equals("MSGLIST")) {// 쪽지글목록 보기
			// 보드 아이디 받아서 보내야함. .
			url = "msg?cmd=MSGLIST";
		}

		// 친구 관리
		else if (cmd.equals("FRIENDS")) {// 친구 목록/추가
			url = "friends?cmd=FRIENDS";
		}

		// 글 보기
		else if (cmd.equals("CONTENT")) {// 글 보기
			// 보드 아이디 받아서 보내야함. .
			boardDTO = boardDAO.GetBoard(Integer.parseInt(req.getParameter(
					"board_id").trim()));
			req.setAttribute("boardDTO", boardDTO);
			// 리플 정보도 보내기
			Vector replyList = boardDAO.GetReply(Integer.parseInt(req
					.getParameter("board_id")));
			req.setAttribute("replyList", replyList);
			// 지도정보
			mapDTO = mapDAO.getMap(boardDTO.getLoc_id());
			req.setAttribute("mapDTO", mapDTO);
			// 차트정보
			chartList = chartDAO.getChart(boardDTO.getBoard_id());
			req.setAttribute("chartList", chartList);

			url = "/board/Read.jsp";

			// 지도 검색
		} else if (cmd.equals("MAP")) {
			url = "/map/map.jsp";

			// 검색 결과
		} else if (cmd.equals("MAPINFO")) {
			gis_x = Double.valueOf(req.getParameter("gis_x"));
			gis_y = Double.valueOf(req.getParameter("gis_y"));
			loc_name = req.getParameter("loc_name");

			int cnt = mapDAO.chkMap(gis_x, gis_y);
			if (cnt == 0) {
				mapDAO.addMap(gis_x, gis_y, loc_name);
				// System.out.println("추가됨.");
			}
			mapDTO = mapDAO.getMap(gis_x, gis_y, loc_name);
			req.setAttribute("mapDTO", mapDTO);

			// System.out.println("꺼내온거:"+mapDTO.getLoc_id());
			memboardList = boardDAO.membermapBoradList(mdto.getMember_id(),
					mapDTO.getLoc_id());
			req.setAttribute("memboardList", memboardList);
			url = "/map/mapinfo.jsp";

			// 리플 작성
		} else if (cmd.equals("POSTREPLY")) {
			replyDTO = new ReplyDTO();
			replyDTO.setBoard_id(Integer.parseInt(req.getParameter("board_id")));
			replyDTO.setMember_id(mdto.getMember_id());
			replyDTO.setReply_text(req.getParameter("reply_text"));
			boardDAO.insertReply(replyDTO);
			url = "/main?cmd=CONTENT&board_id=" + req.getParameter("board_id");
			// 리플 삭제
		} else if (cmd.equals("DELREPLY")) {
			int reply_id = Integer.parseInt(req.getParameter("reply_id"));
			boardDAO.delReply(reply_id);
			url = "/main?cmd=CONTENT&board_id=" + req.getParameter("board_id");

			// 글쓰기
		} else if (cmd.equals("POST")) {
			int loc_id = Integer.parseInt(req.getParameter("loc_id"));

			mapDTO = mapDAO.getMap(loc_id);
			req.setAttribute("mapDTO", mapDTO);
			url = "/board/post.jsp";

			// 글 입력프로세스.
		} else if (cmd.equals("POSTPROC")) {

			// 파일 저장.
			ServletContext ctx = req.getServletContext();
			String path = ctx.getRealPath("/upload");
			System.out.println(path);
			int maxSize = 10 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(req, path, maxSize,
					"utf-8", new DefaultFileRenamePolicy());
			// 입력 값을 보드에 추가.
			int loc_id = (Integer.parseInt(multi.getParameter("loc_id")));
			boardDTO = new BoardDTO();
			boardDTO.setTitle(multi.getParameter("title"));
			boardDTO.setTextarea(multi.getParameter("textarea"));
			boardDTO.setPhoto(multi.getFilesystemName("photo"));
			boardDTO.setLoc_id(loc_id);
			boardDTO.setMember_id(mdto.getMember_id());
			boardDAO.insertBoard(boardDTO);

			// 보드 id 가져옴
			// 일단 지역+아이디 조합으로는 글이 하나만 나오니까 이렇게. 이후에 여러개 달 때를 준비할 필요.
			Vector v = boardDAO.membermapBoradList(mdto.getMember_id(), loc_id);
			boardDTO = (BoardDTO) v.get(0);
			req.setAttribute("boardDTO", boardDTO);
			// System.out.println(req.getParameter("value1"));
			// 차트 입력(보드id 필요)
			String title1 = multi.getParameter("title1");
			String key1[] = multi.getParameterValues("key1");
			String value1[] = null;
			if (multi.getParameterValues("value1") != null) {
				value1 = multi.getParameterValues("value1");
			} else {
				for (int i = 0; i < key1.length; i++) {
					value1 = new String[key1.length];
					value1[i] = "0";
				}
			}
			if (title1 != "") {
				for (int i = 0; i < key1.length; i++) {
					chartDTO = new ChartDTO();
					chartDTO.setEva_type(title1);
					chartDTO.setLoc_id(loc_id);
					chartDTO.setBoard_id(boardDTO.getBoard_id());
					chartDTO.setEva_key(key1[i]);
					chartDTO.setEva_value(Integer.parseInt(value1[i]) * 10);
					chartDAO.insertChart(chartDTO);
				}
			}

			url = "/main?cmd=INDEX";
//글 삭제
		} else if (cmd.equals("DELBOARD")) {
			boardDAO.delBoard(Integer.parseInt(req.getParameter("board_id")));
	
			url = "/main?cmd=INDEX";

			
			// 게임보드 글 쓰기.
		} else if (cmd.equals("pqWrite")) {
			url = "pq_board?cmd=write";
		}
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
