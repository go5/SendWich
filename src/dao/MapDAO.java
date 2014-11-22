//아직고칠부분이많음..
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import com.mysql.jdbc.Statement;

import dbcp.DBConnectionMgr;
import dto.MapDTO;
import dto.MemberDTO;

public class MapDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public MapDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//저장되있는 장소 부르기
	public MapDTO getMap(String loc_id) {
		MapDTO dto = new MapDTO();
		String sql = null;
		// FROM 테이블명; db가안되서 확인불가능..
		// query문의 값들은 고쳐야할듯..
		try {
			sql = "SELECT * FROM location WHERE loc_id="+loc_id;
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setLoc_id(rs.getInt("loc_id"));
				dto.setLoc_name(rs.getString("loc_name"));
				dto.setGis_x(rs.getDouble("gis_x"));
				dto.setGis_y(rs.getDouble("gis_y"));
				// DB에 저장된 좌표값을 가져와서 뿌린다
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	//좌표값으로 id 조회해서 있으면 호출 없으면 입력 후 호출.
	public MapDTO getMap(double gis_x, double gis_y, String loc_name) {
		System.out.println("1");
		MapDTO dto = new MapDTO();
		String sql = null;
		// FROM 테이블명; db가안되서 확인불가능..
		// query문의 값들은 고쳐야할듯..
		try {
			sql = "SELECT * FROM location WHERE gis_x='"+gis_x+"' AND gis_y='"+gis_y+"'";
			//System.out.println(sql);
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ResultSetMetaData rsmd=null;
			rsmd=rs.getMetaData();
			int nRecord = rsmd.getColumnCount();
			  System.out.println(nRecord);
			if(nRecord!=0) {
				
				System.out.println("1-1");
				while(rs.next()){
				dto.setLoc_id(rs.getInt("loc_id"));
				dto.setLoc_name(rs.getString("loc_name"));
				dto.setGis_x(rs.getDouble("gis_x"));
				dto.setGis_y(rs.getDouble("gis_y"));
				}
			}else{
				System.out.println("2");
				dto = addMap(gis_x, gis_y, loc_name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("???");
		
		return dto;
	}


//맵 저장하고 호출. 
	public MapDTO addMap(double gis_x, double gis_y, String loc_name) {
		System.out.println("3");
		MapDTO dto = new MapDTO();
		String sql1 = null;
		String sql = null;
		// FROM 테이블명; db가안되서 확인불가능..
		// query문의 값들은 고쳐야할듯..
		try {
			con = pool.getConnection();
			sql1 = "INSERT INTO location(loc_name, gis_x, gis_y) VALUES( '"+loc_name+"',"+gis_x+", "+gis_y+")";
			pstmt = con.prepareStatement(sql1);
			pstmt.executeUpdate();

			sql = "SELECT * FROM location WHERE gis_x='"+gis_x+"' AND gis_y='"+gis_y+"'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			System.out.println("4");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setLoc_id(rs.getInt("loc_id"));
				dto.setLoc_name(rs.getString("loc_name"));
				dto.setGis_x(rs.getDouble("gis_x"));
				dto.setGis_y(rs.getDouble("gis_y"));
				// DB에 저장된 좌표값을 가져와서 뿌린다
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}