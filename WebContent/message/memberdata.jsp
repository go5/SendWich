<%@page import="dto.MemberDTO"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>
<jsp:useBean id="dao" class="dao.msgDAO" />
<%
	//�α��� �� ���ǿ� ����� member_id�� �޾Ƽ� ȸ�� ������ ȣ����.
		String member_id = (String)request.getAttribute("member_id");
		member_id = "2"; //�ӽ��׽�Ʈ�� 
		MemberDTO dto = dao.MemberInfo(member_id);
%>


