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
	
//������ִ� ��� �θ���
	public MapDTO getMap(String loc_id) {
		MapDTO dto = new MapDTO();
		String sql = null;
		// FROM ���̺��; db���ȵǼ� Ȯ�κҰ���..
		// query���� ������ ���ľ��ҵ�..
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
				// DB�� ����� ��ǥ���� �����ͼ� �Ѹ���
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	//��ǥ������ id ��ȸ�ؼ� ������ ȣ�� ������ �Է� �� ȣ��.
	public MapDTO getMap(double gis_x, double gis_y, String loc_name) {
		System.out.println("1");
		MapDTO dto = new MapDTO();
		String sql = null;
		// FROM ���̺��; db���ȵǼ� Ȯ�κҰ���..
		// query���� ������ ���ľ��ҵ�..
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


//�� �����ϰ� ȣ��. 
	public MapDTO addMap(double gis_x, double gis_y, String loc_name) {
		System.out.println("3");
		MapDTO dto = new MapDTO();
		String sql1 = null;
		String sql = null;
		// FROM ���̺��; db���ȵǼ� Ȯ�κҰ���..
		// query���� ������ ���ľ��ҵ�..
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
				// DB�� ����� ��ǥ���� �����ͼ� �Ѹ���
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}