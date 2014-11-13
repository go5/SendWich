<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/HeadInfo.jsp"></jsp:include>
</head>

<body>
	<div class="content">
		<div class="wrap">
			<div class="single-page" style="margin-top: 10px">
				<form action="main?cmd=LOGINPROC" method="post">

					<div align="center" style="border: 1px solid; width: 400px;">
						<div>
							<div style="width: 100px; float: left;">E-mail :</div>
							<div>
								<input name="email" type="email" id="email" />
							</div>
						</div>

						<div>
							<div style="width: 100px; float: left;">패스워드 :</div>
							<div>
								<input name="pwd1" type="password" id="email" />
							</div>
						</div>


						<div style="width: 200px; float: left;">
							<input type="submit" value="로그인" />
						</div>
						<div>
							<input type="button" value="취소" />
						</div>
					</div>

					<a href="idSearch.html"><span>ID/PWD찾기</span></a>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>