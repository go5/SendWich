<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>

<%@ include file="friendlist.jsp"%>
<html>
<head>
<meta charset="euc-kr" />
<title>�޼��� ������</title>
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
				<h2>���� ������</h2>
			</div>
			<hr />
			<hr />

			<div>
				<div>�޴� ���(�̸���)</div>
				<div>
					<input type="text" id="reciever_name" name="reciever_name" readonly="readonly">
				</div>
				<div>
					<select id="friends" name="friends" onchange="fnfriends()">
						<option value="">ģ�� ���</option>
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
							}//for��
							}//while ��
						%>
					</select>
				</div>
			</div>
			<br />
			<div>
				<div>�޼���</div>
				<div>
					<textarea id="msg_text" name="msg_text" cols=50 rows=5 placeholder="���� �޼���"></textarea>
				</div>
			</div>
			<input type="submit" value="���� ������" />
		</form>
	</div>
</body>
</html>
