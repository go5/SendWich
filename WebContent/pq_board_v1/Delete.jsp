<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<%
	String delboard_id = (String) session.getAttribute("delboard_id");
	String delanswer = (String) session.getAttribute("delanswer");

	System.out.println("딜리트 jsp" + delboard_id);
	System.out.println("딜리트 jsp" + delanswer);
%>
</head>
<body>
	<form action="DeletePassChk.jsp" method="post">
		<div align="center">
			<div>
				게시물 정답 : <input type="text" name="delpassword" id="delpassword">
			</div>
			<div>
				<input type="submit" value="삭제">
			</div>
		</div>
	</form>
</body>
</html>