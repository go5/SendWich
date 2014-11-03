<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>
<%@ include file="friendlist.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>MSG board</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
//메세지 작성
	function fnWrite() {
		window.open("write.jsp", "", "width=520, height=320");
	}
//전체 체크해제 함수
	function fnchkall() {
		//alert("1");
		if (document.body.msg_chk_all.checked) {
			//alert(document.body.msg_chk.length);
			//전체 체크
			for (i = 0; i < document.body.msg_chk.length; i++) {
				//alert(i);
				document.body.msg_chk[i].checked = true;

			}
		} else {
			//alert("3")
			//전체 체크 해제
			for (i = 0; i < document.body.msg_chk.length; i++) {
				document.body.msg_chk[i].checked = false;
			}
		}

	}
//체크 메세지 삭제
	function fndelmsg() {
		var ids = new Array();
				var j=0;
		for (i = 0; i < document.body.msg_chk.length; i++) {
			if (document.body.msg_chk[i].checked) {
				//alert(document.body.msg_chk[i].value);
				ids[j] = document.body.msg_chk[i].value;
				j+=1;
			}
		}
		ids.sort();
		var ids2 = ids.join(", ");
		url="msgdel.jsp?msg_id="+ids2;
		
		//alert(url);

	//window.open("msgdel.jsp?msg_id="+ids2);
	location.href = url;

	}
	
</script>
</head>
<body>

	<form name="body" style="width: 650px">
		<!-- 머릿말 부분.  -->
		<div style="width: 90%;">
			<h1><%=member_name%>님의 MSG board입니다.
			</h1>
		</div>
		
		<div style="width: 90%;">
			<table style="border: 1px solid #559955; padding: 1px;">
				<!-- 제목 부분.  -->
				<tr>
					<td bgcolor=#CCCCCC width="5%"><input type="checkbox"
						id="msg_chk_all" name="msg_chk_all" onchange="fnchkall()" /></td>
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
					String sql = "SELECT  a.msg_id, a.sender_id, a.textarea, a.reciever_id, a.send_date, b.name FROM message a INNER JOIN member b ON a.sender_id = b.member_id WHERE reciever_id="
							+ member_id + " ORDER BY a.send_date";
					rs = stmt.executeQuery(sql);

					//받은 글 게시판으로 출력.
					while (rs.next()) {
				%>

				<tr>
					<td width="5%"><input type="checkbox" id="msg_chk"
						name="msg_chk" value="<%=rs.getString("msg_id")%>" /> <input
						type="hidden" id="msg_id" name="msg_id"
						value="<%=rs.getString("msg_id")%>" /></td>
					<td width="45%"><div><%=rs.getString("a.textarea")%></div></td>


					<td width="20%">
						<p align=center><%=rs.getString("b.name")%></p>
					</td>

					<td width="30%">
						<p align=center><%=rs.getString("a.send_date")%></p>
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
					onclick="fndelmsg()" />
			</div>
			<div align="right">
				<input type="button" value="친구에게 메세지 보내기" onclick="fnWrite()" />
			</div>
		</div>
	</form>
</body>
</html>
