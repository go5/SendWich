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
	<div id="staticMap" style="width: 100%; height: 300px"></div>
	<div class="container">



		<form method="post" action="main?cmd=POSTPROC"
			enctype="multipart/form-data" onsubmit="return fnSubmit(this)" >
			<input type="hidden" value="${mapDTO.loc_id}" id="loc_id"
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

			<div id="field1">
				<div>
					<h2>평가</h2>
					항목은 최소3개 이상, 값은 0~10 범위입니다. 빈칸으로 둘 수 없습니다.<br/>
					제목을 비우면 그래프가 작성되지 않습니다.
					<div>
						<span>제목</span> <input type="text" name="title1" id="title1" />
					</div>
				</div>
				<!-- 항목은 3개 받게 일단 고정. -->
				<c:forEach begin="1" end="3">
					<div>
						<div style="float: left">
							<span>항목</span> <input type="text" name="key1" id="key1" />
						</div>
						<div style="float: left">
							<span>값</span> <input type="text" name="value1" id="value1" />
						</div>
					</div>
					<div style="clear: both;"></div>
				</c:forEach>
				<div id="addchartzone"></div>
				<!-- 항목추가 구역. -->
				<div>
					<input type="button" class="btn" id="add1" value="+"
						onclick="fnAddItem()" />
				</div>
			</div>

			<div>
				사진을 올려 주세요.(일단 한장. 이후에 추가예정.)<br /> 파일은 jpg, png, gif 확장자만
				가능합니다.(최대 5mb) <br /> <input type="file" class="text" name="photo"
					id="photo" accept="image/jpeg, image/png, image/gif">
			</div>

			<input type="submit" class="btn" value="Send!" /> <input
				type="button" class="btn" value="뒤로가기"
				onclick="javascript:history.back();" />
		</form>


	</div>

	<jsp:include page="/map/mapkey.html" />
	<script src="http://code.jquery.com/jquery-2.1.1.js"></script>
	<script>
		//전송
		function fnSubmit(f) {
			var file = f.photo.value;
			var chartKey = document.getElementsByName("key1");
			var chartVal = document.getElementsByName("value1");

			//주제 안쓰면 입력 안됨(패스), 
			if (document.getElementById("title1").value != "") {
				
				for (var i = 0; i < chartKey.length; i++) {

					//항목-값 쌍이 있어야함(안맞으면 스톱). 
					if (chartKey[i].value == "" && chartVal[i].value == "") {
						alert("항목과 값은 빌 수 없습니다.");
						return false;
					}

					//값은 1~10까지(안맞으면 스톱).
					if (chartVal[i].value > 10 || chartVal[i].value < 0) {
						alert("값 범위를 벗어났습니다.");
						return false;
					}
				}
			}

			//그림파일인지 확장자 확인
			if (file == "") {
				return true;
			}else if (uploadfile_check(file)) {
				f.submit();
				//업로드 파일이 그림 파일 형식에 맞으면 전송
			} else {
				return false;
			}
		}

		//업로드파일 확장자 확인.
		function uploadfile_check(file) {
			var str_dotlocation, str_ext, str_low;
			str_value = file;

			str_low = str_value.toLowerCase(str_value);
			str_dotlocation = str_low.lastIndexOf(".");
			str_ext = str_low.substring(str_dotlocation + 1);

			switch (str_ext) {
			case "gif":
			case "jpg":
			case "png":
				return true;
				break;
			default:
				alert("그림 파일 입력 양식에 맞지 않는 파일입니다.")
				return false;
			}
		}

		//맵 부분
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

		//차트 부분
		var maxcnt = 3;
		//항목 추가.
		function fnAddItem() {
			var html = '<div><div style="float: left"><span>항목</span> <input type="text" name="key1" id="key1" /></div> <div style="float: left"> <span>값</span> <input type="text" name="value1" id="value1" /> </div></div><div style="clear: both;"></div>';
			var $addZone = $("#addchartzone");
			$addZone.before(html);
		};
	</script>
</body>
</html>

