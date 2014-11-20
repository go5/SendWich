<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
<div class="header">
	<div class="wrap">
		<div class="logo">
			<a href="main?cmd=INDEX"><img src="images/logo.png"
				title="pinbal" /></a>
		</div>



		<!--로그인에 따른 분기 -->
		<c:choose>
			<!-- 로그인 시 -->
			<c:when test="${!empty memberDTO}">
		<div class="box" id="box">
			<div class="box_content">
				<div class="box_content_center">
					<div class="form_content">
						<div class="menu_box_list">
							<ul>
								<li><a href="main?cmd=INDEX"><span>첫 화면으로</span></a></li>
								<li><a href="main?cmd=MEMINFO"><span>회원정보</span></a></li>
								<li><a href="main?cmd=FRIENDS"><span>친구</span></a></li>
								<li><a href="main?cmd=MSGLIST"><span>쪽지함</span></a></li>
								<li><form id="logout">
										<a href="javascript:fnLogout()"><span>로그아웃</span></a>
									</form></li>
							</ul>
							<div class="clear"></div>
						</div>
						<a class="boxclose" id="boxclose"> <span> </span></a>
					</div>
				</div>
			</div>
		</div>

		
				<!-- 검색창 부분. -->
				<div class="top-searchbar">
					<form action="main?cmd=MAP" method="post">
						<input type="text" id="keyword" name="keyword" placeholder="장소 검색" value="${param.keyword }" /><input type="submit"
							value="" />
					</form>
				</div>

				<div class="nav-icon">
					<a href="#" class="right_bt" id="activator"><span> </span> </a>
				</div>

				<div class="userinfo">
					<div class="user">
						<ul>
							<li><img src="images/user-pic.png" title="user-name" /></li>
							<li><blockquote>${memberDTO.name}님</blockquote> <span>안녕하세요!</span></li>
						</ul>
					</div>
				</div>
			</c:when>
			<!-- 비 로그인 -->
			<c:when test="${empty memberDTO}">
	

				<div class="top-searchbar" style="margin-top: 10px" align="right">

					<form name="login" id="login" action="main?cmd=LOGINPROC"
						method="post">
						<input name="logemail" required="required" type="email"
							id="logemail" placeholder="E-mail" /> <input name="logpassword"
							required="required" type="password" id="logpassword"
							placeholder="password" onkeypress="if( event.keyCode==13 ){fnLogin();}"/>
					</form>
				</div>
				<div class="userinfo">
					<div class="user">
						<ul>
							<li><a href="javascript:fnLogin()"><span>Login</span></a></li>
							<li><span> | </span></li>
							<li><a href="main?cmd=JOIN"><span>JoinUs</span></a></li>
						</ul>
					</div>
				</div>
			</c:when>
		</c:choose>
		<div class="clear"></div>
	</div>
</div>
<!----start-dropdown--->
<script type="text/javascript">
	var $ = jQuery.noConflict();
	$(function() {
		$('#activator').click(function() {
			$('#box').animate({
				'top' : '0px'
			}, 500);
		});
		$('#boxclose').click(function() {
			$('#box').animate({
				'top' : '-700px'
			}, 500);
		});
	});
	$(document).ready(function() {
		//Hide (Collapse) the toggle containers on load
		$(".toggle_container").hide();
		//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
		$(".trigger").click(function() {
			$(this).toggleClass("active").next().slideToggle("slow");
			return false; //Prevent the browser jump to the link anchor
		});
	});
	<!----//End-dropdown--->
	<!-- //login page -->
	function fnLogin() {
		//window.open("main?cmd=LOGIN", "", "width=500, height=200", false);
		document.login.submit(); 
	}
	<!-- //logout page -->
	function fnLogout() {
		cw = screen.availWidth; //화면 넓이
		ch = screen.availHeight; //화면 높이
		sw = 200; //띄울 창의 넓이
		sh = 200; //띄울 창의 높이
		ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
		mt = (ch - sh) / 2; //가운데 띄우기위한 창의 y위치
		//location.href="main?cmd=DELETEMEM";
		window.open("main?cmd=LOGOUT", "logout", "width=" + sw
				+ ", height=" + sh + ", top=" + mt + ", left=" + ml
				+ ", resizable=no", false);
	}
</script>
--%>


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
											name="keyword" value="${param.keyword }" placeholder="위치!">
										<a href="#"><span class="add-on"><i
												class="icon-search"></i></span></a>
									</div>
								</form>
							</li>
							<li class="active"><a href="main?cmd=MEMINFO">회원 정보</a></li>
							<li><a href="main?cmd=FRIENDS">친구목록</a></li>
							<li><a href="main?cmd=MSGLIST">메세지</a></li>
							<li><a href="javascript:fnLogout()">로그아웃</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Dropdown <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li class="nav-header">Nav header</li>
									<li><a href="#">Separated link</a></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
						</ul>
					</div>
				</c:when>

				<c:when test="${empty memberDTO}">
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li>
								<form class="form-search" action="main?cmd=MAP" method="post">
									<div class="input-append">
										<input type="text" class="span4 input-medium" id="keyword"
											name="keyword" value="${param.keyword }"
											placeholder="테스트용 검색창"> <a href="#"><span
											class="add-on"><i class="icon-search"></i></span></a>
									</div>
								</form>
							</li>

							<li><a href="main?cmd=JOIN">회원가입</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> 아이디/비번 찾기 <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="#">아이디 찾기</a></li>
									<li><a href="#">비번 찾기</a></li>
								</ul></li>
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
	function fnLogin() {
		document.login.submit();
	}
	<!-- //logout page -->
	function fnLogout() {
		cw = screen.availWidth; //화면 넓이
		ch = screen.availHeight; //화면 높이
		sw = 200; //띄울 창의 넓이
		sh = 200; //띄울 창의 높이
		ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
		mt = (ch - sh) / 2; //가운데 띄우기위한 창의 y위치
		window
				.open("main?cmd=LOGOUT", "logout", "width=" + sw + ", height="
						+ sh + ", top=" + mt + ", left=" + ml
						+ ", resizable=no", false);
	}
</script>