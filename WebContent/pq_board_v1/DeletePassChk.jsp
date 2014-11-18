<%@page import="dto.pq_boardDTO"%>
<%@page import="dto.pq_replyDTO"%>
<%@page import="dao.pq_boardDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%
	String delpassword = request.getParameter("delpassword");
String delanswer = (String)session.getAttribute("delanswer");
String delboard_id = (String) session.getAttribute("delboard_id");
dao.pq_boardDAO dao = new dao.pq_boardDAO();


int board_id =Integer.parseInt(delboard_id);

System.out.println(delpassword);
System.out.println(delanswer);
%>

<%
//비밀번호를 확인하여 게시글 삭제 확인.
if(!delanswer.equals(delpassword)){
	%>
	<script>
		alert("답이 틀렸습니다");
		history.back();
	</script>
<%
}else{
	dao.deleteBoard(board_id);
	%>
	<script>
		alert("삭제되었습니다");
		location.href="/TeamPR/pq_board?cmd=list";
	</script>
<%
}
%>

</body>
</html>