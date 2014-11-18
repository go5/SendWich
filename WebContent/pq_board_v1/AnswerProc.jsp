<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		String answer = (String) session.getAttribute("answer");
		String reply_field = request.getParameter("reply_field");
		
		
		session.setAttribute("reply_field1", reply_field);
		System.out.println("answerproc"+reply_field);
		System.out.println("answer"+answer);

		if (!answer.equals(reply_field)) {
			%>
			<script>
			alert("답이 틀렸습니다");
			history.back();
			</script>
			
			<%
			//리플이 정답이 맞아 확인.
			} else {
			%>
			<script>
			location.href="/TeamPR/pq_board?cmd=replyWrite";
			</script>
	<% 
		}
	%>
</body>
</html>