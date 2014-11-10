<%@ page  contentType="text/html; charset=utf-8" %>
<%
String email = request.getParameter("email");

%>
<form action="deletemember_Proc.jsp" method="post">
아이디 : <input type="text" name="email" id="email" readonly="readonly" value="<%= email%>"><br/>
비밀번호확인 : <input type="password" name="password" id="password"/><br/>
<input type="submit" value="삭제">
<a href="index.jsp"><input type="button" value="취소"></a>
</form>