
//������ĥ�κ��̸���..

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.Statement;

import dbcp.DBConnectionMgr;
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
	public MapDTO getmap(String ?) {
		MapDTO dto = new MapDTO();
		String sql = null;
//				FROM ���̺��; db���ȵǼ� Ȯ�κҰ���..
//				query���� ������ ���ľ��ҵ�.. 
			
			sql = "SELECT CCTVID, CCTVNAME, GIS_X, GIS_Y, MMSURL FROM Map ";
			stmt = con.createStatement(sql);
			pstmt = con.prepareStatement();
			rs = stmt.executeQuery();
			int i = 0;
			
			 while(rs.next()){

			     //DB�� ����� ��ǥ���� �����ͼ� �Ѹ���
				 				 						 
			i = i +1;
			

		} catch (Exception e) {
			e.printStackTrace();
			}
	}