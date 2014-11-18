package control.pq_board;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.pq_boardDAO;
import dao.pq_replyDAO;
import dto.MemberDTO;
import dto.pq_boardDTO;
import dto.pq_replyDTO;
import dbcp.DBConnectionMgr;

public class ReplyWriteProcCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {
		MemberDTO mdto = (MemberDTO)req.getSession(false).getAttribute("memberDTO");
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		
		int board_id = (int) req.getSession(false).getAttribute("board_id");
		req.getSession(false).setAttribute("replyboard", board_id);
		//reply����id������ -> RepReadCommand�� ��.
		//int repmember_id = (int)req.getSession(false).getAttribute("repmember_id");
		pq_boardDAO bdao = new pq_boardDAO();
		
		pq_replyDTO rdto = new pq_replyDTO();
		pq_replyDAO rdao = new pq_replyDAO();
		
		String member_id = (String) req.getSession(false).getAttribute("member_id");
		String member_name = (String) req.getSession(false).getAttribute("member_name");

		
		System.out.println("����"+board_id);
		System.out.print(member_name);
		//System.out.println("����"+repmember_id);
		
		String reply_field = (String) req.getSession(false).getAttribute("reply_field1");

		rdto.setBoard_id(board_id);
		rdto.setMember_id(Integer.parseInt(member_id));
		rdto.setReply_field(reply_field);
		rdto.setMember_name(member_name);
		
		System.out.println("replywrite"+reply_field);
		
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		
		String repdupsql = "select * from pq_reply where board_id=? and member_id=?";
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(repdupsql);
			pstmt.setInt(1, board_id);
			pstmt.setString(2, member_id);
			rs = pstmt.executeQuery();
			
			//���࿡ �� ���ǿ� ���� ���� ������ ���ÿ� �μ�Ʈ�� ���ְ�
			if(rs.next()==false){
				rdao.insertReply(rdto);
				
			}else{
				return "pq_board_v1/ReplyDUP.jsp";
			//�װ� �ƴ϶�� �ߺ�üũ�� ���� ���� �־����� �ʴ´�.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "pq_board_v1/ReplyProc.jsp";
	
	
		
	}

}
