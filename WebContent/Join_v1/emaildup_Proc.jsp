<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>
<%@ include file="conn_db.jsp"%>


	<%
		String msql; //sql 문.
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		
		session.setAttribute("email", email);

		msql = "SELECT email FROM member WHERE email='" + email + "'"; // 중복된 id관련 쿼리문
		rs = stmt.executeQuery(msql);

		if (rs.next() == true) { // 아이디가 있으면.
			out.println("<script>alert('해당 이메일은 가입되어 있습니다.');history.back();</script>"); // 중복된 아이디 있으면 얼랏창 및 직전페이지
		} else {
			//없는 거임. 넘어강
			//System.out.println("없음");
			response.sendRedirect("main?cmd=CONJOIN");// 중복된 아이디 없으면 회원가입 페이지로 이동.
		}
	%>





