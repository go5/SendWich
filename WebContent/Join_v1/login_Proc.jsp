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



msql = "select member_id from teamtable where email='"+email+"' AND password='"+password+"'";
rs= stmt.executeQuery(msql);
if(rs.next()==true){
	member_id=rs.getString("member_id");
	session.setAttribute("member_id", member_id);
	session.setAttribute("email", email);
	System.out.println(member_id);
	out.println("<script>alert('로그인 되셨습니다.');location.replace('index.jsp');</script>");
	
	
	
}else{
	out.println("<script>alert('로그인 정보가 없습니다.');history.back();</script>");
}


System.out.println(msql);


%>