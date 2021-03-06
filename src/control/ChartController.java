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
		
		ChartDAO chartDAO = new ChartDAO();
		ChartDTO chartDTO = null;
		HttpSession session = req.getSession();
		String url="";
		String cmd = req.getParameter("cmd");
	
		int board_id = Integer.parseInt(req.getParameter("board_id"));
		
		Vector vChart =null;
		Vector vTitle1 = null;
		
		if(cmd.equals("chart")){
			//dao로 서버에서 가저온 정보 저장
			vChart = chartDAO.getChart(board_id);
			for(int i=0; i<vChart.size(); i++){
				chartDTO = (ChartDTO)vChart.get(i);
				if(chartDTO.getEva_type() == "k"){
					System.out.println(chartDTO.getEva_type());
//					vTitle1.add(dto.getEva_type());
//					vTitle1.add(dto.getEva_value());
//					vTitle1.add(dto.getEva_key());
				}
			}
			session.setAttribute("ChartDto", vChart);
			url="chart/Chart_Read.jsp";
		}else if(cmd.equals("Chart_Insert")){
			int chart_id = Integer.parseInt(req.getParameter("chart_id"));
			int loc_id = Integer.parseInt(req.getParameter("loc_id"));
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
				chartDTO = new ChartDTO();
				chartDTO.setChart_id(chart_id);
				chartDTO.setEva_type(title1);
				chartDTO.setLoc_id(loc_id);
				chartDTO.setBoard_id(board_id);
				chartDTO.setEva_key(key1[i]);
				chartDTO.setEva_value(Integer.parseInt(value1[i])*10);
				chartDAO.insertChart(chartDTO);
			}
			}
			if(title2 != ""){
			for(int i =0; i<key2.length; i++){
				chartDTO = new ChartDTO();
				chartDTO.setChart_id(chart_id);
				chartDTO.setEva_type(title2);
				chartDTO.setLoc_id(loc_id);
				chartDTO.setBoard_id(board_id);
				chartDTO.setEva_key(key2[i]);
				chartDTO.setEva_value(Integer.parseInt(value2[i])*10);
				chartDAO.insertChart(chartDTO);
			}
			}
			if(title3 != ""){
			for(int i =0; i<key3.length; i++){
				chartDTO = new ChartDTO();
				chartDTO.setChart_id(chart_id);
				chartDTO.setEva_type(title3);
				chartDTO.setLoc_id(loc_id);
				chartDTO.setBoard_id(board_id);
				chartDTO.setEva_key(key3[i]);
				chartDTO.setEva_value(Integer.parseInt(value3[i])*10);
				chartDAO.insertChart(chartDTO);
			}
			}
			url="chart/Chart.jsp";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
