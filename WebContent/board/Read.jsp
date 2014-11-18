<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>SendWich-위치 기반 폐쇄형 SNS</title>
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="utf-8">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
<!----webfonts---->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!----//webfonts---->
<link rel="stylesheet" href="css/main.css">
<!-- Global CSS for the page and tiles -->
	
<!--  menubar -->
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<!---start-click-drop-down-menu----->
<script src="js/jquery.min.js"></script>

</head>
<body>
	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="/Sub_Header.jsp" />
	<!---//End-header---->
	<!---start-content---->
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<div class="single-page-artical">
					<div class="artical-content">
					<!-- 사진 부분 -->
						<img src="images/single-post-pic.jpg" title="banner1">
						<!-- 제목 -->
						<h3>
							<a href="#">${boardDTO.title}</a>
						</h3>
						<!--  내용 -->
						<p>${boardDTO.textarea}</p>
					</div>
					<!-- 관리버튼 -->
					<div class="artical-links">
						<ul>
							<li><a href="#"><img src="images/blog-icon2.png"
									title="Admin"><span>admin</span></a></li>
							<li><a href="#"><img src="images/blog-icon3.png"
									title="Comments"><span>No comments</span></a></li>
							<li><a href="#"><img src="images/blog-icon4.png"
									title="Lables"><span>View posts</span></a></li>
						</ul>
					</div>
					<!--  소셜 링크 -->
					<div class="share-artical">
						<ul>
							<li><a href="#"><img src="images/facebooks.png"
									title="facebook">Facebook</a></li>
							<li><a href="#"><img src="images/twiter.png"
									title="Twitter">Twiiter</a></li>
							<li><a href="#"><img src="images/google+.png"
									title="google+">Google+</a></li>
							<li><a href="#"><img src="images/rss.png" title="rss">Rss</a></li>
						</ul>
					</div>
					
					
					
					<div class="clear"></div>
				</div>
				<!---start-comments-section--->
				<jsp:include page="/board/Sub_Comment.jsp" />
				<!---//End-comments-section--->
			</div>
		</div>
	</div>
</body>
</html>

