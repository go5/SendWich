<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=euc-kr"%>
<%@ include file="friendlist.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>MSG board</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
//�޼��� �ۼ�
	function fnWrite() {
		window.open("write.jsp", "", "width=520, height=320");
	}
//��ü üũ���� �Լ�
	function fnchkall() {
		//alert("1");
		if (document.body.msg_chk_all.checked) {
			//alert(document.body.msg_chk.length);
			//��ü üũ
			for (i = 0; i < document.body.msg_chk.length; i++) {
				//alert(i);
				document.body.msg_chk[i].checked = true;

			}
		} else {
			//alert("3")
			//��ü üũ ����
			for (i = 0; i < document.body.msg_chk.length; i++) {
				document.body.msg_chk[i].checked = false;
			}
		}

	}
//üũ �޼��� ����
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
		<!-- �Ӹ��� �κ�.  -->
		<div style="width: 90%;">
			<h1><%=member_name%>���� MSG board�Դϴ�.
			</h1>
		</div>
		
		<div style="width: 90%;">
			<table style="border: 1px solid #559955; padding: 1px;">
				<!-- ���� �κ�.  -->
				<tr>
					<td bgcolor=#CCCCCC width="5%"><input type="checkbox"
						id="msg_chk_all" name="msg_chk_all" onchange="fnchkall()" /></td>
					<td bgcolor=#CCCCCC width="45%">
						<p align=center>�޼���</p>
					</td>
					<td width="20%" bgcolor=#CCCCCC>
						<p align=center>���� ģ��</p>
					</td>
					<td width="30%" bgcolor=#CCCCCC>
						<p align=center>���� ��¥</p>
					</td>
				</tr>
<!-- ���� �κ�. �ϴ� �ּ����� ���ܵ�.
				<tr>
					<td width="5%"><input type="checkbox" id="msg_chk"
						name="msg_chk" /></td>
					<td width="45%"><span>���� test</span></td>


					<td width="20%">
						<p align=center>���� �� �׽�Ʈ</p>
					</td>

					<td width="30%">
						<p align=center>��¥</p>
					</td>

				</tr>
  -->
				<%
					//���� ���� ���� ��ȸ
					String sql = "SELECT  a.msg_id, a.sender_id, a.textarea, a.reciever_id, a.send_date, b.name FROM message a INNER JOIN member b ON a.sender_id = b.member_id WHERE reciever_id="
							+ member_id + " ORDER BY a.send_date";
					rs = stmt.executeQuery(sql);

					//���� �� �Խ������� ���.
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
				<input type="button" id="msgdel" name="msgdel" value="�����׸� ����"
					onclick="fndelmsg()" />
			</div>
			<div align="right">
				<input type="button" value="ģ������ �޼��� ������" onclick="fnWrite()" />
			</div>
		</div>
	</form>
</body>
</html>
