<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main hero unit for a primary marketing message or call to action -->
<div class="container">
	<div class="span12">
		<div class="row">
			<div class="span3"></div>
			<div class="hero-unit" style="background-color: lightgray">
				<h1>SendWich 소개</h1>
				<p>샌드 위치를 소개하는 곳.</p>
				<p>
					<a href="main?cmd=ABOUTUS" class="btn btn-primary btn-large">읽어보기
						&raquo;</a>
				</p>
			</div>
			<div class="span3"></div>
		</div>
		<div class="row">
			<div class="span12"></div>
		</div>

		<!-- Example row of columns -->
		<!--  로그인해야만 보이는 블럭, 본인+친구 게시글 -->

		<c:choose>
			<c:when test="${!empty memberDTO}">
				<c:forEach var="listdto" items="${boardList}">


					<div class="span5"
						style="text-overflow: ellipsis; overflow: hidden; background-color: #ffffff;margin-bottom: 10px">
						<c:if test="${!empty listdto.photo}">
							<img src="upload/${listdto.photo}" class="img-rounded" align="middle"
								>
						</c:if>
						<c:if test="${empty listdto.photo}">
						<img src="images/single-post-pic.jpg" class="img-rounded">
						</c:if>
						<h2>${listdto.title}</h2>
						<p>
							<nobr>${listdto.textarea} </nobr>
						</p>
						<p>
							<a class="btn"
								href="main?cmd=CONTENT&board_id=${listdto.board_id}">자세히 보기
								&raquo;</a>
						</p>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>


		<div class="span5" style="text-overflow: ellipsis; overflow: hidden;">
			<img src="images/single-post-pic.jpg" class="img-rounded">
			<h2>예시 1</h2>
			<p>
				<nobr>시연을 위해 둔 예시 입니다. 기능은 없습니다. </nobr>
			</p>
			<p>
				<a class="btn" href="#">자세히 보기 &raquo;</a>
			</p>
		</div>

		<div class="span5" style="text-overflow: ellipsis; overflow: hidden;">
			<img src="images/single-post-pic.jpg" class="img-rounded">
			<h2>예시 2</h2>
			<p>
				<nobr>실질적인 이벤트나 공지글들이 올라갈 예정입니다.</nobr>
			</p>
			<p>
				<a class="btn" href="#">자세히 보기 &raquo;</a>
			</p>
		</div>



		<div class="span5" style="text-overflow: ellipsis; overflow: hidden;">
			<img src="images/single-post-pic.jpg" class="img-rounded">
			<h2>예시 3</h2>
			<p>
				<nobr>Donec sed odio dui. Cras justo odio, dapibus ac
					facilisis in, egestas eget quam. Vestibulum id ligula porta felis
					euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor
					mauris condimentum nibh, ut fermentum massa justo sit amet risus.</nobr>
			</p>
			<p>
				<a class="btn" href="#">자세히 보기 &raquo;</a>
			</p>
		</div>

		<div class="span5" style="text-overflow: ellipsis; overflow: hidden;">
			<img src="images/single-post-pic.jpg" class="img-rounded">
			<h2>예시 4</h2>
			<p>
				<nobr>Donec sed odio dui. Cras justo odio, dapibus ac
					facilisis in, egestas eget quam. Vestibulum id ligula porta felis
					euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor
					mauris condimentum nibh, ut fermentum massa justo sit amet risus.</nobr>
			</p>
			<p>
				<a class="btn" href="#">자세히 보기 &raquo;</a>
			</p>
		</div>

	</div>
</div>
<!-- /container -->

<hr />

<footer>
	<p>&copy; 2014 SendWich</p>
</footer>



