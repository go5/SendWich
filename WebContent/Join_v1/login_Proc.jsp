<%@page import="dto.MemberDTO"%>

<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>
<%@ include file="conn_db.jsp"%>



<%
String msql;
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String email =request.getParameter("email");
String password = request.getParameter("pwd1");
String member_id=null;
MemberDTO mdto = new MemberDTO();



msql = "select * from member where email='"+email+"' AND password='"+password+"'";
rs= stmt.executeQuery(msql);
if(rs.next()==true){
	member_id=rs.getString("member_id");
	session.setAttribute("member_id", member_id);
	session.setAttribute("email", email);
	
	mdto.setEmail(email);
	mdto.setMember_id(Integer.parseInt(member_id));
	mdto.setName(rs.getString("name"));
	mdto.setPassword(rs.getString("password"));
	mdto.setPhone_number(rs.getString("phone_number"));
	mdto.setJoin_date(rs.getString("join_date"));
	
	session.setAttribute("memberDTO", mdto);
	
	
	out.println("<script>alert('로그인 되셨습니다.');window.close();</script>");
	
	
	
}else{
	out.println("<script>alert('로그인 정보가 없습니다.');history.back();</script>");
}


System.out.println(msql);


%>