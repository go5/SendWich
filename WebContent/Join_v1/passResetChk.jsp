<%@ page contentType="text/html; charset=utf-8"%>


<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	boolean flag = (Boolean)request.getAttribute("flag");
	String passResetEmail = (String)request.getAttribute("email");
	session.setAttribute("passResetEmail", passResetEmail);
	System.out.println(passResetEmail);

	if (flag==true) {
%>
<script>
	alert("정보가 확인되었습니다.");
	location.href = "main?cmd=PASSUPDATE";
</script>

<%
	} else if (flag==false) {
%>
<script>
	alert("정보가 없습니다.");
	location.href = "main?cmd=REPASS";
</script>
<%
	}
%>

