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
			// 커넥션 정보 획득.
			pool = DBConnectionMgr.getInstance();
			// db 연결. 성능을 위해서는 가장 늦게 연결하고 가장 빨리 끊어주는 게 좋음.

		} catch (Exception err) {
			System.out.println("DB연결 실패 :" + err);
		}
	}

	// 메세지용 친구목록. 둘다 1 된 친구만 떠야함.
	public Vector FriendsInfo(int member_id) {
		// 멤버 아이디를 받아서 친구 정보를 dto에 담고 복수개의 정보를 벡터에 담아 반환

		String sql = "SELECT * FROM member WHERE member_id IN( SELECT friend_id FROM friends WHERE invited=1 AND member_id= "
				+ member_id
				+ " ) AND member_id IN ( SELECT member_id FROM friends WHERE invited=1 AND friend_id= "
				+ member_id + ") ORDER BY name";
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
				//dto.setPassword(rs.getString("password"));
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

	public Vector msgList(int member_id) {
		// 멤버 아이디를 받아서 메세지dto 묶음 벡터를 반환.
		// System.out.println("list"+member_id);
		String sql = "SELECT * FROM message WHERE reciever_id = ? ORDER BY send_date desc ";
		Vector vMsgList = new Vector();
		try {
			// System.out.println(sql);
			con = pool.getConnection();// 성능을 위해서. 늦게 연결.
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_id);
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

	public void SendMessage(int friend_id, String msg_text, int member_id) {
		// 메세지dto를 받아서 전송.
		String sql = "INSERT INTO message(sender_id,reciever_id,textarea,send_date) VALUES("
				+ member_id
				+ ", "
				+ friend_id
				+ ", '"
				+ msg_text
				+ "', CURDATE())";
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

	public void DeleteMessage(String msg_ids) {
		// 메세지dto를 받아서 전송.
		String sql = "DELETE FROM message WHERE msg_id IN (" + msg_ids + ")";
		// System.out.println(sql);
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
}
