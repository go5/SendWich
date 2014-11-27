<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/HeadInfo.jsp" />
<style>
	#join{
		margin-top: 3%;
	}
</style>
</head>
<body>
	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="/Sub_Header.jsp" />
	<!---//End-header---->
	<form action="main?cmd=REGMEM" method="post" name="join" id="join"	class="form-horizontal">
		<div style="float:left;">
		<div class='control-group'>
			<div class="controls">
				<legend>Join Us</legend>
			</div>
		</div>
		<div class='control-group'>
			<label class="control-label">Email<span>*</span></label>
			<div class="controls">
				<input type="text" readonly="readonly" name="email" id="email"
					value="${email}" class="input" />
			</div>
		</div>
		<div class='control-group'>
			<label class="control-label">이름<span>*</span></label>
			<div class="controls">
				<input type="text" id="name" name="name" onblur="fnName()" />
			</div>
		</div>
		<div class='control-group'>
			<label class="control-label">비밀번호<span>*</span></label>
			<div class="controls">
				<input type="password" id="pwd1" name="pwd1" onblur="fnPwd()" />
			</div>
		</div>
		<div class='control-group'>
			<label class="control-label">비밀번호 확인<span>*</span></label>
			<div class="controls">
				<input type="password" id="pwd2" name="pwd2" onblur="fnPwd()" />
			</div>
		</div>
		<div class='control-group'>
			<label class="control-label">연락처<span>*</span></label>
			<div class="controls">
				<input type="text" id="phone" name="phone" onblur="fnPhone()">
			</div>
		</div>
		<div class='control-group'>
			<div class="controls">
				<input type="button" value="가입" onclick="fnIsNull()" class="btn" />
			</div>
		</div>
		</div><!-- join -->
		<div style="float:left;">
		<div class='control-group'>
			<div class="controls">
			<h3>Welcome to SendWich&nbsp;</h3>
			<p>반갑습니다!</p>
			<p>여기는 장소기반 네트워크 send위치! 입니다</p>
			<p>소개</p>
			<p>뭔 p가 이리 많노</p>
			약관 써야됨.<br />
			</div>
		</div>
		</div><!-- agreement -->
	</form>
	<div class="clear"></div>


	<script>
		function fnEmail() {
			var email = document.join.email.value;
			if (email.indexOf("@") == -1) { //indexOf에 값이있으면 정수형으로 반환. 없으면 -1로 반환.
				alert("올바르게 입력하세요.");
			}
		}
		function fnPwd() {
			var pwd1 = document.getElementById("pwd1").value;
			var pwd2 = document.getElementById("pwd2").value;

			if (pwd1.length < 4) {
				alert("4글자 이상 써주세요.");
			}
		}
		function fnPhone() {
			var pwd = document.join.pwd.value;
			if (pwd<0 && pwd>9) {
				alert("숫자만 입력하세요.");
			}
		}

		function fnIsNull() {
			var name = document.getElementById("name").value;
			var pwd1 = document.getElementById("pwd1").value;
			var pwd2 = document.getElementById("pwd2").value;
			var email = document.getElementById("email").value;
			var phone = document.getElementById("phone").value;

			if (name == "" || pwd1 == "" || pwd2 == "" || email == ""
					|| phone == "") {
				alert("값이 비어있습니다.");
			} else if (pwd1 == "" || pwd2 == "") {
				alert("비밀번호를 입력해주세요.");
				document.getElementById("email").focus();
			} else if (pwd1 != pwd2) {
				alert("비밀번호가 다릅니다. 확인해주세요");
			} else {
				document.join.submit();
			}
		}
	</script>


</body>
</html>