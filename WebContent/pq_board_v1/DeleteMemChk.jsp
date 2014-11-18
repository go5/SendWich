<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<%
String delboard_id = request.getParameter("delboard_id");
String delmember_id = request.getParameter("delmember_id");
String delanswer = request.getParameter("delanswer");
String loginmember  = (String)session.getAttribute("member_id");

session.setAttribute("delboard_id", delboard_id);
session.setAttribute("delanswer", delanswer);


System.out.println("jsp 보드"+delboard_id);
System.out.println("jsp 멤버"+delmember_id);
System.out.println("jsp 정답"+delanswer);
System.out.println("jsp 로그인멤버"+loginmember);
%>
</head>
<body>

<%
if(!loginmember.equals(delmember_id)){
	//현재 접속해있는 멤버가 삭제 권한이 있나 없나 확인.
%>
<script>
alert("삭제 권한이 없습니다");
history.back();
</script>
<%
}else{
%>
<script>
location.href="Delete.jsp?";
</script>
<%	
}
%>


</body>
</html>