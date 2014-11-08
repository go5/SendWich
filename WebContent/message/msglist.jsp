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
		<!-- �Ӹ��� �κ�.  -->
		<div style="width: 90%;">
			<h1>${memberDTO.name}����MSG board�Դϴ�.</h1>
		</div>

		<div style="width: 90%;" name="msgList" id="msgList">
			<table style="border: 1px solid #559955; padding: 1px;">
				<!-- ���� �κ�.  -->
				<tr>
					<td bgcolor=#CCCCCC width="5%"><input type="checkbox"
						id="msg_chk_all" name="msg_chk_all" onchange="fnchkall(this.form)" /></td>
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
					Vector msgList = (Vector) session.getAttribute("msgList");

					//���� �� �Խ������� ���.
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
				<input type="button" id="msgdel" name="msgdel" value="�����׸� ����"
					onclick="fndelmsg(this.form)" />
			</div>
			<div align="right">
				<input type="button" value="ģ������ �޼��� ������" onclick="fnWrite()" />
			</div>
		</div>
	</form>

	<script>
		//�޼��� �ۼ�
		function fnWrite() {
			window.open("/SendWich/msg?cmd=MSGWRITE", "",
					"width=520, height=320");
		}
		//��ü üũ���� �Լ�
		function fnchkall(f) {
			//alert("1");
			if (f.msg_chk_all.checked) {
				//alert("2")
				alert(f.getElementsByTagName("input").length);
				alert(f.msg_chk.length);
				//��ü üũ. ��üüũ,��ư2�� �� ��ǲ������ Ȯ��.
				//for (var i = 0; i < f.getElementsByTagName("input").length ; i++) {
				for (var i = 0; i < f.msg_chk.length ; i++) {
						alert(i);
						alert(f.msg_chk[i].value);
					f.msg_chk[i].checked = true;
				}
			} else {
				//alert("3")
				//��ü üũ ����
				//for (var i = 0; i < f.getElementsByTagName("input").length; i++) {
				for (var i = 0; i < f.msg_chk.length ; i++) {
					f.msg_chk[i].checked = false;
				}
			}

		}
		//üũ �޼��� ����
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
