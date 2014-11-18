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



	public Vector BoradList(int member_id) {// 본인/친구 게시글 목록
		Vector boardList = new Vector();
		String sql = "SELECT * FROM board mem JOIN location loc1 ON(mem.loc_id=loc1.loc_id) WHERE member_id ="+member_id
				+ " UNION SELECT * FROM board fri JOIN location loc2 ON(fri.loc_id=loc2.loc_id) "
				+ "WHERE member_id IN (SELECT member_id FROM friends WHERE invited=1 AND friend_id="+member_id+") "
				+ "ORDER BY upload_date desc";
		//System.out.println(sql);
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBoard_id(rs.getInt("board_id"));
				boardDTO.setMember_id(rs.getInt("member_id"));
				boardDTO.setLoc_id(rs.getInt("loc_id"));
				boardDTO.setLoc_name(rs.getString("loc_name"));
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

	public BoardDTO GetBoard(int board_id) {// 선택 게시물 출력
		BoardDTO boardDTO = new BoardDTO();
		String sql = "SELECT * FROM board br JOIN location loc1 ON(br.loc_id=loc1.loc_id) "
				+ "JOIN member mem ON(mem.member_id = br.member_id) where board_id="+board_id;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				boardDTO.setBoard_id(rs.getInt("board_id"));
				boardDTO.setMember_id(rs.getInt("member_id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setLoc_id(rs.getInt("loc_id"));
				boardDTO.setLoc_name(rs.getString("loc_name"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setTextarea(rs.getString("textarea"));
				boardDTO.setPhoto(rs.getString("photo"));
				boardDTO.setUpload_date(rs.getString("upload_date"));
			}

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return boardDTO;

	}
}
