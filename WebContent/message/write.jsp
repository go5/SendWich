<%@page import="java.util.Vector"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>

<html>
<head>
<meta charset="utf-8" />
<title>메세지 보내기</title>
</head>

<body>

	<div style="border: 1px solid; width: 500px;">
		<form id="send_msg" name='send_msg' method='post'
			action="/SendWich/msg?cmd=MSGSEND">
			<input type="hidden" id="friend_id" name="friend_id" value="" />
			<div>
				<h2>쪽지 보내기</h2>
			</div>
			<hr />
			<hr />

			<div>
				<div>받는 사람(이메일)</div>
				<div>
					<input type="text" id="reciever_name" name="reciever_name"
						readonly="readonly" required="required">
				</div>
				<div>
					<select id="friends" name="friends" onchange="fnfriends()">
						<option value="">친구 목록</option>
						<%
							Vector v = (Vector) session.getAttribute("FriendsList");
							for (int i = 0; i < v.size(); i++) {
								MemberDTO MemberDTO = (MemberDTO) v.get(i);
						%>

						<option
							value="<%=MemberDTO.getMember_id()%>+<%=MemberDTO.getEmail()%>">
							<%=MemberDTO.getName()%>&nbsp;(<%=MemberDTO.getEmail()%>)
						</option>
						<%
							}//for문
						%>
					</select>
				</div>
			</div>
			<br />
			<div>
				<div>메세지</div>
				<div>
					<textarea id="msg_text" name="msg_text" cols=50 rows=5
						placeholder="보낼 메세지"></textarea>
				</div>
			</div>
			<input type="submit" value="쪽지 보내기" />
		</form>
	</div>

	<script>
		function fnfriends() {
			var finfo = document.getElementById("friends").value;
			//alert(finfo);
			farray = finfo.split('+');
			//alert(farray[0]);
			document.getElementById("reciever_name").value = farray[1];
			document.getElementById("friend_id").value = farray[0];
		}

	</script>

</body>
</html>
