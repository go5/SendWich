<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=utf-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<HTML>
<link href="style.css" rel="stylesheet" type="text/css">


<BODY>
<% 
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="dao.pq_boardDAO"/>
<jsp:useBean id="dto" class="dto.pq_boardDTO"/>

<div align="center">
<h1>어디게~?</h1>
</div>

<table align="center" width="80%" border=0 cellspacing=0 cellpadding=3>
	<tr>
		<td align=center colspan=2>
			<table border=0 width=100% cellpadding=2 cellspacing=0>
				<tr align="center"  color=#D0D0D0 height=120%>
					<td> 번호</td>
					<td> 제목</td>
					<td> 이름</td>
					<td> 날짜</td>
				</tr>
				
				<!-- dto에 저장되어 있는 게시글에 대해 반복문을 통해 뿌려줌. -->
				<c:forEach items="${dtoList}" var="dto">
					<tr align="center"  color=#D0D0D0 height=120%>
						<td> ${dto.board_id}</td>
						<td>
							<a href="pq_board?cmd=read&board_id=${dto.board_id}&answer=${dto.answer}">${dto.title}</a>
						</td> 
						<td> ${dto.member_name}</td>
						<td> ${dto.upload_date}</td>
					</tr>
				</c:forEach>
				
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td align=right>
			<a href="/SendWich/pq_board?cmd=write">[글쓰기]</a>
			<a href="/pq_board?cmd=list">[처음으로]</a>
		</td>
	</tr>
</table>
<BR>


</BODY>
</HTML>