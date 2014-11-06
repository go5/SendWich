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

	public MemberDTO MemberInfo(String member_id) {
		// 멤버 아이디를 받아서 회원 정보를 dto에 담아 반환
		String sql = "SELECT * FROM member WHERE member_id = ? ";
		MemberDTO dto=null;
		try {
			dto = new MemberDTO();
			con = pool.getConnection();// 성능을 위해서. 늦게 연결.
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
		// 멤버 아이디를 받아서 메세지dto 묶음 벡터를 반환.
		String sql = "SELECT * FROM message WHERE member_id = ? ";
		Vector vMsgList = new Vector();
		try {
			con = pool.getConnection();// 성능을 위해서. 늦게 연결.
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
		// 멤버 아이디를 받아서 친구 정보를 dto에 담고 복수개의 정보를 벡터에 담아 반환
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
		// 메세지dto를 받아서 전송.
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
