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
</head>
<body>
	<!---start-wrap---->
	<!---start-header---->

	<jsp:include page="Header.jsp" />

	<!---//End-header---->
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<div class="grid1">
					<div class="artical-commentbox">
						<div class="table-form">
							<form action="#" method="post" name="post_comment">
								<h3>Join Us</h3>
								<div>
									<label>Eamil<span>*</span></label> <input type="email"
										value=" "> <label>@</label>
								</div>
								<div>
									<label>Name<span>*</span></label> <input type="text" id="name"
										name="name" onblur="fnName()" />
								</div>
								<div>
									<label>Password<span>*</span></label> <input type="text"
										value=" ">
								</div>
								<div>
									<label>Password Confrim<span>*</span></label> <input
										type="text" value=" ">
								</div>
								<div>
									<label>연락처<span>*</span></label> <input type="text" id="phone"
										name="phone" onblur="fnPhone()">
								</div>
							</form>
							<input type="submit" value="submit">

						</div>
						<div class="table-form">
							<h3>Welcome to JoinUs&nbsp;</h3>
							<p>&nbsp;</p>
							<p>blahblah blahblahblahblahblahblah</p>
							<p>&nbsp;</p>
							<p>blahblah</p>
							<p>
								blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah<br />
								blahblahblahblahblahblah
							</p>
							<p>blahblahblahblahblahblahblahblahblahblahblahblah</p>
						</div>
						<p>blahblahblahblahblahblahblahblahblahblahblahblahblahblah</p>
						<p>blahblahblahblahblahblahblahblah</p>
						<p>
							blahblahblahblahblahblah<br />blahblahblahblahblahblahblahblahblahblahblahblahblahblah<br />
							<br />blahblahblahblahblahblahblahblahblahblahblahblah<br /> <br />
							<br /> <br />blahblahblahblahblahblahblahblahblahblahblahblahblahblah
						</p>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>