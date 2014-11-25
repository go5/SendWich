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
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<!-- 친구 목록 -->
				<div name="FrList" id="FrList">
					<h2>친구 목록</h2>
					<c:forEach var="frdto" items="${friendsList}">
						<c:if test="${frdto.email != memberDTO.email}">
							<div style="background-color: silver;">
								<form action="friends" method="post" id="fListItem">
									<input type="hidden" name="cmd" id="cmd" value="DELETEFRIEND">
									<input type="hidden" name="femail" id="femail"
										value="${frdto.email}">
									<div style="float: left;">${frdto.name}</div>
									<div style="float: left;">( ${frdto.email} )</div>
									<div>
										&nbsp;&nbsp;
										<button onclick="subform(this.form, 'friends?cmd=DELETEFRIEND')">삭제</button>
									</div>
								</form>
							</div>
						</c:if>
					</c:forEach>
				</div>

				<hr />

				<!-- 검색창 부분. -->
				<div class="searchbar">
					<form method="post" action="friends?cmd=FIND">
						<input type="text" name="frSearch" id="frSearch"
							placeholder="이메일 주소" /> <input type="button" value="이메일 검색"
							onclick="fnfrsearch(this.form)" />
					</form>
				</div>


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
									<div style="float: left;">${searchfriend.name}</div>
									<div style="float: left;">
										( ${searchfriend.email} ) <input type="hidden" name="femail"
											id="femail" value="${searchfriend.email}" />
									</div>
									<div>
										<button type="submit">친구 신청</button>
									</div>
								</form>
							</c:when>
						</c:choose>
					</c:if>
				</div>
				<hr />
				<!--  친구 신청 수락 대기 목록. -->
				<div>
					<c:forEach var="frlist" items="${inviteList}">
						<form method="post" >
							<div style="float: left;">${frlist.name}</div>
							<div style="float: left;">
								( ${frlist.email} ) <input type="hidden" name="femail"
									id="femail" value="${frlist.email}" />
							</div>
							<button onclick="subform(this.form, 'friends?cmd=RESFRIEND')">친구 수락</button>
							<button onclick="subform(this.form, 'friends?cmd=DELETEFRIEND')">삭제</button>
						</form>
					</c:forEach>
				</div>
			</div>
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