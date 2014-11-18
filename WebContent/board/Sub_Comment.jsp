<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!---start-comments-section--->
<div class="comment-section">
	<div class="grids_of_2">
		<h2>댓글</h2>

		<!-- 
		 댓글 목록 블럭. 당연히 로그인된 상태에서만 보여야함.
		 -->
		<c:choose>
			<c:when test="${!empty memberDTO}">
				<c:forEach var="listdto" items="${replyList}">
					<div class="grid1_of_2">
						<div class="grid_img">
							<a href=""><img src="images/pic10.jpg" alt=""></a>
						</div>
						<div class="grid_text">
							<h4 class="style1 list">
								<a href="#">${listdto.reply_text }</a>
							</h4>
							<h3 class="style">${listdto.reply_date }</h3>
							<p class="para top">${listdto.name }</p>
						</div>
						<div class="clear"></div>
					</div>

				</c:forEach>
			</c:when>
		</c:choose>
		<!-- 기본 양식
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
					Internet tend to repeat predefined chunks as necessary, making this
					the first true generator on the Internet. It uses a dictionary of
					over 200 Latin words, combined with a handful of model sentence
					structures, to generate Lorem Ipsum which looks reasonable.</p>
				<a href="" class="btn1">Click to Reply</a>
			</div>
			<div class="clear"></div>
		</div>
 -->




		<!-- comment 입력 -->
		<div class="artical-commentbox">
			<a name="reply"></a>
			<div class="table-form" style="width: 100%;">
				<form action="#" method="post" name="reply">
					<!--  			<div>
						<input type="text" readonly="readonly" value="${memberDTO.name} (${memberDTO.email})">
					</div>
-->
					<div style="width: 100%;">
						<textarea placeholder="comment"> </textarea>
					</div>
					<input type="submit" value="댓글 달기">
				</form>

			</div>
			<div class="clear"></div>
		</div>


	</div>
</div>
<!---//End-comments-section--->

