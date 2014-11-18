<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dto.pq_boardDTO"%>
<%@page import="dto.pq_replyDTO"%>
<%@ page import="dto.MemberDTO"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/HeadInfo.jsp" />

<script>
	function fnIsNull() {

		var title = document.getElementById("title").value;
		var textarea = document.getElementById("textarea").value;
		var answer = document.getElementById("answer").value;
		var photo = document.getElementById("photo").value;

		if (title == "" || textarea == "" || answer == "" || photo == "") {
			alert("값이 비어있습니다.");
		} else {
			document.post.submit();
		}
	}
</script>
<style>
#hint {
	width: 100%;
}

,
#answer {
	width: 80%;
}

#where {
	font-size: xx-large;
	color: navy;
	font-style: italic;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		MemberDTO dto = (MemberDTO) session.getAttribute("memberDTO");
		int member_id = dto.getMember_id();
		String email = dto.getEmail();
		String member_name = dto.getName();
		session.setAttribute("member_id", member_id);
		session.setAttribute("member_name", member_name);
	%>
	로그인한 멤버 id는:
	<%=member_id%><br> 로그인 한 이메일는 :<%=email%>
	로그인한 이름은 :
	<%=member_name%>


	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="/Sub_Header.jsp" />
	<!---//End-header---->
	<!---start-content---->
	<div class="content">

		<div class="wrap">


			<div class="contact-info">
				<h1 id="where">어디게~?</h1>


				<form name=post method=post action="pq_board?cmd=writeProc"
					enctype="multipart/form-data">

					<div class="contact-form">
						<div class="contact-to">
						
							<input type="text" class="text" value="<%=member_name%>"
								readonly="readonly">
								
							<div class="clear"></div>
							
							<input type="text" class="text" value="<%=email%>"
								readonly="readonly">

							<div class="clear"></div>
							<input type="text" class="text" value="제목..." name="title"
								id="title" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = '제목...';}">

							<div class="clear"></div>
							<input type="file" class="text" value="사진추가..." name="photo"
								id="photo" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = '사진추가...';}">

						</div>
						<div class="clear"></div>

						<div class="contact-to" id="answer">
							<input type="text" value="답:" onfocus="this.value = '';"
								name="answer" id="answer"
								onblur="if (this.value == '') {this.value = '답';}" />
						</div>

						<div class="clear"></div>

						<div class="contact-to" id="hint">
							<input type="text" value="힌트:" onfocus="this.value = '';"
								name="textarea" id="textarea"
								onblur="if (this.value == '') {this.value = '힌트';}" />
						</div>
						<div class="clear"></div>
						<span><input type="button" value="등록" onclick="fnIsNull()"></span>
						<span><input type="button" value="취소" onclick="javascript:history.back()"></span>
						<div class="clear"></div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>

