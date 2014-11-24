package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.mysql.jdbc.Statement;

import dbcp.DBConnectionMgr;
import dto.MemberDTO;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public MemberDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

	
//회원정보
	public MemberDTO getInfo(String email) {
		MemberDTO dto = new MemberDTO();
		String sql = null;
		try {
			con = pool.getConnection();

			sql = "select * from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			while(rs.next()){
			

			dto.setPassword(rs.getString("password"));
			dto.setPhone_number(rs.getString("phone_number"));
			dto.setName(rs.getString("name"));
			dto.setEmail(email);
			dto.setJoin_date(rs.getString("join_date"));
			dto.setMember_id(rs.getInt("member_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}
//회원정보 오버라이딩
	public MemberDTO getInfo(int member_id) {
		MemberDTO dto = new MemberDTO();
		String sql = null;
		try {
			con = pool.getConnection();
			
			sql = "select * from member where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			dto.setMember_id(rs.getInt("member_id"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setJoin_date(rs.getString("join_date"));
			dto.setPhone_number(rs.getString("phone_number"));
			dto.setPassword(rs.getString("password"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}

//회원정보 수정.
	public void updateMember(MemberDTO dto) {

		try {
			con = pool.getConnection();
			String sql = "update member set name=?, password=?, phone_number=? "
					+ "where email=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getPhone_number());
			pstmt.setString(4, dto.getEmail());

			//System.out.println(dto.getEmail());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

	}
	
//회원정보 삭제
	public void deleteMember(String email) {
		try {
			con = pool.getConnection();
			String sql = "delete from member where email=?";
		//	System.out.print(email);

			pool = DBConnectionMgr.getInstance();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

	}
	
	//비밀번호 검증.
	public boolean checkPass(String email, String pass){
		boolean flag=false;
		try {
			con = pool.getConnection();
			String sql = "SELECT password From member WHERE email=? ";
		//	System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
		//	System.out.println(pass);
		//	System.out.println(rs.getString("password"));
			if(rs.getString("password").equals(pass)){
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
		
	}
	
	//비번 변경을 위함아이디, 전화번호 체크
	public boolean checkReset(String chkEmail, String chkPhone){
		boolean flag=false;
		try {
			con = pool.getConnection();
			String sql = "SELECT * From member WHERE email=? and phone_number=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, chkEmail);
			pstmt.setString(2, chkPhone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()==true){
				flag=true;
			}else{
				flag=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
		
	}
	
			
	//비밀번호 변경
	public void updatePass(String email, String password) {

		try {
			con = pool.getConnection();
			String sql = "update member set password=? where email=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, password);
			pstmt.setString(2, email);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

	}

}
