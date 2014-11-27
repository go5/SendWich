<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<jsp:include page="/HeadInfo.jsp" />
</head>
<body>

	<div class="container">
		<div class="row">
			<div>
				<dl>
					<dt>SendWich가 잃게 되는 것</dt>
					<dd>가입시 입력하신 모든 정보</dd>
					<dd>올리신 모든 글</dd>
					<dd>올리신 모든 사진</dd>
				</dl>
				<hr />
				<dl>
					<dt>SendWich가 잃지 않는 것.</dt>
					<dd>입력하신 평가점수.</dd>
				</dl>
			</div>
			<hr />
			<div>마지막으로 정보를 확인해 주세요.</div>
			<form action="main?cmd=DELETEMEMPROC" method="post" class="form input-form">
				<div align="center" style="float: left;">이메일 :</div>
				<div align="right">
					<input type="text" name="email" id="email" placeholder="${email}">
				</div>
				<div align="center" style="float: left;">비밀번호 :</div>
				<div align="right">
					<input type="password" name="password" id="password"/><br />
				</div>
				<input type="submit" value="탈퇴 확인" class="btn"/> <a
					href="javascript:window.close()"><input type="button"
					value="돌아가기" class="btn" /></a>
			</form>
		</div>
	</div>
</body>
</html>