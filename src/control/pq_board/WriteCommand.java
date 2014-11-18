package control.pq_board;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			 throws ServerException, IOException {

		return "pq_board_v1/contact.jsp";
	}

}
