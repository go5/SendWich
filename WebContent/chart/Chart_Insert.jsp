<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link href="/SendWich/css/bootstrap.css" rel="stylesheet" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/SendWich/js/bootstrap.js"></script>
<script>
	$(document).ready(function() {
		//주제 추가
		$("#addtitle1").click(function() {
			$("#field2").css("visibility", "visible");
			$("#addbtn2").css("visibility", "visible");
			$("#addbtn1").css("visibility", "hidden");
		});
		$("#addtitle2").click(function() {
			$("#field3").css("visibility", "visible");
			$("#addbtn3").css("visibility", "visible");
			$("#addbtn2").css("visibility", "hidden");
		});
		//주제 삭제
		$("#deltitle1").click(function() {
			$("#field2").css("visibility", "hidden");
			$("#addbtn2").css("visibility", "hidden");
			$("#addbtn1").css("visibility", "visible");
		});
		$("#deltitle2").click(function() {
			$("#field3").css("visibility", "hidden");
			$("#addbtn3").css("visibility", "hidden");
			$("#addbtn2").css("visibility", "visible");
		});

		// 서브밋 체크
		$("#form").submit(function(){
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
	});

	// var count = 0;
	// function fnAppendItem(){
	// 	count++;

	// 	var newItem = document.createElement("div");
	// 	newItem.setAttribute("id", "item_" + count);

	// 	var html = '<div class="input-prepend"><span class="add-on">항목</span><input type="text" class="span2" placeholder="항목" name="key" /></div><div class="input-prepend"><span class="add-on">값</span><input type="text" class="span2" placeholder="1~10 입력" name="value"/></div><input type="button" class="btn value="삭제" onclick="fnRemoveItem('+count+')"/>';
	// 	newItem.innerHTML = html;

	// 	var itemListNode = $("#addfield");
	// 	itemListNode.appendChild(newItem);
	// }

	// function fnRemoveItem(idCount){
	// 	var item = $("#item_"+idCount);
	// 	if(item != null){
	// 		item.parentNode.removeChild(item);
	// 	}
	// }
</script>
<style>
 #key{width: 150px;}
 #value{width:25px;}
</style>
</head>

<body>
	<form method="post" action="/SendWich/chart?cmd=Chart_Insert" name="Chart_Insert" id="form">
			<!-- 게시판번호넘김 -->
			<input type="hidden" name="board_id" value="4" />
			<!-- 로컬정보 넘김 -->
			<input type="hidden" name="loc_id" value="6" />
			<div id="field1">
			<div>
				<h2>평가</h2>
				<div>
					<span>주제</span>
					<input type="text" name="title1" id="title1" />
				</div>
			</div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key1" id="key1" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value1" id="value1" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key1" id="key1" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value1" id="value1" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key1" id="key1" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value1" id="value1" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key1" id="key1" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value1" id="value1" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key1" id="key1" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value1" id="value1" />
				</div>
			</div>
			<div>
				<input type="button" class="btn" id="add1" value="+" />
			</div>
		</div>
		<div style="clear: both;"></div>
		<div class="span12" style="visibility: visible" id="addbtn1">
			<input type="button" class="btn" id="addtitle1" value="추가" /> <input
				class="btn" type="submit" value="등록" />
		</div>
		<div style="clear: both;"></div>
		<div id="field2" style="float: left; visibility: hidden;">
			<div>
				<h2>평가</h2>
				<div>
					<span>주제</span>
					<input type="text" name="title2" id="title2" />
				</div>
			</div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key2" id="key2" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value2" id="value2" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key2" id="key2" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value2" id="value2" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key2" id="key2" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value2" id="value2" />
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div class="span12" style="visibility: hidden" id="addbtn2">
		<input type="button" class="btn" id="addtitle2" value="추가" /> 
		<input type="button" class="btn" id="deltitle1" value="삭제" /> 
		<input class="btn" type="submit" value="등록" />
		</div>
		<div style="clear: both;"></div>
		<div id="field3" style="float: left; visibility: hidden;">
			<div>
				<h2>평가</h2>
				<div>
					<span>주제</span>
					<input type="text" name="title3" id="title3" />
				</div>
			</div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key3" id="key3" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value3" id="value3" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key3" id="key3" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value3" id="value3" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key3" id="key3" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value3" id="value3" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key3" id="key3" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value3" id="value3" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key3" id="key3" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value3" id="value3" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key3" id="key3" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value3" id="value3" />
				</div>
			</div>
			<div style="clear: both;"></div>
			<div>
				<div style="float: left">
					<span>항목</span>
					<input type="text" name="key3" id="key3" />
				</div>
				<div style="float: left">
					<span>값</span>
					<input type="text" name="value3" id="value3" />
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div class="span12" style="visibility: hidden" id="addbtn3">
			<input type="button" class="btn" id="deltitle2" value="삭제" />
			<input class="btn" type="submit" value="등록" />
		</div>
		<div id="form_add"></div>
	</form>
</body>
</html>