<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
<!---start-content---->
<div class="content">
	<div class="wrap">
		<div id="main" role="main">
			<ul id="tiles">
				<!-- These are our grid blocks 블럭 시작.-->

				<!--  로그인해야만 보이는 블럭, 본인+친구 게시글 -->
				<c:choose>
					<c:when test="${!empty memberDTO}">
					<c:forEach var="listdto"  items="${boardList}">
						<li onclick="location.href='main?cmd=CONTENT&board_id=${listdto.board_id}';">
						<img	src="images/img1.jpg" width="600" height="118">
							<div class="post-info">
								<div class="post-basic-info">
									<h3>
										<a href="#">${listdto.title}</a>
									</h3>
									<span><a href="#"><label> </label><nobr>${listdto.loc_name} </nobr></a></span>
									<div style="text-overflow:ellipsis; overflow:hidden;">
									<p><nobr>${listdto.textarea} </nobr></p></div>
								</div>
								<div class="post-info-rate-share">
									<div class="rateit">
										<span> </span>
									</div>
									<div class="rateit">
										<span> </span>
									</div>
									<div class="rateit">
										<span> </span>
									</div>
									<div class="clear"></div>
								</div>
							</div>
							</li>
						<!-- 한 블럭 끝. -->

					</c:forEach>
					</c:when>
				</c:choose>

				<li onclick="location.href='single-page.html';"><img
					src="images/img2.jpg" width="600" height="344">
					<div class="post-info">
						<div class="post-basic-info">
							<h3>
								<a href="#">SendWich 소개글</a>
							</h3>
							<span><a href="#"><label> </label>위치</a></span>
							<div style="text-overflow:ellipsis; overflow:hidden;">
									<p><nobr>샌드 위치에 대한 소개, 비접속자들은 이거만 보임fa<br/>
									;lksdjfl;askdjf;laksdjf;laksdjf;lkasdjf;lkasdjf;lkasdjf.</nobr></p></div>
						</div>
						<div class="post-info-rate-share">
							<div class="rateit">
								<span> </span>
							</div>
							<div class="rateit">
								<span> </span>
							</div>
							<div class="rateit">
								<span> </span>
							</div>
							<div class="clear"></div>
						</div>
					</div></li>


				<li onclick="location.href='single-page.html';"><img
					src="images/img3.jpg" width="600" height="210">
					<div class="post-info">
						<div class="post-basic-info">
							<h3>
								<a href="#">예시1</a>
							</h3>
							<span><a href="#"><label> </label>위치</a></span>
							<div style="text-overflow:ellipsis; overflow:hidden;">
							<p><nobr>관리자가 올린 예시들임.</nobr></p>
							</div>
						</div>
						<div class="post-info-rate-share">
							<div class="rateit">
								<span> </span>
							</div>
							<div class="rateit">
								<span> </span>
							</div>
							<div class="rateit">
								<span> </span>
							</div>
							<div class="clear"></div>
						</div>
					</div></li>


				<!-- End of grid blocks -->



			</ul>
		</div>
	</div>
</div>
<!---//End-content---->
<!----wookmark-scripts---->
<script src="js/jquery.imagesloaded.js"></script>
<script src="js/jquery.wookmark.js"></script>
<script type="text/javascript">
	(function($) {
		var $tiles = $('#tiles'), $handler = $('li', $tiles), $main = $('#main'), $window = $(window), $document = $(document), options = {
			autoResize : true, // This will auto-update the layout when the browser window is resized.
			container : $main, // Optional, used for some extra CSS styling
			offset : 20, // Optional, the distance between grid items
			itemWidth : 280
		// Optional, the width of a grid item
		};
		/**
		 * Reinitializes the wookmark handler after all images have loaded
		 */
		function applyLayout() {
			$tiles.imagesLoaded(function() {
				// Destroy the old handler
				if ($handler.wookmarkInstance) {
					$handler.wookmarkInstance.clear();
				}

				// Create a new layout handler.
				$handler = $('li', $tiles);
				$handler.wookmark(options);
			});
		}
		/**
		 * When scrolled all the way to the bottom, add more tiles
		 */
		function onScroll() {
			// Check if we're within 100 pixels of the bottom edge of the broser window.
			var winHeight = window.innerHeight ? window.innerHeight : $window
					.height(), // iphone fix
			closeToBottom = ($window.scrollTop() + winHeight > $document
					.height() - 100);

			if (closeToBottom) {
				// Get the first then items from the grid, clone them, and add them to the bottom of the grid
				var $items = $('li', $tiles), $firstTen = $items.slice(0, 10);
				$tiles.append($firstTen.clone());

				applyLayout();
			}
		}
		;

		// Call the layout function for the first time
		applyLayout();

		// Capture scroll event.
		$window.bind('scroll.wookmark', onScroll);
	})(jQuery);
</script>
 --%>



	<!-- Main hero unit for a primary marketing message or call to action -->
	<div class="row">
<div class="container">
<div class="span12">
	<div class="span6" >
		<h1>SendWich 소개</h1>
		<p>샌드 위치를 소개하는 곳. 그냥 글 목록이랑 마찬가지니까 그냥 쓰자.</p>
		<p>
			<a href="main?cmd=ABOUTUS" class="btn btn-primary btn-large">읽어보기
				&raquo;</a>
		</p>
	</div>
	</div>

	<!-- Example row of columns -->
	<!--  로그인해야만 보이는 블럭, 본인+친구 게시글 -->
	
		<c:choose>
			<c:when test="${!empty memberDTO}">
				<c:forEach var="listdto" items="${boardList}">


					<div class="span5"
						style="text-overflow: ellipsis; overflow: hidden;">
						<img src="images/single-post-pic.jpg" class="img-rounded">
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
				<nobr>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</nobr>
			</p>
			<p>
				<a class="btn" href="#">자세히 보기 &raquo;</a>
			</p>
		</div>
		
		<div class="span5" style="text-overflow: ellipsis; overflow: hidden;">
			<img src="images/single-post-pic.jpg" class="img-rounded">
			<h2>예시 2</h2>
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

	<hr/>

	<footer>
		<p>&copy; 2014 SendWich</p>
	</footer>



