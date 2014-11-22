package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dao.FriendsDAO;
import dao.MapDAO;
import dao.MemberDAO;
import dao.msgDAO;
import dto.MapDTO;
import dto.MemberDTO;

public class MapController extends HttpServlet {

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
		MemberDTO memberDTO;
		String url = "";
		MapDTO mapDTO;
		BoardDAO boardDAO=new BoardDAO();
		MapDAO mapDAO = new MapDAO();
		double gis_x = 0.0, gis_y = 0.0;
		String loc_name=null;
		// �⺻������ �α��� �� �� �;ߵǹǷ� ���� dto�� ȸ�� ������ �־�� ��.
		// ��, ���ǿ� �ö�� ��� ���� ȣ��.
		memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		Vector memboardList= null;

		// ���ǿ� ���� ��� ���Ǿ��� ���� â���� �̵�.
//		if (memberDTO == null) {
//			url = "/error/NeedLogin.html";
//			RequestDispatcher view = req.getRequestDispatcher(url);
//			view.forward(req, resp);
//			return;
//		}
		String cmd = req.getParameter("cmd");

		
		
		// ���� ���� �Ǻ�
		if (cmd.equals("MAPINFO")) {
			gis_x = Double.valueOf(req.getParameter("gis_x"));
			gis_y = Double.valueOf(req.getParameter("gis_y"));
			//System.out.println(gis_y);
			loc_name= req.getParameter("loc_name");
			//hasmap �ؼ� ������ �ű⼭ �ҷ����� ������ �Է��ؼ� �ҷ�����.
			mapDTO = mapDAO.getMap(gis_x, gis_y, loc_name);
			req.setAttribute("mapDTO", mapDTO);
			System.out.println("d:"+mapDTO.getLoc_id());
			System.out.println("md:"+memberDTO.getMember_id());
			memboardList = boardDAO.membermapBoradList(memberDTO.getMember_id(),mapDTO.getLoc_id());
			req.setAttribute("memboardList", memboardList);
			url = "/map/mapinfo.jsp";

		} else if (cmd.equals("")) {
		} else {
			// ���������� �޼���.
		}
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);

	}
}
