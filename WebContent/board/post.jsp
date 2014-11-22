<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/HeadInfo.jsp" />
</head>
<body>
	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="/Sub_Header.jsp" />
	<!---//End-header---->
	<!---start-content---->
	<div class="container">
		<div class="row" id="staticMap" style="width: 100%; height: 300px"></div>



		<form method="post" action="main?cmd=POSTPROC">
			<input type="hidden" value="${param.keyword }" id="keyword"
				name="keyword"> <input type="hidden"
				value="${param.loc_name }" id="loc_name" name="loc_name"> <input
				type="hidden" value="${param.gis_x }" id="gis_x" name="gis_x">
			<input type="hidden" value="${param.gis_y }" id="gis_y" name="gis_y">
			<div class="row">
				<div class="span1">제목</div>
				<input class="span11" type="text" class="text" name="title" id="title" placeholder="제목" />
			</div>

			<div class="row">
				<div class="span1">&nbsp;</div>
				<textarea class="span11" rows="12" name="textarea" id="textarea" placeholder="하고싶은 이야기가 더 있나요?"></textarea>
			</div>

			<div>평가표 작성 들어갈 자리</div>
			<div>
				사진을 올려 주세요.(일단 한장. 이후에 추가예정.)<br /> <input type="file" class="text"
					name="photo" id="photo">
			</div>

			<input type="submit" class="btn" value="Send!" /> <input
				type="button" class="btn" value="뒤로가기"
				onclick="javascript:history.back();" />
		</form>


	</div>

	<jsp:include page="/map/mapkey.html" />
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

