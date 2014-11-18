package control.pq_board;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.pq_boardDAO;
import dto.pq_boardDTO;


public class ListCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			 throws ServerException, IOException {
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		pq_boardDAO dao = new pq_boardDAO();
		pq_boardDTO dto = new pq_boardDTO();

			Vector v = dao.getBoardList();
			//�Խñ��� ����Ʈ�� ����� Ȯ���� �ؾ� �Ѵ�.
			req.setAttribute("dtoList", v);

			
		return "pq_board_v1/List.jsp";
	}


}
