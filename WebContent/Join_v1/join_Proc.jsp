 
 <%@page import="encode.Encode"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>
<%@ include file="conn_db.jsp"%>
<%
System.out.println("가입 프로세스");	
	String msql; //sql 문.
	//String member_id, member_email, member_name, member_join_date, member_phone_number; //자신의 정보

	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String email = request.getParameter("email");
	String password = request.getParameter("pwd1");
	String name = request.getParameter("name");
	String phone_number = request.getParameter("phone");
	
	password = Encode.encrypt(password);

	
	msql  = "INSERT INTO member(email,password,name,phone_number,join_date) VALUES(?,?,?,?,now())";
	pstmt = Conn.prepareStatement(msql);
	pstmt.setString(1, email);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, phone_number);
	
	pstmt.executeUpdate();
%>

<script>
alert("회원가입되셨습니다. 환영합니다! ^^");
location.href="main?cmd=INDEX"

</script>