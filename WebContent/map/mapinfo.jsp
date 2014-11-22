<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<jsp:include page="/HeadInfo.jsp" />
</head>
<body>
	<!--  header  -->
	<jsp:include page="/Sub_Header.jsp" />
	<!--  end header  -->

	<!-- 지도 영역 -->
	<div class="container">
		<div id="staticMap" style="width: 100%; height: 300px"></div>
	</div>


	<div class="container">
		foreach의 아이템 변경해야함. 장소 기준으로 글 뽑기.
		<h3>내가 평가한 이 장소</h3>
		<div class="row">
			<!-- 로그인이 아니라 글 목록 기준. -->
			<c:if test="${!empty memberDTO}">
				<c:choose>

					<c:when test="${empty memboardList}">
						<div class="hero-unit" style="background-color: lightgray">
							<form method="post" action="main?cmd=POST" id="hiddenpost"
								name="hiddenpost">
								<input type="hidden" value="${param.keyword }" id="keyword"
									name="keyword"> <input type="hidden"
									value="${param.loc_name }" id="loc_name" name="loc_name">
								<input type="hidden" value="${param.gis_x }" id="gis_x"
									name="gis_x"> <input type="hidden"
									value="${param.gis_y }" id="gis_y" name="gis_y">
								<h1>본인 글쓰기</h1>
								<p>본인이 이 장소에 대해서 쓴 글이 없으면 글쓰기 링크로.</p>
								<p>
									<button type="submit" class="btn btn-danger btn-large">글쓰기
										&raquo;</button>
								</p>
							</form>
						</div>
					</c:when>

					<c:when test="${!empty memboardList}">
						<c:forEach var="listdto" items="${memboardList}">

							<div class="span5"
								style="text-overflow: ellipsis; overflow: hidden;">
								<img src="images/single-post-pic.jpg" class="img-rounded">
								<h2>${listdto.title}</h2>
								<p>
									<nobr>${listdto.textarea} </nobr>
								</p>
								<p>
									<a class="btn"
										href="main?cmd=CONTENT&board_id=${listdto.board_id}">자세히
										보기 &raquo;</a>
								</p>
							</div>


						</c:forEach>
					</c:when>
				</c:choose>
			</c:if>
		</div>


		<hr />
		친구의 글 목록 호출 WHERE 장소가 여기 인 곳.<br />
		<h3>내 친구들이 평가한 이 장소</h3>
		<div class="row">
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
		</div>

		<hr />
		<h3>회원님들이 평가한 이 장소</h3>
		<div class="row">그래프들 호출</div>

	</div>


	</div>






	<jsp:include page="mapkey.html" />
	<script>
		var gis_x = document.getElementById("gis_x").value;
		var gis_y = document.getElementById("gis_y").value;
		var loc_name = document.getElementById("loc_name").value;

		// 이미지 지도에서 마커가 표시될 위치입니다
		var markerPosition = new daum.maps.LatLng(gis_x, gis_y);

		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다
		var marker = [ {
			position : markerPosition
		}, {
			position : markerPosition,
			text : "위치!: " + loc_name
		// text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
		} ];

		var staticMapOption = {
			center : markerPosition, // 이미지 지도의 중심좌표
			level : 3, // 이미지 지도의 확대 레벨
			marker : marker
		// 이미지 지도에 표시할 마커 
		};

		// 이미지 지도를 생성합니다
		var staticMap = new daum.maps.StaticMap(document
				.getElementById('staticMap'), staticMapOption);
	</script>
</body>
</html>