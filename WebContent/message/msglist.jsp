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
		<div style="width: 90%;">
			<!-- �Ӹ��� �κ�.  -->
			<h1>${memberDTO.name}����MSGboard�Դϴ�.</h1>
		</div>

		<div style="width: 90%;" name="msgList" id="msgList">
			<table style="border: 1px solid #559955; padding: 1px;">
				<!-- ���� �κ�.  -->
				<tr>
					<td bgcolor=#CCCCCC width="5%"><input type="checkbox"
						id="msg_chk_all" name="msg_chk_all" value=" "
						onchange="fnchkall(this.form)" /></td>
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

				<!--  �޽��� ���.  -->
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
			if (f.msg_chk_all.checked) {
				//�±׳������� üũ�ɸ� �׸�1�� �϶� ��ã��,
				//üũ�ڽ� �̸����δ� �ƿ� ��ã��
				//���������� �ؾ� �ν���?!
				//Dom �ø���. �Ф�
				for (var i = 0; i < f.getElementsByTagName("input").length; i++) {
					//alert(i);
					f.elements[i].checked = true;
				}
			} else {
				//��ü üũ ����
				for (var i = 0; i < f.getElementsByTagName("input").length; i++) {
					f.elements[i].checked = false;
				}
			}

		}
		//üũ �޼��� ����
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
