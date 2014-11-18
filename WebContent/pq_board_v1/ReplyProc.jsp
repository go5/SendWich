<%@ page contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<script>
	alert("정답이에요!")
	location.href="pq_board?cmd=repread";
	//리플을 달았을 경우 repread를 거침.
</script>
