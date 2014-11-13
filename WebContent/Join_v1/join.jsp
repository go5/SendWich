<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SendWich-위치 기반 폐쇄형 SNS</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />

<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() {setTimeout(hideURLbar, 0);}, false); 
	 function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<!---start-click-drop-down-menu----->
<script src="js/jquery.min.js"></script>
<!----webfonts---->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css' />
<!----//webfonts---->
<!-- Global CSS for the page and tiles -->
<link rel="stylesheet" href="css/main.css" />
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

		if (pwd1.length < 4 || pwd1.length < 4) {
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

</head>
<body>
	<!---start-wrap---->
	<!---start-header---->

	<jsp:include page="/Sub_Header.jsp" />

	<!---//End-header---->
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<div class="grid1">
					<div class="artical-commentbox">
						<div class="table-form">
							<form action="main?cmd=REGMEM" method="post" name="join" id="join">
								<h3>Join Us</h3>
								<div>
									<label>Eamil<span>*</span></label> <input type="text"
										readonly="readonly" name="email" id="email" value="${email }" />
								</div>
								<div>
									<label>이름<span>*</span></label> <input type="text" id="name"
										name="name" onblur="fnName()" />
								</div>
								<div>
									<label>비밀번호<span>*</span></label> <input type="password"
										id="pwd1" name="pwd1" onblur="fnPwd()" />
								</div>
								<div>
									<label>비밀번호 확인<span>*</span></label> <input type="password"
										id="pwd2" name="pwd2" onblur="fnPwd()" />
								</div>
								<div>
									<label>연락처<span>*</span></label> <input type="text" id="phone"
										name="phone" onblur="fnPhone()">
								</div>
							<input type="button" value="가입" onclick="fnIsNull()" />
							</form>

						</div>
						<div class="table-form">
							<div>
								<h3>Welcome to SendWich&nbsp;</h3>
								<p>반갑습니다!</p>
								<p>여기는 장소기반 네트워크 send위치! 입니다</p>
								<p>소개</p>
								<p>뭔 p가 이리 많노</p>
								약관 써야됨.<br />


							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>