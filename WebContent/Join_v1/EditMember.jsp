<%@page import="dto.MemberDTO"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/HeadInfo.jsp" />
<script>
	function fnIsNull() {
		var newpassword1 = document.getElementById("newpassword1").value;
		var newpassword2 = document.getElementById("newpassword2").value;
		var password = document.getElementById("password").value

		if (password == "" || password == null) {
			alert("비밀번호를 입력해주세요.");
		} else if ((newpassword1 == "" && newpassword2 == "")) {
			document.editf.submit();
		} else if (newpassword1 != newpassword2) {
			alert("변경될 비밀번호가 다릅니다. 확인해주세요");
		} else if (password.length < 4 || newpassword1.length < 4) {
			alert("비밀번호는 4글자 이상이어야 합니다.");
		} else {
			document.editf.submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="/Sub_Header.jsp" />
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		MemberDTO memberdto = (MemberDTO) session.getAttribute("memberDTO");
	%>
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<div class="single-page-artical">
					<div class="artical-content">
						<form name="editf" method="post" action="main?cmd=EDITINFO">
							<div>
								<div>이메일:</div>
								<div>
									<input type="text" name="email" id="email" readonly="readonly"
										value="${memberDTO.email}" />
								</div>
							</div>

							<div>
								<div>이름:</div>
								<div>
									<input type="text" name="name" id="name"
										value="${memberDTO.name}" />
								</div>
							</div>

							<div>
								<div>패스워드확인 :</div>
								<div>
									<input type="password" name="password" id="password" />
								</div>
							</div>

							<div>
								<div>변경패스워드 :</div>
								<div>
									<input type="password" name="newpassword1" id="newpassword1" />
								</div>
							</div>

							<div>
								<div>변경패스워드확인 :</div>
								<div>
									<input type="password" name="newpassword2" id="newpassword2" />
								</div>
							</div>

							<div>
								<div>전화번호 :</div>
								<div>
									<input type="text" name="phone_number" id="phone_number"
										value="${memberDTO.phone_number}" />
								</div>
							</div>

							<div>
								<div>가입일 :</div>
								<div>${memberDTO.join_date}</div>
							</div>

							<div align="center">
								<input type="button" value="정보수정" onclick="fnIsNull()" />
								&nbsp;&nbsp;&nbsp; <a href="main?cmd=INDEX"><input
									type="button" value="취소" /></a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>