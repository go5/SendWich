<%@page import="dto.MemberDTO"%>

<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>

<%
	session.removeAttribute("memberDTO");
%>	
<script>
alert("로그아웃 되었습니다");
window.opener.location.href="main?cmd=INDEX";
window.close();
</script>
