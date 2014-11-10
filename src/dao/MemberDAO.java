package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;
import dto.MemberDTO;




public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public MemberDAO(){
		try{
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e){
			System.out.println("MemberDAO(): ");
			e.printStackTrace();
		}	
	}
	
	public MemberDTO getInfo(String email){
		MemberDTO dto = new MemberDTO();
		String sql = null;
		try{
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			sql = "select * from teamtable where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			dto.setPassword(rs.getString("password"));
			dto.setPhone_number(rs.getString("phone_number"));
			dto.setName(rs.getString("name"));
			

		}catch(Exception e){
			System.out.println("MemberDAO(): ");
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt,rs);
		}
		return dto;
		
	}
	
	public void updateMember(MemberDTO dto){
		
		try{
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			String sql = 
"update teamtable set name=?, password=?, phone_number=? where email=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getPhone_number());
			pstmt.setString(4, dto.getEmail());
			
			System.out.println(dto.getEmail());
			
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("MemberDAO(): ");
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt,rs);
		}
		
	}
	
	public void deleteMember(String email){
		try{
			String sql = "delete from teamtable where email=?";
			System.out.print(email);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("MemberDAO(): ");
			e.printStackTrace();
		}
		
	}
	

}
