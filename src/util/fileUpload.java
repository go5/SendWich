package util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDAO;
import dao.ChartDAO;
import dao.MapDAO;
import dao.MemberDAO;
import dao.pq_boardDAO;
import dto.BoardDTO;
import dto.ChartDTO;
import dto.MapDTO;
import dto.MemberDTO;
import dto.pq_boardDTO;

public class fileUpload extends HttpServlet {
	public void test(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		doPost(req, resp);
		
	}

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
		MemberDAO memberDAO = new MemberDAO();
		BoardDAO boardDAO = new BoardDAO();
		MapDAO mapDAO = new MapDAO();
		ChartDAO chartDAO = new ChartDAO();
		
		MemberDTO mdto = (MemberDTO)req.getSession(false).getAttribute("memberDTO");
		BoardDTO boardDTO = null;
		MapDTO mapDTO = null;
		ChartDTO chartDTO = null;
		
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/upload");
		System.out.println(path);
		int maxSize = 10 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(req, path, maxSize,
				"utf-8", new DefaultFileRenamePolicy());

		ArrayList saveFiles = new ArrayList();

		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			saveFiles.add(multi.getFilesystemName(name)); // 저장될 파일명	
		}
	
	}

}
