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

	// 저장되있는 장소 부르기
	public MapDTO getMap(String loc_id) {
		MapDTO dto = new MapDTO();
		String sql = null;
		try {
			sql = "SELECT * FROM location WHERE loc_id=" + loc_id;
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
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}

	// 좌표값으로 id 조회해서 있으면 호출 없으면 입력 후 호출.
	public MapDTO getMap(double gis_x, double gis_y, String loc_name) {
		MapDTO dto = new MapDTO();
		String sql = null;
		try {
			sql = "SELECT * FROM location WHERE gis_x='" + gis_x
					+ "' AND gis_y='" + gis_y + "'";
			// System.out.println(sql);
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				//System.out.println("왜?");
				dto.setLoc_id(rs.getInt("loc_id"));
				dto.setLoc_name(rs.getString("loc_name"));
				dto.setGis_x(rs.getDouble("gis_x"));
				dto.setGis_y(rs.getDouble("gis_y"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return dto;
	}

	// 맵 저장
	public void addMap(double gis_x, double gis_y, String loc_name) {
		MapDTO dto = new MapDTO();
		String sql1 = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql1 = "INSERT INTO location(loc_name, gis_x, gis_y) VALUES( '"
					+ loc_name + "'," + gis_x + ", " + gis_y + ")";
			pstmt = con.prepareStatement(sql1);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 맵 저장여부 확인.
	public int chkMap(double gis_x, double gis_y) {
		MapDTO dto = new MapDTO();
		String sql = null;
		int rowcount = 0;
		try {
			con = pool.getConnection();
			sql = " select count(loc_id) as cnt from location WHERE gis_x='"
					+ gis_x + "' AND gis_y='" + gis_y + "'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rowcount = rs.getInt(1);
			}
		//	System.out.println("Total rows : " + rowcount);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return rowcount;
	}
}