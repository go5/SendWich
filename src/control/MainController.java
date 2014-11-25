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

		// �۸�� �ҷ�����
		if (mdto != null) {
			boardList = boardDAO.BoradList(mdto.getMember_id());
			req.setAttribute("boardList", boardList);
		}
		// Ŀ�ǵ� �б� ������.
		if (cmd == null || cmd.equals("INDEX")) {// ����

			url = "/index.jsp";
		} else if (cmd.equals("ABOUTUS")) {// ������ �Ұ���.
			url = "/board/aboutus.jsp";
		}
		// �α��� �κ�
		else if (cmd.equals("LOGINPROC")) {// �α��� ���Ͻ�
			url = "/Join_v1/login_Proc.jsp";

		} else if (cmd.equals("REPASS")) {// �α��� ���Ͻ�
			url = "/Join_v1/passReset.jsp";
		} else if (cmd.equals("PASSUPDATE")) {// �α��� ���Ͻ�
			url = "/Join_v1/passUpdate.jsp";

		} else if (cmd.equals("PASSRESETCHK")) {// ��й�ȣ ������ ���� �������� üũ
			String chkEmail = req.getParameter("email");
			String chkPhone = req.getParameter("phone_number");
			System.out.println("üũ" + chkEmail + ", " + chkPhone);
			req.setAttribute("email", chkEmail);

			boolean flag = memberDAO.checkReset(chkEmail, chkPhone);
			System.out.println("����üũ" + flag);

			req.setAttribute("flag", flag);
			url = "/Join_v1/passResetChk.jsp";
		} else if (cmd.equals("PASSEDIT")) {// ��й�ȣ ����
			String email = req.getParameter("email");
			String password = req.getParameter("newpassword1");
			password = Encode.encrypt(password);

			System.out.println("��й�ȣ ����" + email);
			System.out.println("��й�ȣ ����" + password);

			memberDAO.updatePass(email, password);

			url = "/Join_v1/passEditComplete.jsp";
		}
		// ȸ�� ���� ��ȸ/ ����
		else if (cmd.equals("MEMINFO")) {// ȸ������ ��ȸ/����â
			// System.out.println("meminfo");
			url = "/Join_v1/EditMember.jsp";
		} else if (cmd.equals("EDITINFO")) {// ���� ����
			// System.out.println("editinfo");
			// model�̵��ؾ���.

			String pass = req.getParameter("password");
			pass = Encode.encrypt(pass);
			// ���� ��й�ȣ ��ȣȭ

			String npass = req.getParameter("newpassword1");
			npass = Encode.encrypt(npass);
			// ���ο� ��й�ȣ ��ȣȭ

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
		}
		// ȸ�� Ż��
		else if (cmd.equals("DELETEMEM")) {// ����Ȯ��â
			// System.out.println("deletemem");
			String email = req.getParameter("email");
			req.setAttribute("email", email);
			url = "/Join_v1/deletemember.jsp";
		} else if (cmd.equals("DELETEMEMPROC")) {// ����
			// System.out.println("deletememproc");
			String email = req.getParameter("email");
			String pass = req.getParameter("password");
			pass = Encode.encrypt(pass);
			// ��� ����
			boolean flag = memberDAO.checkPass(email, pass);
			// ������ ���� ó��
			if (flag) {// ����� ������ ������ ����.
				memberDAO.deleteMember(email);
				req.removeAttribute("memberDTO");
			}
			req.setAttribute("flag", flag);
			url = "/Join_v1/deletemember_Proc.jsp";
		}

		// �α׾ƿ�
		else if (cmd.equals("LOGOUT")) {// �α׾ƿ�
			// model?
			url = "/Join_v1/logout_Proc.jsp";
		}
		// ȸ�� ����
		else if (cmd.equals("JOIN")) {// ȸ������:�����ߺ��˻�
			url = "/Join_v1/Emaildup.jsp";
		} else if (cmd.equals("VALIDEMAIL")) {// ���� �ߺ� �˻�
			// model�� �����ؾ���.
			url = "/Join_v1/emaildup_Proc.jsp";
		} else if (cmd.equals("CONJOIN")) {// ȸ������ �Է�
			url = "/Join_v1/join.jsp";
		} else if (cmd.equals("REGMEM")) {// ���
			// modelization �ؾߵ�.
			url = "/Join_v1/join_Proc.jsp";
		}

		// �޼��� ����
		else if (cmd.equals("MSGLIST")) {// �����۸�� ����
			// ���� ���̵� �޾Ƽ� ��������. .
			url = "msg?cmd=MSGLIST";
		}

		// ģ�� ����
		else if (cmd.equals("FRIENDS")) {// ģ�� ���/�߰�
			url = "friends?cmd=FRIENDS";
		}

		// �� ����
		else if (cmd.equals("CONTENT")) {// �� ����
			// ���� ���̵� �޾Ƽ� ��������. .
			boardDTO = boardDAO.GetBoard(Integer.parseInt(req.getParameter(
					"board_id").trim()));
			req.setAttribute("boardDTO", boardDTO);
			// ���� ������ ������
			Vector replyList = boardDAO.GetReply(Integer.parseInt(req
					.getParameter("board_id")));
			req.setAttribute("replyList", replyList);
			// ��������
			mapDTO = mapDAO.getMap(boardDTO.getLoc_id());
			req.setAttribute("mapDTO", mapDTO);
			// ��Ʈ����
			chartList = chartDAO.getChart(boardDTO.getBoard_id());
			req.setAttribute("chartList", chartList);

			url = "/board/Read.jsp";

			// ���� �˻�
		} else if (cmd.equals("MAP")) {
			url = "/map/map.jsp";

			// �˻� ���
		} else if (cmd.equals("MAPINFO")) {
			gis_x = Double.valueOf(req.getParameter("gis_x"));
			gis_y = Double.valueOf(req.getParameter("gis_y"));
			loc_name = req.getParameter("loc_name");

			int cnt = mapDAO.chkMap(gis_x, gis_y);
			if (cnt == 0) {
				mapDAO.addMap(gis_x, gis_y, loc_name);
				// System.out.println("�߰���.");
			}
			mapDTO = mapDAO.getMap(gis_x, gis_y, loc_name);
			req.setAttribute("mapDTO", mapDTO);

			// System.out.println("�����°�:"+mapDTO.getLoc_id());
			memboardList = boardDAO.membermapBoradList(mdto.getMember_id(),
					mapDTO.getLoc_id());
			req.setAttribute("memboardList", memboardList);
			url = "/map/mapinfo.jsp";

			// ���� �ۼ�
		} else if (cmd.equals("POSTREPLY")) {
			replyDTO = new ReplyDTO();
			replyDTO.setBoard_id(Integer.parseInt(req.getParameter("board_id")));
			replyDTO.setMember_id(mdto.getMember_id());
			replyDTO.setReply_text(req.getParameter("reply_text"));
			boardDAO.insertReply(replyDTO);
			url = "/main?cmd=CONTENT&board_id=" + req.getParameter("board_id");
			// ���� ����
		} else if (cmd.equals("DELREPLY")) {
			int reply_id = Integer.parseInt(req.getParameter("reply_id"));
			boardDAO.delReply(reply_id);
			url = "/main?cmd=CONTENT&board_id=" + req.getParameter("board_id");

			// �۾���
		} else if (cmd.equals("POST")) {
			int loc_id = Integer.parseInt(req.getParameter("loc_id"));

			mapDTO = mapDAO.getMap(loc_id);
			req.setAttribute("mapDTO", mapDTO);
			url = "/board/post.jsp";

			// �� �Է����μ���.
		} else if (cmd.equals("POSTPROC")) {

			// ���� ����.
			ServletContext ctx = req.getServletContext();
			String path = ctx.getRealPath("/upload");
			System.out.println(path);
			int maxSize = 10 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(req, path, maxSize,
					"utf-8", new DefaultFileRenamePolicy());
			// �Է� ���� ���忡 �߰�.
			int loc_id = (Integer.parseInt(multi.getParameter("loc_id")));
			boardDTO = new BoardDTO();
			boardDTO.setTitle(multi.getParameter("title"));
			boardDTO.setTextarea(multi.getParameter("textarea"));
			boardDTO.setPhoto(multi.getFilesystemName("photo"));
			boardDTO.setLoc_id(loc_id);
			boardDTO.setMember_id(mdto.getMember_id());
			boardDAO.insertBoard(boardDTO);

			// ���� id ������
			// �ϴ� ����+���̵� �������δ� ���� �ϳ��� �����ϱ� �̷���. ���Ŀ� ������ �� ���� �غ��� �ʿ�.
			Vector v = boardDAO.membermapBoradList(mdto.getMember_id(), loc_id);
			boardDTO = (BoardDTO) v.get(0);
			req.setAttribute("boardDTO", boardDTO);
			// System.out.println(req.getParameter("value1"));
			// ��Ʈ �Է�(����id �ʿ�)
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
//�� ����
		} else if (cmd.equals("DELBOARD")) {
			boardDAO.delBoard(Integer.parseInt(req.getParameter("board_id")));
	
			url = "/main?cmd=INDEX";

			
			// ���Ӻ��� �� ����.
		} else if (cmd.equals("pqWrite")) {
			url = "pq_board?cmd=write";
		}
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
