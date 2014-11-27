<%@page import="dao.MemberDAO"%>
<%@page import="dao.msgDAO"%>
<%@page import="dto.MessageDTO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>
<!DOCTYPE html >
<html>
<head>
<jsp:include page="/HeadInfo.jsp" />
</head>
<body>
	<jsp:include page="/Sub_Header.jsp" />

	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		msgDAO msgDAO = new msgDAO();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
	%>
	<div class="container">
		<div class="row">
			<div class="span12" >
			<form name="body" >
				<!-- 머릿말 부분.  -->
				<div style="width: 90%;" name="msgList" id="msgList" class="span12">
					<h2>${memberDTO.name}님의MSGboard입니다.</h2>
					<table class="table">
						<!-- 제목 부분.  -->
						<tr>
							<td><input type="checkbox" id="msg_chk_all"
								name="msg_chk_all" value=" " onchange="fnchkall(this.form)" /></td>
							<td>메세지</td>
							<td>보낸 친구</td>
							<td>보낸 날짜</td>
						</tr>

						<!--  메시지 목록.  -->
						<%
							//받은 쪽지 정보 조회
							Vector msgList = (Vector) session.getAttribute("msgList");

							//받은 글 게시판으로 출력.
							for (int i = 0; i < msgList.size(); i++) {
								MessageDTO dto = (MessageDTO) msgList.get(i);
								MemberDTO friends = memberDAO.getInfo(dto.getSender_id());
						%>
						<tr>
							<td><input type="checkbox" id="msg_chk" name="msg_chk" value="<%=dto.getMsg_id()%>" /></td>
							<td><div><%=dto.getTextarea()%></div></td>
							<td><%=friends.getName()%></td>
							<td><%=dto.getSend_date()%></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
				<div class="span12">
					<div style="float: left;">
						<input type="button" id="msgdel" name="msgdel" value="선택항목 삭제"
							onclick="fndelmsg(this.form)" class="btn" />
					</div>
					<div style="float: left">
						<input type="button" value="친구에게 메세지 보내기" onclick="fnWrite()"
							class="btn" />
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
	<script>
		//메세지 작성
		function fnWrite() {
			window.open("/SendWich/msg?cmd=MSGWRITE", "",
					"width=570, height=370");
		}
		//전체 체크해제 함수
		function fnchkall(f) {
			if (f.msg_chk_all.checked) {
				//태그네임으로 체크걸면 항목1개 일때 못찾음,
				//체크박스 이름으로는 아예 못찾음
				//엘레먼츠로 해야 인식함?!
				//Dom 시르다. ㅠㅠ
				for (var i = 0; i < f.getElementsByTagName("input").length; i++) {
					//alert(i);
					f.elements[i].checked = true;
				}
			} else {
				//전체 체크 해제
				for (var i = 0; i < f.getElementsByTagName("input").length; i++) {
					f.elements[i].checked = false;
				}
			}

		}
		//체크 메세지 삭제
		function fndelmsg(f) {
			var ids = new Array();
			var j = 0;
			//alert(f.elements.length);
			for (var i = 1; i < f.getElementsByTagName("input").length - 2; i++) {
				if (f.elements[i].checked) {
					//alert(f.elements[i].value);
					ids[j] = f.elements[i].value;
					j += 1;
				}
			}
			ids.sort();
			var ids2 = ids.join(", ").trim();
			url = "/SendWich/msg?cmd=MSGDELETE&msg_ids=" + ids2;
			//alert(url);
			location.href = url;

		}
	</script>

</body>
</html>
