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
<jsp:include page="/HeadInfo.jsp" />
	<style>
	#answer{color: navy; font: bold;}
	</style>
</head>
<body>
	

	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="/Sub_Header.jsp" />

	<!---//End-header---->
	<!---start-content---->
			<div class="single-page">
				<div class="single-page-artical">
					<div class="artical-content">
						<img src="/TeamPR/pq_board_v1/upload/${file}" title="banner1">
						
						<p>${dto.textarea}</p>

					</div>
					<div class="artical-links">
						<ul>
							<li><a href="#"><img src="images/blog-icon2.png"
									title="Admin"><span>admin</span></a></li>
							<li><a href="#"><img src="images/blog-icon3.png"
									title="Comments"><span>No comments</span></a></li>
							<li><a href="#"><img src="images/blog-icon4.png"
									title="Lables"><span>View posts</span></a></li>
							<li><a href="pq_board?cmd=list"><img src="images/reply.png" title="list"><span>List</span></a></li>
							<li><a href="pq_board_v1/DeleteMemChk.jsp?delboard_id=${dto.board_id}&delmember_id=${dto.member_id }&delanswer=${dto.answer}">
							<img src="images/close2.png" title="delete"><span>Delete</span></a></li>
																																									
						</ul>
					</div>
					
					<div class="clear"></div>
				</div>
				<!---start-comments-section--->
				<div class="comment-section">
					<div class="grids_of_2">
						
						답 : ${dto.answer} 회원 번호 : ${dto.member_id} 현재 로그인 회원 번호 :${member_id }
						
						<c:forEach items="${replist}" var="repdto">
							<div align="center">
								<div>
									<h2 id="answer">
									 <b>${repdto.member_name}</b> 님은 정답을 맞추셨어요!
									</h2>
								</div>
							</div>
						</c:forEach>
						
					
				
				<%@include file="ReplyWrite.jsp"%>
			</div>
			</div>
			</div>
			
</body>
</html>

