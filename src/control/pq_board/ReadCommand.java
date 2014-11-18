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
		//���ôޱ⸦ ���� ����id�� ����
		String answer = req.getParameter("answer");
		//�Խñ��� ������ �޾ƿ���
		System.out.println("readcmd"+board_id);
		System.out.println("answer"+answer);
		req.getSession(false).setAttribute("answer", answer);
		//���ÿ��� ������ ���߱����� ������ �������� ����.
	
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/pq_board_v1/upload");
		
		pq_boardDAO dao = new pq_boardDAO();
		pq_boardDTO dto = dao.getBoard(board_id);
		//�Խñۿ� ���� ���� �ѱ��
		pq_replyDAO rdao = new pq_replyDAO();
		Vector v = rdao.getReply(board_id);
		//���� �ѱ��
		
		
		String mem = dto.getMember_name();
		int memid = dto.getMember_id();
		
		System.out.println("����̸�:"+mem);
		System.out.println("������̵�"+memid);
				
		
		String file = dto.getPhoto();
		file.trim();
		
		req.setAttribute("replist", v);
		req.setAttribute("dto", dto);
		req.setAttribute("board_id", board_id);
		req.getSession(false).setAttribute("board_id", board_id);
		//Ŭ���� �Խñۿ� ���� �Խñ� ��ȣ�� ���ǿ� �־��ش�.
		
		
		req.setAttribute("file", file);
		//return "pq_board_v1/Read.jsp";
		return "pq_board_v1/single-page.jsp";
		
	}

}
