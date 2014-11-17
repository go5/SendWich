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
		String sql = "SELECT * FROM member WHERE member_id IN (SELECT friend_id FROM friends WHERE member_id = "
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

	// ������ ģ���� ��û�� ��� ���
	public Vector FriendResponse(int member_id) {
		String sql = "SELECT * FROM member WHERE member_id IN (select sender from friends where invited=0 AND reciever="
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
		String sql = "update friends set invited=1 where invited=0 AND reciever="
				+ member_id + " AND sender=" + friend_id;
		// System.out.println(sql);
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
		String sql = "delete from friends where (sender=" + friend_id
				+ " and reciever=" + member_id + ") OR (sender=" + member_id
				+ " AND reciever=" + friend_id + ")";
		// System.out.println(sql);
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
