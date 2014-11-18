package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dto.pq_boardDTO;
import dbcp.DBConnectionMgr;



public class pq_boardDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public pq_boardDAO(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("pqBoardDao() : " + err);
		}
	}
	
	public Vector getBoardList() {
		
		Vector v = new Vector();
		String sql;
		try{
				sql ="select * from pq_board order by board_id desc";
		
		
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				pq_boardDTO dto = new pq_boardDTO();
				
				dto.setTitle(rs.getString("title"));
				dto.setAnswer(rs.getString("answer"));
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setMember_id(rs.getInt("member_id"));
				dto.setPhoto(rs.getString("photo"));
				dto.setTextarea(rs.getString("textarea"));
				dto.setUpload_date(rs.getString("upload_date"));
				dto.setMember_name(rs.getString("member_name"));
				
				
				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList() : " + err);
		}
		finally{pool.freeConnection(con, pstmt, rs);}
		return v;
	}
	//글 저장하기
	public void insertBoard(pq_boardDTO dto){
		String sql = null;
		try{
			con = pool.getConnection();

			sql ="INSERT INTO pq_board(title, textarea, photo, upload_date, member_id, answer, member_name) "
					+ "VALUES (?,?,?,now(),?,?,?)";
			
		   System.out.println("글쓰기"+dto.getTitle());
						
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getTextarea());
			pstmt.setString(3, dto.getPhoto());
			//pstmt.setString(4, dto.getUpload_date());
			pstmt.setInt(4, dto.getMember_id());
			pstmt.setString(5, dto.getAnswer());
			pstmt.setString(6, dto.getMember_name());
			pstmt.executeUpdate();	

		}
		catch(Exception err){
			err.printStackTrace();
			//System.out.println("insertBoard() : " + err);
		}
		finally{pool.freeConnection(con, pstmt, rs);}
	}
		
	public pq_boardDTO getBoard(int board_id){
		pq_boardDTO dto = new pq_boardDTO();
		String sql = null;
		System.out.println(board_id);
		try{
			con = pool.getConnection();
			sql = "select * from pq_board where board_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();
			 
			System.out.println("2");
			while(rs.next()){
				
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setAnswer(rs.getString("answer"));
				dto.setMember_id(rs.getInt("member_id"));
				dto.setPhoto(rs.getString("photo"));
				dto.setTextarea(rs.getString("textarea"));
				dto.setTitle(rs.getString("title"));
				dto.setUpload_date(rs.getString("upload_date"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setAnswer(rs.getString("answer"));
 
			}
		}
		catch(Exception err){
			System.out.println("getboard() : " + err);
		}
		finally{pool.freeConnection(con, pstmt, rs);}
		return dto;
	}
	
	
	//리플을 달았을 경우 여기로 와서 게시판의 글을 가져옴.
	public pq_boardDTO getReplyBoard(int repboard_id){
		pq_boardDTO dto = new pq_boardDTO();
		String sql = null;
		System.out.println(repboard_id);
		try{
			con = pool.getConnection();
			sql = "select * from pq_board where board_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, repboard_id);
			rs = pstmt.executeQuery();
			 
			System.out.println("2");
			while(rs.next()){
				
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setAnswer(rs.getString("answer"));
				dto.setMember_id(rs.getInt("member_id"));
				dto.setPhoto(rs.getString("photo"));
				dto.setTextarea(rs.getString("textarea"));
				dto.setTitle(rs.getString("title"));
				dto.setUpload_date(rs.getString("upload_date"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setAnswer(rs.getString("answer"));
 
			}
		}
		catch(Exception err){
			System.out.println("getboard() : " + err);
		}
		finally{pool.freeConnection(con, pstmt, rs);}
		return dto;
	}
	
	///글 삭제
		public void deleteBoard(int board_id){
			String sql = null;
			try{
				con = pool.getConnection();
				sql = "delete from pq_board where board_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_id);
				pstmt.executeUpdate();
				
				
			}
			catch(Exception err){
				System.out.println("deleteBoard() : " + err);
			}
			finally{pool.freeConnection(con, pstmt, rs);}
		}

}
