<%@page import="java.util.Vector"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>

<html>
<head>
<meta charset="euc-kr" />
<title>�޼��� ������</title>
</head>

<body>

	<div style="border: 1px solid; width: 500px;">
		<form id="send_msg" name='send_msg' method='post'
			action="/SendWich/msg?cmd=MSGSEND">
			<input type="hidden" id="friend_id" name="friend_id" value="" />
			<div>
				<h2>���� ������</h2>
			</div>
			<hr />
			<hr />

			<div>
				<div>�޴� ���(�̸���)</div>
				<div>
					<input type="text" id="reciever_name" name="reciever_name"
						readonly="readonly">
				</div>
				<div>
					<select id="friends" name="friends" onchange="fnfriends()">
						<option value="">ģ�� ���</option>
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
							}//for��
						%>
					</select>
				</div>
			</div>
			<br />
			<div>
				<div>�޼���</div>
				<div>
					<textarea id="msg_text" name="msg_text" cols=50 rows=5
						placeholder="���� �޼���"></textarea>
				</div>
			</div>
			<input type="submit" value="���� ������" />
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
