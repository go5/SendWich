<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<jsp:include page="/HeadInfo.jsp"/>
<style>
	body{
		background-image: url(images/bg.png);
	}
	div{
		margin-left: 50;
		margin-right: 50;
		margin-top: 50;
		margin-bottom:50;
		text-align: center;
		
	}
	label{
		font-family: '맑은 고딕';
		vertical-align: middle;
		margin-left: 0.5em;
		font-size: 1em;
		font-weight: bold;
	}
</style>
</head>
<body>
<div>
<img src="/SendWich/images/err.png" /><br/>
<label>죄송합니다. 페이지를 찾지 못하였습니다.<br/>
혹은, 비 정상적인 경로로의 접근입니다. <br/></label>
<a href="/SendWich/index.jsp"><img src="/SendWich/images/err_back.png"/></a>
</div>
</body>
</html>