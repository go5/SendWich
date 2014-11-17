//아직고칠부분이많음..

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

	// 이곳도 상의해봐야할곳
	public MapDTO getmap(String string) {
		MapDTO dto = new MapDTO();
		String sql = null;
		// FROM 테이블명; db가안되서 확인불가능..
		// query문의 값들은 고쳐야할듯..
		try {

			sql = "SELECT CCTVID, CCTVNAME, GIS_X, GIS_Y, MMSURL FROM Map ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;

			while (rs.next()) {

				// DB에 저장된 좌표값을 가져와서 뿌린다

				i = i + 1;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto; 
	}
}