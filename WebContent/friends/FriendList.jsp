<%@page import="dao.MemberDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="dto.MemberDTO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-2.1.1.js"></script>
<jsp:include page="/HeadInfo.jsp" />
</head>

<body>
	<jsp:include page="/Sub_Header.jsp" />
	<!-- 친구 목록 -->
	<div class="container">
		<div class="row">
			<div name="FrList" id="FrList">
				<form action="friends" method="post" id="fListItem" class="form">
					<fieldset>
						<legend>친구 목록</legend>
						<table class="table">
							<thead>
								<tr>
									<td>이름</td>
									<td>이메일</td>
								</tr>
							</thead>
							<c:forEach var="frdto" items="${friendsList}">
								<c:if test="${frdto.email != memberDTO.email}">
									<tr>
										<td>${frdto.name}</td>
										<td>${frdto.email}</td>
										<td><button 	onclick="subform(this.form, 'friends?cmd=DELETEFRIEND')"
												class="btn">삭제</button></td>
									</tr>
								</c:if>
								<input type="hidden" name="cmd" id="cmd" value="DELETEFRIEND" />
								<input type="hidden" name="femail" id="femail"
									value="${frdto.email}" />
							</c:forEach>
						</table>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<hr />

	<!-- 검색창 부분. -->
	<div class="container">
		<div class="row">
			<form method="post" action="friends?cmd=FIND" class='form-search'>
				<div class="input-append">
					<input type="text" name="frSearch" id="frSearch"
						placeholder="이메일 주소" class="search-query" /> <input type="button"
						value="이메일 검색" onclick="fnfrsearch(this.form)" class='btn' />
				</div>
			</form>

			<!-- 검색 결과창 -->
			<div class="FrResult">
				<c:if test="${!empty searchfriend.name}">
					<c:choose>
						<c:when test="${searchfriend.name == 'null'}">
					검색결과가 없습니다.
					</c:when>
						<c:when test="${searchfriend.email != memberDTO.email}">
							<!-- 본인 제외 -->
							<form method="post" action="friends?cmd=INVITEFRIEND">
								<table class="table">
									<thead>
										<tr>
											<td>이름</td>
											<td>이메일</td>
										</tr>
									</thead>
									<tr>
										<td>${searchfriend.name}</td>
										<td>${searchfriend.email}</td> 
										<td><button type="submit" class="btn">친구 신청</button></td>
									</tr>
								</table>
								<input type="hidden" name="femail" id="femail" value="${searchfriend.email}" />
							</form>
						</c:when>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>

	<!--  친구 신청 수락 대기 목록. -->
	<div class="container">
		<div class="row">
		<c:forEach var="frlist" items="${inviteList}">
			<form method="post">
				<table class="table">
					<thead>
						<tr>
							<td>이름</td>
							<td>이메일</td>
						</tr>
					</thead>
					<tr>
						<td>${frlist.name}</td>
						<td>${frlist.email}</td>
						<td><button onclick="subform(this.form, 'friends?cmd=RESFRIEND')" class="btn">친구 수락</button></td>
						<td><button onclick="subform(this.form, 'friends?cmd=DELETEFRIEND')" class="btn">삭제</button></td>
					</tr>
				</table>
				<input type="hidden" name="femail" id="femail"	value="${frlist.email}" />
			</form>
		</c:forEach>
	</div>
	</div>
	<script>
		function fnfrsearch(f) {//fSearch 폼(검색창)

			//검색창 조건 검사
			if (f.frSearch.value == null || f.frSearch.value == "") {
				alert("추가할 친구의 이메일을 적어주세요.");
			} else {
				f.submit();
			}
		}
		function subform(f, act) {
			f.action = act;
			f.submit();
		}
	</script>
</body>
</html>