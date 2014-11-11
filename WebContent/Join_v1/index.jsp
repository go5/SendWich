<%@page import="dto.MemberDTO"%>
<%@ page  contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<a href="login.html">로그인</a>
<a href="editmember.jsp">정보수정</a>

<%


MemberDTO dto = (MemberDTO)session.getAttribute("memberDTO");
int member_id = dto.getMember_id();
String email = dto.getEmail();



%>
<br/>
로그인한 멤버 id는: <%=member_id %><br>
로그인 한 이메일는 :<%=email %>

<a href="editmember.jsp?email=<%=email%>">수 정</a>
<a href="deletemember.jsp?email=<%=email %>">삭 제</a>

</body>
</html>