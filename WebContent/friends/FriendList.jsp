<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/HeadInfo.jsp" />
</head>

<body>
	<jsp:include page="/Sub_Header.jsp" />
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<div name="FrList" id="FrList">
					<h2>ģ�� ���</h2>
					<table border="1">
					<tr><td>�̸�</td><td>�̸��� �ּ�<td><td>����</td><tr>
					<tr><td>ģ���̸�</td><td>�̸��� �ּ�<td><td><a href="#">����</a></td><tr>
					</table>
				</div>

<hr/>
<!-- ģ���˻�. ���Ŀ� ������ �����ϴ� ���. -->
<!--  �ϴ� ȸ�� ���� �̸����� �˻�. ���߿��� db�� ���� �̸��Ͽ� �ʴ� ���� �߼۱��. -->
				<div class="searchbar">
					<form action="friends?cmd=FIND&email=${param.frSearch}">
						<!-- �˻�â �κ�. -->
						<input type="text" name="frSearch" id="frSearch" placeholder="ģ�� �̸��� �ּ�"/><input
							type="submit" value="�̸��� �˻�" />
					</form>
				</div>
				<div class="FrResult">
				<c:if test="${!empty friendDTO.name}">
			 �˻���	ģ�� �̸�, �̸��� ��� ��.
				</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>