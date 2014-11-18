package control.pq_board;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDAO;
import dao.pq_boardDAO;
import dto.MemberDTO;
import dto.pq_boardDTO;

public class WriteProcCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		pq_boardDAO dao = new pq_boardDAO();
		pq_boardDTO dto = new pq_boardDTO();
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = (MemberDTO)req.getSession(false).getAttribute("memberDTO");
		int member_id = mdto.getMember_id();
		String member_name = mdto.getName();
		
	
		System.out.println("멤버 아이디 글쓰기 컨트롤러: "+member_id);
		System.out.println("멤버 이름 글쓰기 컨트롤러"+member_name);
	

		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/pq_board_v1/upload");
		System.out.println(path);
		int maxSize = 50 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(req, path, maxSize,
				"utf-8", new DefaultFileRenamePolicy());

		String user = multi.getParameter("user");
		String title = multi.getParameter("title");

		ArrayList saveFiles = new ArrayList();
		//ArrayList originFiles = new ArrayList();

		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			saveFiles.add(multi.getFilesystemName(name)); // 저장될 파일명	
		}
		
		dto.setAnswer(multi.getParameter("answer"));
		dto.setMember_id(member_id);
		dto.setMember_name(member_name);
		dto.setPhoto((String)saveFiles.get(0));
		dto.setTextarea(multi.getParameter("textarea"));
		dto.setTitle(multi.getParameter("title"));
		System.out.println(dto.getPhoto());
		
		dao.insertBoard(dto);
		return "pq_board_v1/PostProc.jsp";
	}

}
