<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>
<%@ include file="conn_db.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
function fnIsNull() {
	var pwd1= document.getElementById("password").value;
	var pwd2= document.getElementById("pwd2").value;

	if(pwd1==""||pwd2==""){
		alert("값이 비어있습니다.");
	}
	else if(pwd1==""||pwd2==""){
		alert("비밀번호를 입력해주세요.");
	}else if(pwd1!=pwd2){
		alert("비밀번호가 다릅니다. 확인해주세요");
	}else if(pwd1.length < 4|| pwd2.length<4) {
		alert("4글자 이상 써주세요.");
	}else{
		document.editf.submit();
	}
}
</script>
</head>
<body>

<jsp:useBean id="dto" class="dto.MemberDTO"/>
<jsp:useBean id="dao" class="dao.MemberDAO"/>
<jsp:setProperty name="dto" property="*" />

<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String email = request.getParameter("email");

dto = dao.getInfo(email);

System.out.println(email);
%>


<form name ="editf" method="post" action="editmember_Proc.jsp">
<input type="hidden" name="email" value="<%=email %>"/>
<table>



<tr>
	<td>이메일 :</td>
	<td><%=email %> </td>
</tr>

<tr>
	<td>이름 :</td>
	<td><input type="text" name="name" id="name" value="<%=dto.getName()%>"/></td>
</tr>

<tr>
	<td>패스워드확인 :</td>
	<td><input type="password" name="repeatPass" id="repeatPass" > </td>
</tr>

<tr>
	<td>변경패스워드 :</td><%=dto.getPassword() %>
	<td><input type="password" name="password" id="password"> </td>
</tr>

<tr>
	<td>변경패스워드확인 :</td>
	<td><input type="password" name="pwd2" id="pwd2" > </td>
</tr>

<tr>
	<td>전화번호 :</td>
	<td><input type="text" name="phone_number" id="phone_number" value=<%=dto.getPhone_number() %>></td>
</tr>

<tr>
<td colspan="2" align="center">
	<input type="button" value="정보수정" onclick="fnIsNull()"/> &nbsp;&nbsp;&nbsp;
	<a href="index.jsp"><input type="button" value="취소여"/></a>
</td>
</tr>


</table>

</form>

</body>
</html>