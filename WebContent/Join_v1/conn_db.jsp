
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>
<%
	String drivers2 = "org.gjt.mm.mysql.Driver";
	String drivers = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/prtest";
	String db_user = "system";
	String db_passwd = "1111";
	

	try {
		Class.forName(drivers);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection Conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt=null;

	try {
		Conn = DriverManager.getConnection(url, db_user, db_passwd);
		stmt = Conn.createStatement();
	
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
%>
