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
			<img src="upload/${boardDTO.photo}" align="middle">



		<form method="post" action="main?cmd=UPDATEPROC" enctype="multipart/form-data">
			<input type="hidden" value="${mapDTO.loc_id}" id="loc_id" name="loc_id">
			<input type="hidden" value="${boardDTO.board_id}" id="board_id" name="board_id">
			<div class="row">
				<div class="span1">제목</div>
				<input class="span11" type="text" class="text" name="title"
					id="title" placeholder="제목" value="${boardDTO.title}" />
			</div>

			<div class="row">
				<div class="span1">&nbsp;</div>
				<textarea class="span11" rows="12" name="textarea" id="textarea"
					placeholder="하고싶은 이야기가 더 있나요?" >${boardDTO.textarea}</textarea>
			</div>

			평가표 는 아직 수정이 되지 않습니다. ㅠㅠ 


			<div>
				사진을 올려 주세요.(일단 한장. 이후에 추가예정.)<br />
				파일은 jpg, png, gif 확장자만 가능합니다.(최대 5mb) <br/>
					지금 등록된 사진파일: ${boardDTO.photo}<br/>
				 <input type="file" class="text"
					name="photo" id="photo" accept="image/jpeg, image/png, image/gif" >
			</div>

			<input type="button" onclick="fnSubmit(this.form)" class="btn"
				value="수정하기" /> <input type="button" class="btn" value="뒤로가기"
				onclick="javascript:history.back();" />
		</form>


	</div>

	<jsp:include page="/map/mapkey.html" />
	<script src="http://code.jquery.com/jquery-2.1.1.js"></script>
	<script>
		//전송
		
		function fnSubmit(f) {
			var file = f.photo.value;
			//그림파일인지 확장자 확인
			if (file =="") {
					f.submit();
			}
				if (uploadfile_check(file)) {
					alert("수정되었습니다")
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

