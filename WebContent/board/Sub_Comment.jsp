<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!---start-comments-section--->
<h2>댓글</h2>

<!-- 
		 댓글 목록 블럭. 당연히 로그인된 상태에서만 보여야함.
		 -->
<c:forEach var="listdto" items="${replyList}">
	<div class="row">
		<div class="span 10">${listdto.reply_date}
			: ${listdto.name } >> ${listdto.reply_text }

			<c:if test="${listdto.member_id eq memberDTO.member_id}">
				<form method="post" action="main" name="delreply${listdto.reply_id}" id="delreply${listdto.reply_id}">
					<a href="javascript:fnSubmit(${listdto.reply_id});"><img src="images/delete-icon.png"/></a>
					<input type="hidden" name="reply_id" value="${listdto.reply_id}" />
					<input type="hidden" name="cmd" value="DELREPLY" /> <input
						type="hidden" name="board_id" value="${boardDTO.board_id}" />
				</form>
			</c:if>
			</div>
		</div>
</c:forEach>


<!---//End-comments-section--->


<!-- comment 입력 -->
<div class="span 8">
	<form action="main" method="post" name="reply">
		<input type="hidden" name="cmd" value="POSTREPLY" /> <input
			type="hidden" name="board_id" value="${boardDTO.board_id}" />
		<div>
			<textarea class="span8" rows="1" name="reply_text" id="reply_text"
				placeholder="댓글"></textarea>
		</div>
		<div class="span 4">
			<input type="button" onclick="chkreply(this.form)" value="댓글 달기">
		</div>
	</form>
</div>



<script>
	function chkreply(f) {
		var txt = document.getElementById("reply_text").value;
		if (txt.length > 0) {
			f.submit();
		} else {
			alert("댓글 내용이 비어있습니다.");
		}
	}
	
	function fnSubmit(f){
		var name = "delreply"+f
		//alert(name);
		var form = document.getElementById(name);
		form.submit();
	}
</script>

