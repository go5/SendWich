//������ĥ�κ��̸���..
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

	// ������ִ� ��� �θ���
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
				// DB�� ����� ��ǥ���� �����ͼ� �Ѹ���
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}

	// ��ǥ������ id ��ȸ�ؼ� ������ ȣ�� ������ �Է� �� ȣ��.
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
				//System.out.println("��?");
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

	// �� ����
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

	// �� ���忩�� Ȯ��.
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