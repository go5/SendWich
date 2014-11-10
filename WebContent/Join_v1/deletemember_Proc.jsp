<%@ page  contentType="text/html; charset=utf-8" %>
<jsp:useBean id="dao" class="dao.MemberDAO"/>
<jsp:useBean id="dto" class="dto.MemberDTO"/>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String email=request.getParameter("email");
String password = request.getParameter("password");

dto = dao.getInfo(email);

if(password.equals(dto.getPassword())){
	dao.deleteMember(email);

%>
<script>
alert("삭제되었습니다.");
location.href="login.html";
</script>

<%	
}else if(!password.equals(dto.getPassword())){
%>
<script>
alert("패스워드 틀림ㅋ");
history.back();
</script>
<%
}

%>