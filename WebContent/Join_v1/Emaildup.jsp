<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/HeadInfo.jsp"></jsp:include>
<style>
	.row{
		margin-top:20%;
	}
</style>
</head>
<jsp:include page="/Sub_Header.jsp" />
<body class="container">
	<div class="row">
		<div class="span12">
			<div class="dropdown">
				<form action="main?cmd=VALIDEMAIL" method="post" name="emaidup" class="form-inline">
					<div align="center">
						이메일을 입력 : &nbsp;&nbsp;<input type="email" name="email" id="email" onblur="fnEmail()" class="input"/>&nbsp;&nbsp; <input type="button" value="중복확인" onclick="fnIsNull()" class="btn">
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