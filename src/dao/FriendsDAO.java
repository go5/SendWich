package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.mysql.jdbc.Statement;

import dbcp.DBConnectionMgr;
import dto.MemberDTO;

public class FriendsDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public FriendsDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ȸ���� ģ�� ��� ���(�⺻)
	public Vector FriendsInfo(int member_id) {
		// ��� ���̵� �޾Ƽ� ģ�� ������ dto�� ��� �������� ������ ���Ϳ� ��� ��ȯ
		
		String sql = "SELECT * FROM member WHERE member_id IN ("
				+ "SELECT friend_id FROM friends "
				+ "WHERE (invited=1 AND member_id = "+ member_id + ")"
						+ ") ORDER BY name";
		// System.out.println(sql);
		Vector v = new Vector();
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setMember_id(rs.getInt("member_id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getString("join_date"));
				dto.setPhone_number(rs.getString("phone_number"));
				dto.setPassword(rs.getString("password"));
				// System.out.println(dto.getMember_id());
				v.add(dto);
			}
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return v;
	}

	// ģ�� �˻�
	public MemberDTO SearchInfo(String femail, int member_id) {
		// ģ�� �̸����� �Է��ϸ� ����� �ϳ� ����.
		String sql = "SELECT * FROM member WHERE email= '"
				+ femail
				+ "' AND member_id not in (SELECT friend_id from friends where member_id="
				+ member_id + ")";
		//System.out.println("�˻�: " + sql);
		MemberDTO dto = new MemberDTO();
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setMember_id(rs.getInt("member_id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getString("join_date"));
				dto.setPhone_number(rs.getString("phone_number"));
				dto.setPassword(rs.getString("password"));
				// System.out.println(dto.getMember_id());
			}
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}

	// ������ ģ���� ��û�� ��� ���
	public Vector FriendResponse(int member_id) {
		String sql = "SELECT * FROM member WHERE member_id IN (select friend_id from friends where invited=0 AND member_id="
				+ member_id + ")";
		// System.out.println(sql);
		Vector v = new Vector();
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setMember_id(rs.getInt("member_id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getString("join_date"));
				dto.setPhone_number(rs.getString("phone_number"));
				dto.setPassword(rs.getString("password"));
				// System.out.println(dto.getMember_id());
				v.add(dto);
			}
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return v;
	}

	// ģ����û.
	public void InviteFriend(int member_id, int friend_id) {
		String sql1 = "INSERT INTO friends VALUES(" + member_id + ", "
				+ friend_id + ", 1)";
		String sql2 = "INSERT INTO friends VALUES(" + friend_id + ", "
				+ member_id + ", 0)";
		// System.out.println(sql);
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql1);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(sql2);
			pstmt.executeUpdate();

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// ģ������.
	public void AllowFriend(int member_id, int friend_id) {
		String sql = "update friends set invited=1 where invited=0 AND member_id="
				+ member_id + " AND friend_id=" + friend_id;
		System.out.println(sql);
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// ģ������.
	public void DeleteFriend(int member_id, int friend_id) {
		String sql = "delete from friends where (friend_id=" + friend_id
				+ " and member_id=" + member_id + ") OR (friend_id="
				+ member_id + " AND member_id=" + friend_id + ")";
		System.out.println(sql);
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

}
