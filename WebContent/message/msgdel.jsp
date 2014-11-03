<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ include file="conn_db.jsp"%>
<%
String msg_id = request.getParameter("msg_id");
String sql="DELETE FROM message WHERE msg_id IN ("+msg_id+")";
stmt.executeUpdate(sql);
%>

<script>
location.href = "msglist.jsp";
</script>
