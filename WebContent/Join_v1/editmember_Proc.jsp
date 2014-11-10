<%@ page  contentType="text/html; charset=utf-8" %>
<jsp:useBean id="dto" class="dto.MemberDTO"/>
<jsp:useBean id="dao" class="dao.MemberDAO"/>


<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String email = request.getParameter("email");
String pass = request.getParameter("repeatPass");


dto=dao.getInfo(email);

if(pass.equals(dto.getPassword())){
	System.out.println("맞아");
	
	dto.setName(request.getParameter("name"));
	dto.setPassword(request.getParameter("password"));
	dto.setPhone_number(request.getParameter("phone_number"));
	dto.setEmail(request.getParameter("email"));
	
 	dao.updateMember(dto);

	%>
	<script>
	alert("잘 수정되었습니다");
	location.href="index.jsp";
	</script>
	<%
}else{
	%>
	<script>
	alert("비밀번호가 다릅니다.");
	history.back();
	</script>
	<%
}


%>
