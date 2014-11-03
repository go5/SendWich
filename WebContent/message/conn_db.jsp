
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>
<%
	String drivers = "com.mysql.jdbc.Driver";
//String drivers = "org.gjt.mm.mysql.Driver";	
String url = "jdbc:mysql://192.168.10.21:3306/project";
	String db_user = "root";
	String db_passwd = "0000";

	try {
		Class.forName(drivers);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection Conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		Conn = DriverManager.getConnection(url, db_user, db_passwd);
		stmt = Conn.createStatement();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>