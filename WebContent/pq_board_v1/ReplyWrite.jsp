<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function fnIsNull() {
	var reply_field= document.getElementById("reply_field").value;

	if(reply_field==""){
		alert("값이 비어있습니다.");
	}else{
		document.reply.submit();
	}
}
</script>

<%
MemberDTO dto = (MemberDTO)session.getAttribute("memberDTO");
String memberName = dto.getName();
int repmember_id = dto.getMember_id();
String memberEmail = dto.getEmail();

%>

	<div class="artical-commentbox">
							<h2>어딜까요~?</h2>
							<div class="table-form">
								<form name ="reply" action="pq_board_v1/AnswerProc.jsp" method="post">
									<!--  이름 및 이메일.
									<div>
										<label>Name<span>*</span></label>  <input type="text" id="repname"name="<%=memberName %>"readonly="readonly" placeholder="<%=memberName %>">
									</div>
									<div>
										<label>Email<span>*</span></label> <input type="text" id="repEmail"name="<%=memberEmail %>"readonly="readonly" placeholder="<%=memberEmail %>">
									</div>
									 -->
									<div>
										<label>답은!?<span>*</span></label>
										<input type="text" id="reply_field" name="reply_field">
									</div>
									<input type="button" value="확인" onclick="fnIsNull()"/>
								</form>
								

							</div>
							<div class="clear"></div>
						</div>

