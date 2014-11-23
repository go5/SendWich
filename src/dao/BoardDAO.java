package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.BoardDTO;
import dto.ReplyDTO;

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
		String sql = "SELECT * FROM board mem JOIN location loc1 ON(mem.loc_id=loc1.loc_id) WHERE member_id ="
				+ member_id
				+ " UNION SELECT * FROM board fri JOIN location loc2 ON(fri.loc_id=loc2.loc_id) "
				+ "WHERE member_id IN (SELECT member_id FROM friends WHERE invited=1 AND friend_id="
				+ member_id + ") " + "ORDER BY upload_date desc, board_id desc";
		// System.out.println(sql);
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

	public Vector membermapBoradList(int member_id, int loc_id) {// 지도아이디와
																	// 멤버아이디를
																	// 받아서 글 목록
																	// 꺼내옴.
		Vector boardList = new Vector();
		String sql = "SELECT * FROM board WHERE member_id =" + member_id
				+ " AND loc_id = " + loc_id;
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
				+ "JOIN member mem ON(mem.member_id = br.member_id) where board_id="
				+ board_id;
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

	public Vector GetReply(int board_id) {// 선택 게시물의 댓글출력
		Vector replyList = new Vector();
		String sql = "SELECT * FROM reply rp JOIN member mem ON(rp.member_id = mem.member_id) "
				+ " where board_id= " + board_id + " ORDER BY reply_date desc";
		//System.out.println(sql);
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReplyDTO replyDTO = new ReplyDTO();
				replyDTO.setBoard_id(rs.getInt("board_id"));
				replyDTO.setMember_id(rs.getInt("member_id"));
				replyDTO.setName(rs.getString("name"));
				replyDTO.setReply_text(rs.getString("reply_text"));
				replyDTO.setReply_date(rs.getString("reply_date"));
				replyList.add(replyDTO);
			}
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return replyList;
	}
	
	//글 입력.
	public void insertBoard(BoardDTO dto) {
		String sql="";
		try {
			con = pool.getConnection();

			sql ="INSERT INTO board(title, textarea, photo, upload_date, member_id, loc_id) "
					+ "VALUES (?,?,?,now(),?,?)";
			
		  // System.out.println("글쓰기"+dto.getTitle());
						
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getTextarea());
			pstmt.setString(3, dto.getPhoto());
			pstmt.setInt(4, dto.getMember_id());
			pstmt.setInt(5, dto.getLoc_id());
			pstmt.executeUpdate();	


			
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

	}

}
