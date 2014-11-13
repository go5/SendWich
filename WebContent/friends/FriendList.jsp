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
					<h2>친구 목록</h2>
					<table border="1">
					<tr><td>이름</td><td>이메일 주소<td><td>삭제</td><tr>
					<tr><td>친구이름</td><td>이메일 주소<td><td><a href="#">삭제</a></td><tr>
					</table>
				</div>

<hr/>
<!-- 친구검색. 이후에 탭으로 변경하는 방안. -->
<!--  일단 회원 중의 이메일을 검색. 나중에는 db에 없는 이메일에 초대 메일 발송기능. -->
				<div class="searchbar">
					<form action="friends?cmd=FIND&email=${param.frSearch}">
						<!-- 검색창 부분. -->
						<input type="text" name="frSearch" id="frSearch" placeholder="친구 이메일 주소"/><input
							type="submit" value="이메일 검색" />
					</form>
				</div>
				<div class="FrResult">
				<c:if test="${!empty friendDTO.name}">
			 검색된	친구 이름, 이메일 띄울 곳.
				</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>