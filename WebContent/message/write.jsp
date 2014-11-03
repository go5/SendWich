<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>

<%@ include file="friendlist.jsp"%>
<html>
<head>
<meta charset="euc-kr" />
<title>메세지 보내기</title>
<script>
	function fnfriends(){
		var finfo = document.getElementById("friends").value;
		//alert(finfo);
		farray = finfo.split('+');
		//alert(farray[0]);
		document.getElementById("reciever_name").value =farray[1] ;
		document.getElementById("fid").value = farray[0];
	}
</script>
</head>

<body>
	
	<div style="border: 1px solid; width: 500px;">
		<form id="send_msg" name='send_msg' method='post' action="send_msg.jsp">
	<input type="hidden" id="fid" name="fid" value=""/>
			<div>
				<h2>쪽지 보내기</h2>
			</div>
			<hr />
			<hr />

			<div>
				<div>받는 사람(이메일)</div>
				<div>
					<input type="text" id="reciever_name" name="reciever_name" readonly="readonly">
				</div>
				<div>
					<select id="friends" name="friends" onchange="fnfriends()">
						<option value="">친구 목록</option>
						<%
						rs = stmt.executeQuery(member_sql);
							while (rs.next()) {
								for (i = 0; i < fnames.length; i++) {
									fids[i] = rs.getString("member_id");
									fnames[i] = rs.getString("name");
									femails[i] = rs.getString("email");
						%>

						<option value="<%=fids[i]%>+<%=femails[i]%>">
							<%=fnames[i]%>&nbsp;(<%=femails[i]%>)
						</option>
						<%
							}//for문
							}//while 문
						%>
					</select>
				</div>
			</div>
			<br />
			<div>
				<div>메세지</div>
				<div>
					<textarea id="msg_text" name="msg_text" cols=50 rows=5 placeholder="보낼 메세지"></textarea>
				</div>
			</div>
			<input type="submit" value="쪽지 보내기" />
		</form>
	</div>
</body>
</html>
