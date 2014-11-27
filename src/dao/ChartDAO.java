package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.BoardDTO;
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

	// DB에서 Chart목록 조회
	public Vector getChart(int board_id) {
		ChartDTO dto = null;
		String sql = null;
		Vector v = new Vector();
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

			sql = "select * from chart where board_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new ChartDTO();
				dto.setEva_type(rs.getString("eva_type"));
				dto.setEva_value(rs.getInt("eva_value"));
				dto.setEva_key(rs.getString("eva_key"));
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setChart_id(rs.getInt("chart_id"));
				dto.setLoc_id(rs.getInt("loc_id"));
				v.add(dto);
			}

		} catch (Exception e) {
			System.out.println("getList(): ");
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return v;
	}
	
//차트 입력
	public void insertChart(ChartDTO dto){
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
////해당 지역 등록된 보드번호 조회.
//	public Vector getLocalBoardList(int loc_id) {
//		ChartDTO dto = null;
//		String sql = null;
//		Vector localboardList = new Vector();
//		try {
//			pool = DBConnectionMgr.getInstance();
//			con = pool.getConnection();
//
//			sql = "select DISTINCT board_id from chart where loc_id=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, loc_id);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				localboardList.add(rs.getString("board_id"));
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			pool.freeConnection(con, pstmt, rs);
//		}
//		return localboardList;
//	}
//

}
