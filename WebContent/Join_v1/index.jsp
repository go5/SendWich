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
String member_id = (String)session.getAttribute("member_id");
String email = (String)session.getAttribute("email");

out.println(member_id);
%>
<br/>
로그인 한 이메일는 :<%=email %>

<a href="editmember.jsp?email=<%=email%>">수 정</a>
<a href="deletemember.jsp?email=<%=email %>">삭 제</a>

</body>
</html>