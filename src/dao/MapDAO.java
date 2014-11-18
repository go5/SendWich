//������ĥ�κ��̸���..

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.Statement;

import dbcp.DBConnectionMgr;
import dto.MapDTO;
import dto.MemberDTO;

public class MapDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public MapDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// �̰��� �����غ����Ұ�
	public MapDTO getMap(String loc_id) {
		MapDTO dto = new MapDTO();
		String sql = null;
		// FROM ���̺��; db���ȵǼ� Ȯ�κҰ���..
		// query���� ������ ���ľ��ҵ�..
		try {

			sql = "SELECT loc_id, loc_name, gis_x, gis_y, mmsurl FROM location ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		

			while (rs.next()) {
				dto.setLoc_id(rs.getString("loc_id"));
				dto.setLoc_name(rs.getString("loc_name"));
				dto.setGis_x(rs.getInt("gis_x"));
				dto.setGis_y(rs.getInt("gis_y"));
				dto.setMmsurl(rs.getString("mmsurl"));
				// DB�� ����� ��ǥ���� �����ͼ� �Ѹ���
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto; 
	}
}