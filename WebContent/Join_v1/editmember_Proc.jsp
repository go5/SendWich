<%@ page  contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:choose>
<c:when test="${flag eq true }">
	<script>
	alert("잘 수정되었습니다");
	location.href="main?cmd=INDEX";
	</script>
</c:when>
<c:when test="${!flag eq true }">
	<script>
	alert("비밀번호가 다릅니다.");
	history.back();
	</script>
</c:when>
	</c:choose>
