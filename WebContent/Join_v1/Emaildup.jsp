<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/HeadInfo.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/Sub_Header.jsp" />
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<form action="main?cmd=VALIDEMAIL" method="post" name="emaidup">
					<div align="center" >
						이메일을 입력해주세요.<br /> <br /> <input type="email" name="email"
							id="email" onblur="fnEmail()" />&nbsp;&nbsp; <input
							type="button" value="중복확인" onclick="fnIsNull()">
					</div>
				</form>
			</div>
		</div>
	</div>

<script>
	function fnIsNull() { // 이메일 관련 스크립트
		var email = document.getElementById("email").value;

		if (email == "") {
			alert("값이 비어있습니다.");
		} else if (email.indexOf("@") == -1 || email.indexOf(".") == -1) {
			alert("올바르게 입력하세요.");
		} else {
			document.emaidup.submit();
		}
	}
</script>
</body>
</html>