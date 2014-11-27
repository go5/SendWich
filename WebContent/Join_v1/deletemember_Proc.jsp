<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/HeadInfo.jsp" />
</head>
<body>
	<div class="content" align="center">
		<div class="wrap">
			<div class="single-page" style="margin-top: 20px">
				<c:if test="${flag =='true' }">
					<div>
						회원 탈퇴가 정상적으로 이루어졌습니다.<br /> 감사합니다.
					</div>
					<%
	session.removeAttribute("memberDTO");
%>	
					<div>
						<a href="javascript:fnclose()"><button>닫기</button></a>
					</div>
				</c:if>

				<c:if test="${!flag =='true' }">
					<div>패스워드가 다릅니다. 확인해주세요.</div>
					<div >
						<a href="javascript:fnclose()"><button>닫기</button></a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<script>
		function fnclose() {
			
			window.opener.location.href = "main?cmd=INDEX";
			window.close();
		}
	</script>
</body>
</html>

