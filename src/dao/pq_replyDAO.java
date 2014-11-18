package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dto.pq_boardDTO;
import dto.pq_replyDTO;
import dbcp.DBConnectionMgr;

public class pq_replyDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public pq_replyDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("pq_replyDAO() : " + err);
		}
	}

	public Vector getReply(int board_id) {

		Vector v = new Vector();
		String sql;
		try {
			sql = "select * from pq_reply where board_id=? order by reply_id";

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				pq_replyDTO dto = new pq_replyDTO();

				dto.setMember_id(rs.getInt("member_id"));
				dto.setReply_date(rs.getString("reply_date"));
				dto.setReply_field(rs.getString("reply_field"));
				dto.setReply_id(rs.getInt("reply_id"));
				dto.setMember_name(rs.getString("member_name"));

				v.add(dto);
			}
		} catch (Exception err) {
			System.out.println("getBoardList() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return v;
	}

	public void insertReply(pq_replyDTO dto) {
		
		String sql = null;
		
		
		try {

			con = pool.getConnection();


				sql = "INSERT into pq_reply(member_id, board_id,reply_date,reply_field,member_name) "
						+ "VALUES(?,?,now(),?,?)";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getMember_id());
				pstmt.setInt(2, dto.getBoard_id());
				pstmt.setString(3, dto.getReply_field());
				pstmt.setString(4, dto.getMember_name());

				pstmt.executeUpdate();
			

		} catch (Exception err) {
			err.printStackTrace();
			// System.out.println("insertBoard() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

}
