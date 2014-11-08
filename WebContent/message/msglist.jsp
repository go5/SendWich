<%@page import="dto.MessageDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="dto.MemberDTO"%>
<%@page import="dao.msgDAO"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>
<!DOCTYPE html >
<html>
<head>
<title>MSG board</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		msgDAO msgDAO = new msgDAO();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
	%>
	<form name="body" style="width: 650px">
		<!-- 머릿말 부분.  -->
		<div style="width: 90%;">
			<h1>${memberDTO.name}님의MSG board입니다.</h1>
		</div>

		<div style="width: 90%;" name="msgList" id="msgList">
			<table style="border: 1px solid #559955; padding: 1px;">
				<!-- 제목 부분.  -->
				<tr>
					<td bgcolor=#CCCCCC width="5%"><input type="checkbox"
						id="msg_chk_all" name="msg_chk_all" onchange="fnchkall(this.form)" /></td>
					<td bgcolor=#CCCCCC width="45%">
						<p align=center>메세지</p>
					</td>
					<td width="20%" bgcolor=#CCCCCC>
						<p align=center>보낸 친구</p>
					</td>
					<td width="30%" bgcolor=#CCCCCC>
						<p align=center>보낸 날짜</p>
					</td>
				</tr>
				<!-- 예제 부분. 일단 주석으로 남겨둠.
				<tr>
					<td width="5%"><input type="checkbox" id="msg_chk"
						name="msg_chk" /></td>
					<td width="45%"><span>내용 test</span></td>


					<td width="20%">
						<p align=center>보낸 이 테스트</p>
					</td>

					<td width="30%">
						<p align=center>날짜</p>
					</td>

				</tr>
  -->
				<%
					//받은 쪽지 정보 조회
					Vector msgList = (Vector) session.getAttribute("msgList");

					//받은 글 게시판으로 출력.
					for (int i = 0; i < msgList.size(); i++) {
						MessageDTO dto = (MessageDTO) msgList.get(i);
						MemberDTO friends = msgDAO.MemberInfo(dto.getSender_id());
				%>
				<tr>
					<td width="5%"><input type="checkbox" id="msg_chk"
						name="msg_chk" value="<%=dto.getMsg_id()%>" /></td>
					<td width="45%"><div><%=dto.getTextarea()%></div></td>


					<td width="20%">
						<p align=center><%=friends.getName()%></p>
					</td>

					<td width="30%">
						<p align=center><%=dto.getSend_date()%></p>
					</td>

				</tr>
				<%
					}
				%>
			</table>
		</div>
		<br />
		<div style="width: 90%;">
			<div style="float: left;">
				<input type="button" id="msgdel" name="msgdel" value="선택항목 삭제"
					onclick="fndelmsg(this.form)" />
			</div>
			<div align="right">
				<input type="button" value="친구에게 메세지 보내기" onclick="fnWrite()" />
			</div>
		</div>
	</form>

	<script>
		//메세지 작성
		function fnWrite() {
			window.open("/SendWich/msg?cmd=MSGWRITE", "",
					"width=520, height=320");
		}
		//전체 체크해제 함수
		function fnchkall(f) {
			//alert("1");
			if (f.msg_chk_all.checked) {
				//alert("2")
				alert(f.getElementsByTagName("input").length);
				alert(f.msg_chk.length);
				//전체 체크. 전체체크,버튼2개 뺀 인풋갯수로 확인.
				//for (var i = 0; i < f.getElementsByTagName("input").length ; i++) {
				for (var i = 0; i < f.msg_chk.length ; i++) {
						alert(i);
						alert(f.msg_chk[i].value);
					f.msg_chk[i].checked = true;
				}
			} else {
				//alert("3")
				//전체 체크 해제
				//for (var i = 0; i < f.getElementsByTagName("input").length; i++) {
				for (var i = 0; i < f.msg_chk.length ; i++) {
					f.msg_chk[i].checked = false;
				}
			}

		}
		//체크 메세지 삭제
		function fndelmsg(f) {
			var ids = new Array();
			var j = 0;
//			for (var i = 0; i < f.getElementsByTagName("input").length ; i++) {
				for (var i = 0; i < f.msg_chk.length ; i++) {
				//alert(i);
				alert(f.msg_chk[i].value);
				if (f.msg_chk[i].checked) {
					//alert(document.body.msg_chk[i].value);
					ids[j] = f.msg_chk[i].value;
					j += 1;
				}
			}
			ids.sort();
			var ids2 = ids.join(", ");
			url = "/SendWich/msg?cmd=MSGDELETE&msg_ids=" + ids2;
			//alert(url);
			//window.open("msgdel.jsp?msg_id="+ids2);
			location.href = url;

		}
	</script>

</body>
</html>
