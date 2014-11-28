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

		if(newpassword1 == "") {
			alert("비밀번호를 넣어주세요.")
		}else if (newpassword1.length < 4) {
			alert("비밀번호는 4글자 이상이어야 합니다.");
		}else if (newpassword1 != newpassword2) {
			alert("변경될 비밀번호가 다릅니다. 확인해주세요");
		} else{
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
		String passResetEmail = (String)session.getAttribute("passResetEmail");
		System.out.println("passUpdate.jsp: "+passResetEmail);
	%>
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<div class="single-page-artical">
					<div class="artical-content">
						<form name="editf" method="post" action="main?cmd=PASSEDIT">
							<div>
								<div>이메일:</div>
								<div>
										 <input type="text"
										name="email" id="email" readonly="readonly"
										value=<%=passResetEmail %> /> 

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


							<div align="center">
								<input type="button" value="비밀번호 수정" onclick="fnIsNull()" /> 
								<a href="main?cmd=INDEX"><input type="button" value="돌아가기" /></a>
								
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>