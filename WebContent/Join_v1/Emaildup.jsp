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
</head>
<body>
	<jsp:include page="/Sub_Header.jsp" />
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<form action="main?cmd=VALIDEMAIL" method="post" name="emaidup">
					<div align="center" >
						이메일을 입력해주세요.<br /> <br /> <input type="text" name="email"
							id="email" onblur="fnEmail()" />&nbsp;&nbsp; <input
							type="button" value="중복확인" onclick="fnIsNull()">
					</div>
				</form>
			</div>
		</div>
	</div>

	<%
		System.out.println("???");
	%>
</body>
</html>