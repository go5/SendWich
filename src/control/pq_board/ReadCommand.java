package control.pq_board;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.pq_boardDAO;
import dao.pq_replyDAO;
import dto.MemberDTO;
import dto.pq_boardDTO;
import dto.pq_replyDTO;


public class ReadCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			 throws ServerException, IOException {
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		int board_id =  Integer.parseInt(req.getParameter("board_id"));
		req.getSession(false).setAttribute("repboard_id", board_id);
		//리플달기를 위한 보드id값 보내
		String answer = req.getParameter("answer");
		//게시글의 정받을 받아오고
		System.out.println("readcmd"+board_id);
		System.out.println("answer"+answer);
		req.getSession(false).setAttribute("answer", answer);
		//리플에서 정답을 맞추기위해 정답을 세션으로 보냄.
	
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/pq_board_v1/upload");
		
		pq_boardDAO dao = new pq_boardDAO();
		pq_boardDTO dto = dao.getBoard(board_id);
		//게시글에 대한 정보 넘기기
		pq_replyDAO rdao = new pq_replyDAO();
		Vector v = rdao.getReply(board_id);
		//리플 넘기기
		
		
		String mem = dto.getMember_name();
		int memid = dto.getMember_id();
		
		System.out.println("멤버이름:"+mem);
		System.out.println("멤버아이디"+memid);
				
		
		String file = dto.getPhoto();
		file.trim();
		
		req.setAttribute("replist", v);
		req.setAttribute("dto", dto);
		req.setAttribute("board_id", board_id);
		req.getSession(false).setAttribute("board_id", board_id);
		//클릭된 게시글에 대한 게시글 번호를 세션에 넣어준다.
		
		
		req.setAttribute("file", file);
		//return "pq_board_v1/Read.jsp";
		return "pq_board_v1/single-page.jsp";
		
	}

}
