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
<jsp:include page="HeadInfo.jsp"/>
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
						<img src="images/single-post-pic.jpg" title="banner1">
						<h3>
							<a href="#">incididunt ut labore et dolore magna aliqua. Ut
								enim ad minim veniam</a>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur.</p>
						<p class="para1">Excepteur sint occaecat cupidatat non
							proident, sunt in culpa qui officia deserunt mollit anim id est
							laborum. Lorem ipsum dolor sit amet, consectetur adipisicing
							elit, sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur.</p>
						<p class="para2">Excepteur sint occaecat cupidatat non
							proident, sunt in culpa qui officia deserunt mollit anim id est
							laborum. Lorem ipsum dolor sit amet, consectetur adipisicing
							elit, sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur.</p>
					</div>
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
				<div class="comment-section">
					<div class="grids_of_2">
						<h2>Comments</h2>
						<div class="grid1_of_2">
							<div class="grid_img">
								<a href=""><img src="images/pic10.jpg" alt=""></a>
							</div>
							<div class="grid_text">
								<h4 class="style1 list">
									<a href="#">Uku Mason</a>
								</h4>
								<h3 class="style">march 2, 2013 - 12.50 AM</h3>
								<p class="para top">All the Lorem Ipsum generators on the
									Internet tend to repeat predefined chunks as necessary, making
									this the first true generator on the Internet. It uses a
									dictionary of over 200 Latin words, combined with a handful of
									model sentence structures, to generate Lorem Ipsum which looks
									reasonable.</p>
								<a href="" class="btn1">Click to Reply</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="grid1_of_2 left">
							<div class="grid_img">
								<a href=""><img src="images/pic10.jpg" alt=""></a>
							</div>
							<div class="grid_text">
								<h4 class="style1 list">
									<a href="#">Designer First</a>
								</h4>
								<h3 class="style">march 3, 2013 - 4.00 PM</h3>
								<p class="para top">All the Lorem Ipsum generators on the
									Internet tend to repeat predefined chunks as necessary, making
									this the first true generator on the Internet. It uses a
									dictionary of over 200 Latin words, combined with a handful of
									model sentence structures, to generate Lorem Ipsum which looks
									reasonable.</p>
								<a href="" class="btn1">Click to Reply</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="grid1_of_2">
							<div class="grid_img">
								<a href=""><img src="images/pic12.jpg" alt=""></a>
							</div>
							<div class="grid_text">
								<h4 class="style1 list">
									<a href="#">Ro Kanth</a>
								</h4>
								<h3 class="style">march 2, 2013 - 12.50 AM</h3>
								<p class="para top">All the Lorem Ipsum generators on the
									Internet tend to repeat predefined chunks as necessary, making
									this the first true generator on the Internet. It uses a
									dictionary of over 200 Latin words, combined with a handful of
									model sentence structures, to generate Lorem Ipsum which looks
									reasonable.</p>
								<a href="" class="btn1">Click to Reply</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="artical-commentbox">
							<h2>Leave a Comment</h2>
							<div class="table-form">
								<form action="#" method="post" name="post_comment">
									<div>
										<label>Name<span>*</span></label> <input type="text"  value="이름">
									</div>
									<div>
										<label>Email<span>*</span></label> <input type="text"
											value="이메일">
									</div>
									<div>
										<label>Your Comment<span>*</span></label>
										<textarea> 내용 </textarea>
									</div>
								</form>
								<input type="submit" value="submit">

							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<!---//End-comments-section--->
			</div>
		</div>
	</div>
</body>
</html>

