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
			<input type="text" value="${mapDTO.loc_id}" id="loc_id"
				name="loc_id">
			<div class="row">
				<div class="span1">제목</div>
				<input class="span11" type="text" class="text" name="title"
					id="title" placeholder="제목" />
			</div>

			<div class="row">
				<div class="span1">&nbsp;</div>
				<textarea class="span11" rows="12" name="textarea" id="textarea"
					placeholder="하고싶은 이야기가 더 있나요?"></textarea>
			</div>

			평가표 작성 들어갈 자리




			<div id="field1">
				<div>
					<h2>평가</h2>
					<div>
						<span>주제</span> <input type="text" name="title1" id="title1" />
					</div>
				</div>
				<div>
					<div style="float: left">
						<span>항목</span> <input type="text" name="key1" id="key1" />
					</div>
					<div style="float: left">
						<span>값</span> <input type="text" name="value1" id="value1" />
					</div>
				</div>
				<div style="clear: both;"></div>
				<div>
					<div style="float: left">
						<span>항목</span> <input type="text" name="key1" id="key1" />
					</div>
					<div style="float: left">
						<span>값</span> <input type="text" name="value1" id="value1" />
					</div>
				</div>
				<div style="clear: both;"></div>
				<div>
					<div style="float: left">
						<span>항목</span> <input type="text" name="key1" id="key1" />
					</div>
					<div style="float: left">
						<span>값</span> <input type="text" name="value1" id="value1" />
					</div>
				</div>
				<div style="clear: both;"></div>
				<div>
					<div style="float: left">
						<span>항목</span> <input type="text" name="key1" id="key1" />
					</div>
					<div style="float: left">
						<span>값</span> <input type="text" name="value1" id="value1" />
					</div>
				</div>
				<div style="clear: both;"></div>
				<div>
					<div style="float: left">
						<span>항목</span> <input type="text" name="key1" id="key1" />
					</div>
					<div style="float: left">
						<span>값</span> <input type="text" name="value1" id="value1" />
					</div>
				</div>
				<div>
					<input type="button" class="btn" id="add1" value="+" />
				</div>
			</div>























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
		//맵 부분
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

		//차트 부분
		// 서브밋 체크
		$("#form").submit(function() {
			// value값 저장
			var $value = $("input[id='value']").val().trim();
			var $key = $("input[id='key']").val().trim();
			var min = '1';
			var max = '10';
			//주제 체크
			if ($("#title").val().trim() == "") {
				alert("주제를 정해 주세요.");
				$("#title").focus();
				return false;
			}
			//항목 체크
			else if ($key == "") {
				alert("항목을 입력하지 않았습니다.")
				$("#key").focus();
				return false;
			}
			//값 체크
			else if ($value == "") {
				alert("항목값을 입력하지 않았습니다.")
				$("#value").focus();
				return false;
			}
			//값 범위 체크
			else if ($value != "" && ($value > min && $value < max)) {
				alert("입력 범위를 초과하였습니다.");
				$("#value").focus();
				return false;
			}//다체크 되면 실행
			else {
				return true;
			}
		});
	</script>
</body>
</html>

