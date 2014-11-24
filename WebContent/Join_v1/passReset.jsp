<%@ page  contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/HeadInfo.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/Sub_Header.jsp" />
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="dropdown">
					<form action="main?cmd=PASSRESETCHK" method="post"
						name="passresetChk">
						<div align="center">
							<br />
							<br />
							<br />이메일을 입력해주세요.<br /> <input type="email" name="email"
								id="email" />&nbsp;&nbsp; <br />
							<br /> 전화번호를 입력하세요(-제외)<br /> <input type="text"
								name="phone_number" id="phone_number" />&nbsp;&nbsp; <br />
							<br /> <input type="button" value="비밀번호 재설정" onclick="fnIsNull()">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
	function fnIsNull() { // 이메일 관련 스크립트
		var email = document.getElementById("email").value;
		var phone_number = document.getElementById("phone_number").value;

		if (email == ""||phone_number=="") {
			alert("값이 비어있습니다.");
		}  else {
			document.passresetChk.submit();
		}
	}
</script>