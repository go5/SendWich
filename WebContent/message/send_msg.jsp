<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>
<%@ include file="friendlist.jsp"%>
<%
//
request.setCharacterEncoding("euc-kr");
response.setCharacterEncoding("euc-kr");
String msg_text = request.getParameter("msg_text"); //
String sendsql;
String fid=request.getParameter("fid");

//out.print(msg_text);
sendsql = "INSERT INTO message(sender_id,reciever_id,textarea,send_date) VALUES("+member_id+", "+fid+", '"+msg_text+"', CURDATE())";
//out.print(sendsql);
stmt.executeUpdate(sendsql);
%>
<script>
window.close();
</script>