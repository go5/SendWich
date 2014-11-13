<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!---start-comments-section--->
<div class="comment-section">
	<div class="grids_of_2">
		<h2>Comments</h2>
		
		<!-- 
		 댓글 목록 블럭
		 -->
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
					Internet tend to repeat predefined chunks as necessary, making this
					the first true generator on the Internet. It uses a dictionary of
					over 200 Latin words, combined with a handful of model sentence
					structures, to generate Lorem Ipsum which looks reasonable.</p>
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
					Internet tend to repeat predefined chunks as necessary, making this
					the first true generator on the Internet. It uses a dictionary of
					over 200 Latin words, combined with a handful of model sentence
					structures, to generate Lorem Ipsum which looks reasonable.</p>
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
					Internet tend to repeat predefined chunks as necessary, making this
					the first true generator on the Internet. It uses a dictionary of
					over 200 Latin words, combined with a handful of model sentence
					structures, to generate Lorem Ipsum which looks reasonable.</p>
				<a href="" class="btn1">Click to Reply</a>
			</div>
			<div class="clear"></div>
		</div>
		
		<!-- comment 입력 -->
		<div class="artical-commentbox">
			<h2>Leave a Comment</h2>
			<div class="table-form">
				<form action="#" method="post" name="post_comment">
					<div>
						<label>Name<span>*</span></label> <input type="text" value="이름">
					</div>
					<div>
						<label>Email<span>*</span></label> <input type="text" value="이메일">
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

