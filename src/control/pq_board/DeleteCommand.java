package control.pq_board;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			 throws ServerException, IOException {
		
		String board_id =req.getParameter("board_id");
		String member_id =req.getParameter("member_id");
		String answer = req.getParameter("answer");
		System.out.println("�Խñ� ����"+board_id);
		System.out.println("�Խñ� ���� ���"+member_id);
		System.out.println("�Խñ� ���� ����"+answer);
		req.setAttribute("delboard_id", board_id);
		req.setAttribute("delmember_id", member_id);
		req.setAttribute("delanswer", answer);
		
		return "pq_board_v1/Delete.jsp";
	}

}
