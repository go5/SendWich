<%@page import="dto.MemberDTO"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>
<jsp:useBean id="dao" class="dao.msgDAO" />
<%
	//로그인 시 세션에 저장된 member_id를 받아서 회원 정보를 호출함.
		String member_id = (String)request.getAttribute("member_id");
		member_id = "2"; //임시테스트용 
		MemberDTO dto = dao.MemberInfo(member_id);
%>


