<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/HeadInfo.jsp" />
</head>
<body>
	<!---start-header---->
	<jsp:include page="/Sub_Header.jsp" />
	<!---//End-header---->
	<!---start-content---->
	<div class="container">
		<!-- 지도 -->
		<div id="staticMap" style="width: 100%; height: 300px"></div>

		<!-- 사진 부분 -->
		<img src="images/single-post-pic.jpg" align="middle">
		<!-- 제목 -->
		<h3>${boardDTO.title}</h3>
		<!--  내용 -->
		${boardDTO.textarea}

		<!-- 관리버튼 -->
		<div class="row">
			<a href="#"><img src="images/blog-icon2.png" title="Admin"><span>글
					수정</span></a> <a href="#reply"><img src="images/blog-icon3.png"
				title="Comments"><span>댓글 달기</span></a> <a href="main?cmd=INDEX"><img
				src="images/blog-icon4.png" title="Lables"><span>목록으로</span></a>

		</div>


		<div class="clear"></div>
		<!---start-comments-section--->
		<jsp:include page="/board/Sub_Comment.jsp" />
		<!---//End-comments-section--->

	</div>

	<jsp:include page="/map/mapkey.html" />
	<script>
		var gis_x = $
		{
			mapDTO.gis_x
		};
		var gis_y = $
		{
			mapDTO.gis_y
		};
		var loc_name = '${mapDTO.loc_name}';

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

