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
		String cmd = req.getParameter("cmd");
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberDTO");
		MemberDAO memberDAO = new MemberDAO();
		BoardDAO boardDAO = new BoardDAO();
		Vector boardList = null;
		BoardDTO boardDTO = null;
		MapDAO mapDAO = new MapDAO();
		MapDTO mapDTO = null;
		Vector memboardList = null;
		double gis_x = 0.0, gis_y = 0.0;
		String loc_name = null;

		// �۸�� �ҷ�����
		if (mdto != null) {
			boardList = boardDAO.BoradList(mdto.getMember_id());
			req.setAttribute("boardList", boardList);
		}

		if (cmd == null || cmd.equals("INDEX")) {// ����

			url = "/index.jsp";
		} else if (cmd.equals("ABOUTUS")) {// ������ �Ұ���.
			url = "/board/aboutus.jsp";
		}
		// �α��� �κ�
		else if (cmd.equals("LOGINPROC")) {// �α��� ���Ͻ�
			url = "/Join_v1/login_Proc.jsp";
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
			boardDTO = boardDAO.GetBoard(Integer.parseInt(req
					.getParameter("board_id")));
			req.setAttribute("boardDTO", boardDTO);
			// ���� ������ ������
			Vector replyList = boardDAO.GetReply(Integer.parseInt(req
					.getParameter("board_id")));
			req.setAttribute("replyList", replyList);

			url = "/board/Read.jsp";
		} else if (cmd.equals("MAP")) {
			url = "/map/map.jsp";
		} else if (cmd.equals("MAPINFO")) {
			gis_x = Double.valueOf(req.getParameter("gis_x"));
			gis_y = Double.valueOf(req.getParameter("gis_y"));
			loc_name = req.getParameter("loc_name");
			int cnt = mapDAO.chkMap(gis_x, gis_y);
			if (cnt == 0) {
				mapDAO.addMap(gis_x, gis_y, loc_name);
				//System.out.println("�߰���.");
			}
			mapDTO = mapDAO.getMap(gis_x, gis_y, loc_name);
			//System.out.println("�����°�:"+mapDTO.getLoc_id());
			memboardList = boardDAO.membermapBoradList(mdto.getMember_id(),
					mapDTO.getLoc_id());
			req.setAttribute("memboardList", memboardList);
			req.setAttribute("mapDTO", mapDTO);
			url = "/map/mapinfo.jsp";

		} else if (cmd.equals("POST")) {
			url = "/board/post.jsp";
		} else if (cmd.equals("POSTPROC")) {

			gis_x = Double.valueOf(req.getParameter("gis_x"));
			gis_y = Double.valueOf(req.getParameter("gis_y"));
			loc_name = req.getParameter("loc_name");
			mapDTO = mapDAO.getMap(gis_x, gis_y, loc_name);
			
			
			// �۾����Է� ���� locid�� �߱޵�.
			// ���� ������ �������� id �ҷ��� dto�� �ְ� �μ�Ʈ.
			boardDTO = new BoardDTO();
			boardDTO.setTitle(req.getParameter("title"));
			boardDTO.setTextarea(req.getParameter("textarea"));
			boardDTO.setPhoto(req.getParameter("photo"));
			boardDTO.setLoc_id(mapDTO.getLoc_id());
			boardDTO.setMember_id(mdto.getMember_id());
			boardDAO.insertBoard(boardDTO);
			//�ϴ� ����+���̵� �������δ� ���� �ϳ��� �����ϱ� �̷���. ���Ŀ� ������ �� ���� �غ��� �ʿ�.
			Vector v = boardDAO.membermapBoradList(mdto.getMember_id(), mapDTO.getLoc_id());
			boardDTO = (BoardDTO)v.get(0); 
			req.setAttribute("boardDTO", boardDTO);
			
			//���Է� �� ��Ʈ �Է�.
			ChartDAO chartDAO = new ChartDAO();
			ChartDTO chartDTO = null;
			String title1 = req.getParameter("title1");
			String key1[] = req.getParameterValues("key1");
			String value1[] = req.getParameterValues("value1");
			
		loc_id �� ������... map mapinfo proc ���� Ȯ��!
			if(title1 != ""){
				for(int i =0; i<key1.length; i++){
					chartDTO = new ChartDTO();
					chartDTO.setEva_type(title1);
					chartDTO.setLoc_id(mapDTO.getLoc_id());
					chartDTO.setBoard_id(boardDTO.getBoard_id());
					chartDTO.setEva_key(key1[i]);
					chartDTO.setEva_value(Integer.parseInt(value1[i])*10);
					chartDAO.insertList(chartDTO);
				}
			}
					
			url = "/index.jsp";
		} else if (cmd.equals("pqWrite")) {
			url = "pq_board?cmd=write";
		}
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
