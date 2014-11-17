package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.BoardDTO;

public class BoardDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;

	public BoardDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * SELECT a.id, a.value, b.id, b.value FROM tbla a INNER JOIN tblb b
	 * --inner는 생략 가능 ON(a.id = b.id)
	 */

	public Vector BoradList(int member_id) {// 본인 게시글 출력.
		Vector boardList = new Vector();
		String sql = "SELECT * FROM board WHERE member_id = "
				+ member_id
				+ "UNION SELECET * FROM board  WHERE member_id = (SELECT memeber_id FROM friends WHERE invite=1 AND friend_id="
				+ member_id
				+ ") INNER JOIN location loc ON(loc_id=loc.loc_id ORDER BY upload_date desc";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBoard_id(rs.getInt("board_id"));
				boardDTO.setMember_id(rs.getInt("member_id"));
				boardDTO.setLoc_id(rs.getInt("a.loc_id"));
				boardDTO.setLoc_name(rs.getString("b.loc_name"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setTextarea(rs.getString("textarea"));
				boardDTO.setPhoto(rs.getString("photo"));
				boardDTO.setUpload_date(rs.getString("upload_date"));
				boardList.add(boardDTO);
			}

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return boardList;

	}

}
