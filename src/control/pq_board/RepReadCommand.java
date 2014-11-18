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


public class RepReadCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			 throws ServerException, IOException {
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

	    int repboard_id = (int) req.getSession(false).getAttribute("replyboard");
		System.out.println("repreadcmd"+repboard_id);
		
	
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/pq_board_v1/upload");
		int board_id =repboard_id;
		//리플달았을 때 활용되는 게시판 서비스

		pq_boardDAO dao = new pq_boardDAO();
		pq_boardDTO dto = dao.getReplyBoard(repboard_id);
		//리플 달렸을 대 해당 게시글에 대한 정보를 가져온다.
		pq_replyDAO rdao = new pq_replyDAO();
		Vector v = rdao.getReply(board_id);
	
		
		String mem = dto.getMember_name();
		int memid = dto.getMember_id();
		
		System.out.println("멤버이름:"+mem);
		System.out.println("멤버아이디"+memid);
				
		
		String file = dto.getPhoto();
		file.trim();
		
		req.setAttribute("dto", dto);
		req.setAttribute("replist", v);
	
		req.setAttribute("file", file);
		return "pq_board_v1/single-page.jsp";
	}

}
