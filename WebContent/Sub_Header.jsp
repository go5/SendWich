<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar  navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<button type="button" class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="brand" href="main?cmd=INDEX"><img src="images/logo.png"
				title="SendWich" /></a>

			<c:choose>
				<c:when test="${!empty memberDTO}">
					<div class="nav-collapse collapse">
						<ul class="nav">
							<!-- 검색창 부분. -->
	<li>
								<form class="form-search" action="main?cmd=MAP" method="post">
									<div class="input-append">
										<input type="text" class="span4 input-medium" id="keyword"
											name="keyword" value="${param.keyword }"
											placeholder="위치?!"> <a href="#"><span
											class="add-on"><i class="icon-search"></i></span></a>
									</div>
								</form>
							</li>
							
							<li><a href="main?cmd=MEMINFO">회원 정보</a></li>
							<li><a href="main?cmd=FRIENDS">친구목록</a></li>
							<li><a href="main?cmd=MSGLIST">메세지</a></li>
							<li><a href="javascript:fnLogout()">로그아웃</a></li>
							<li class="active"><a>${memberDTO.name} 님! 반갑습니다!</a></li>
						</ul>
					</div>
				</c:when>

				<c:when test="${empty memberDTO}">
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li><a href="main?cmd=JOIN">회원가입</a></li>
							<li><a href="main?cmd=REPASS">비번찾기</a></li>
							<!-- 
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> 아이디/비번 찾기 <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="#">아이디 찾기</a></li>
									<li><a href="#">비번 찾기</a></li>
								</ul></li>
							 -->
						</ul>
						<form class="navbar-form pull-right" name="login" id="login"
							action="main?cmd=LOGINPROC" method="post">

							<input name="logemail" id="logemail" class="span3" type="email"
								placeholder="Email"> <input name="logpassword"
								id="logpassword" class="span3" type="password"
								placeholder="Password"
								onkeypress="if( event.keyCode==13 ){fnLogin();}" />

							<button type="button" onclick="fnLogin()" class="btn btn-danger">로그인</button>
						</form>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>

<script>
<!-- //login page -->
	function fnLogin() {document.login.submit();}
	<!-- //logout page -->
	function fnLogout() {
		cw = screen.availWidth; //화면 넓이
		ch = screen.availHeight; //화면 높이
		sw = 200; //띄울 창의 넓이
		sh = 200; //띄울 창의 높이
		ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
		mt = (ch - sh) / 2; //가운데 띄우기위한 창의 y위치
		window.open("main?cmd=LOGOUT", "logout", "width=" + sw + ", height="
						+ sh + ", top=" + mt + ", left=" + ml
						+ ", resizable=no", false);
	}
</script>