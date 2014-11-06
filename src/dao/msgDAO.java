package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.MemberDTO;
import dto.MessageDTO;

public class msgDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public msgDAO() {

		try {
			// Ŀ�ؼ� ���� ȹ��.
			pool = DBConnectionMgr.getInstance();
			// db ����. ������ ���ؼ��� ���� �ʰ� �����ϰ� ���� ���� �����ִ� �� ����.

		} catch (Exception err) {
			System.out.println("DB���� ���� :" + err);
		}
	}

	public MemberDTO MemberInfo(String member_id) {
		// ��� ���̵� �޾Ƽ� ȸ�� ������ dto�� ��� ��ȯ
		String sql = "SELECT * FROM member WHERE member_id = ? ";
		MemberDTO dto=null;
		try {
			dto = new MemberDTO();
			con = pool.getConnection();// ������ ���ؼ�. �ʰ� ����.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			rs.next();

			dto.setMember_id(rs.getInt("member_id"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setJoin_date(rs.getString("join_date"));
			dto.setPhone_number(rs.getString("phone_number"));
			dto.setPassword(rs.getString("password"));
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}

	public Vector msgList(int member_id) {
		// ��� ���̵� �޾Ƽ� �޼���dto ���� ���͸� ��ȯ.
		String sql = "SELECT * FROM message WHERE member_id = ? ";
		Vector vMsgList = new Vector();
		try {
			con = pool.getConnection();// ������ ���ؼ�. �ʰ� ����.
			pstmt = con.prepareStatement(sql);
			pstmt.executeQuery();
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MessageDTO dto = new MessageDTO();

				dto.setMsg_id(rs.getInt("msg_id"));
				dto.setReciever_id(rs.getInt("reciever_id"));
				dto.setSend_date(rs.getString("send_date"));
				dto.setSender_id(rs.getInt("sender_id"));
				dto.setTextarea(rs.getString("textarea"));
				vMsgList.add(dto);
			}
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vMsgList;
	}

	public Vector<MemberDTO> FriendsInfo(String member_id) {
		// ��� ���̵� �޾Ƽ� ģ�� ������ dto�� ��� �������� ������ ���Ϳ� ��� ��ȯ
		String sql = "SELECT * FROM member WHERE member_id IN (SELECT friend_id FROM friends WHERE friend_id="
				+ member_id;
		MemberDTO dto = new MemberDTO();
		Vector<MemberDTO> v = new Vector<MemberDTO>();
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {

				dto.setMember_id(rs.getInt("member_id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getString("join_date"));
				dto.setPhone_number(rs.getString("phone_number"));
				dto.setPassword(rs.getString("password"));
				v.add(dto);

			}
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return v;
	}

	public void SendMessage(MessageDTO dto) {
		// �޼���dto�� �޾Ƽ� ����.
		String sql = "";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "0");
			pstmt.executeUpdate();

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

}
