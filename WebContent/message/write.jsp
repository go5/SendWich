<%@page import="java.util.Vector"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>

<html>
<head>
<jsp:include page="/HeadInfo.jsp" />
</head>

<body>
	<div class="container">
	<div class="row">
		<form id="send_msg" name='send_msg' method='post'	 action="/SendWich/msg?cmd=MSGSEND" >
			<input type="hidden" id="friend_id" name="friend_id" value="" />
			<div>
				<h2>쪽지 보내기</h2>
			</div>
			<hr />
				<div>받는 사람</div>
					<input type="text" id="reciever_name" name="reciever_name" readonly="readonly" placeholder="이메일" />
				<div>
					<select id="friends" name="friends" onchange="fnfriends()" class="input-xxlarge">
						<option value="+">친구 목록</option>
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
			<br />
			<div>
				<div>메세지</div>
				<div>
					<textarea id="msg_text" name="msg_text" cols=50 rows=5 
						placeholder="보낼 메세지" style="resize:none;" class="input-xxlarge"></textarea>
				</div>
			</div>
			<input type="button" value="쪽지 보내기" onclick="fnchknull()" class="btn" />
		</form>
	</div>
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
		function fnchknull() {
			var fid = document.getElementById("reciever_name").value;
			if (fid == null || fid == "") {
				alert("친구가 선택되지 않았습니다. ");
			} else {
				document.getElementById("send_msg").submit();
			}
		}
		window.onload=function(){
			window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
			window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
			window.resizeTo(480,480); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
		}
	</script>

</body>
</html>
