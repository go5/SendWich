package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChartDAO;
import dto.ChartDTO;

public class ChartController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		ChartDAO dao = new ChartDAO();
		ChartDTO dto = null;
		HttpSession session = req.getSession();
		String url="";
		String cmd = req.getParameter("cmd");
	
		int board_id = Integer.parseInt(req.getParameter("board_id"));
		int loc_id = Integer.parseInt(req.getParameter("loc_id"));
		int chart_id = Integer.parseInt(req.getParameter("chart_id"));
		// 서버에서 받아오는 그래프 정보 변수
		Vector vChart =null;
		
		if(cmd.equals("chart")){
			//dao로 서버에서 가저온 정보 저장
			vChart = dao.getList(board_id);
			
			//정보 세션으로 전달
			session.setAttribute("ChartDto", vChart);
			url="chart/Chart_Read.jsp";
		}else if(cmd.equals("Chart_Insert")){
			String title1 = req.getParameter("title1");
			String title2 = req.getParameter("title2");
			String title3 = req.getParameter("title3");
			String key1[] = req.getParameterValues("key1");
			String key2[] = req.getParameterValues("key2");
			String key3[] = req.getParameterValues("key3");
			String value1[] = req.getParameterValues("value1");
			String value2[] = req.getParameterValues("value2");
			String value3[] = req.getParameterValues("value3");
			if(title1 != ""){
			for(int i =0; i<key1.length; i++){
				dto = new ChartDTO();
				dto.setChart_id(chart_id);
				dto.setEva_type(title1);
				dto.setLoc_id(loc_id);
				dto.setBoard_id(board_id);
				dto.setEva_key(key1[i]);
				dto.setEva_value(Integer.parseInt(value1[i])*10);
				dao.insertList(dto);
			}
			}
			if(title2 != ""){
			for(int i =0; i<key2.length; i++){
				dto = new ChartDTO();
				dto.setChart_id(chart_id);
				dto.setEva_type(title2);
				dto.setLoc_id(loc_id);
				dto.setBoard_id(board_id);
				dto.setEva_key(key2[i]);
				dto.setEva_value(Integer.parseInt(value2[i])*10);
				dao.insertList(dto);
			}
			}
			if(title3 != ""){
			for(int i =0; i<key3.length; i++){
				dto = new ChartDTO();
				dto.setChart_id(chart_id);
				dto.setEva_type(title3);
				dto.setLoc_id(loc_id);
				dto.setBoard_id(board_id);
				dto.setEva_key(key3[i]);
				dto.setEva_value(Integer.parseInt(value3[i])*10);
				dao.insertList(dto);
			}
			}
			url="chart/Chart_Read.jsp";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
