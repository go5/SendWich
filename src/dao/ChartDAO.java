package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.ChartDTO;

public class ChartDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public ChartDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("ChartDAO(): ");
			e.printStackTrace();
		}
	}

	// DB에서 Chart하나의 정보 불러옴
	public Vector getList(int board_id) {
		ChartDTO dto = null;
		String sql = null;
		Vector v = new Vector();
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

			sql = "select * from chart where board_id=? GROUP BY eva_type";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new ChartDTO();
				dto.setEva_type(rs.getString("eva_type"));
				dto.setEva_value(rs.getInt("eva_value"));
				dto.setEva_key(rs.getString("eva_key"));
				dto.setLoc_id(rs.getInt("loc_id"));
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setChart_id(rs.getInt("chart_id"));
				v.add(dto);
			}

		} catch (Exception e) {
			System.out.println("MemberDAO(): ");
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return v;
	}
	
	public void insertList(ChartDTO dto){
		String sql="";
		try{
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

			sql="INSERT INTO chart (board_id, loc_id, eva_type, eva_key, eva_value) VALUES(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard_id());
			pstmt.setInt(2, dto.getLoc_id());
			pstmt.setString(3, dto.getEva_type());
			pstmt.setString(4, dto.getEva_key());
			pstmt.setInt(5, dto.getEva_value());
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("insertList() :" +err);
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
}
