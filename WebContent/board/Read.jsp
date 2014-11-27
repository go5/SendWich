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
	<!-- 지도,  보드, 차트 회원정보 종합-->
	<!---start-content---->
	<div class="container">
		<!-- 지도 -->
		<div id="staticMap" style="width: 100%; height: 300px"></div>

		<!-- 사진 부분 없으면 기본 이미지-->
						<c:if test="${!empty boardDTO.photo}">
							<img src="upload/${boardDTO.photo}" class="img-rounded" align="middle"
								>
						</c:if>
						<c:if test="${empty boardDTO.photo}">
						<img src="images/single-post-pic.jpg" class="img-rounded">
						</c:if>
		<!-- 제목 -->
		<h3>${boardDTO.title}</h3>
		${boardDTO.name}
		<!--  내용 -->
		<div class="row">
			<div class="span8">
			<pre>
				<p>${boardDTO.textarea}</p>
			</pre>
			</div>
		</div>

			<!-- 평가표 -->
			<c:if test="${! empty chartList }" >
		<div class="row">
			<div class="span5" >
			 	<jsp:include page="/chart/Chart_Read.jsp" />
			</div>
		</div>
			</c:if>
		<div class="clear"></div>
		<!-- 관리버튼 -->
		<div class="row">
		<c:if test="${memberDTO.member_id eq boardDTO.member_id}">
			<div class=" span3">
				<a href="javascript:fnupdate();"><img src="images/edit-icon.png">글 수정</a>
			</div>
			<div class="span3">
				<a href="javascript:fndel();"><img src="images/delete-icon.png">글 삭제</a>
			</div>
		</c:if>
			<div class="span3">
				<a href="main?cmd=INDEX"><img src="images/list-icon.png">목록으로</a>
			</div>

		</div>


		<div class="clear"></div>
		<!---start-comments-section--->
		<jsp:include page="/board/Sub_Comment.jsp" />
		<!---//End-comments-section--->

	</div>

	<jsp:include page="/map/mapkey.html" />
	<script>
function fndel(){
	if(confirm("삭제 하시겠습니까?")){
		alert("삭제하였습니다");
	location.href="main?cmd=DELBOARD&board_id="+${boardDTO.board_id};		
	}	
}

function fnupdate(){
	location.href="main?cmd=UPDATEBOARD&board_id="+${boardDTO.board_id};		
}

		var gis_x = ${mapDTO.gis_x};
		var gis_y = ${mapDTO.gis_y};
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

