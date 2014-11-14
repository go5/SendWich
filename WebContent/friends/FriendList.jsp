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
				<div name="FrList" id="FrList">
					<h2>친구 목록</h2>
					<c:forEach var="frdto" items="${friendsList}">
						<div style="background-color: silver;">
							<div style="float: left;">${frdto.name}</div>
							<div style="float: left;">( ${frdto.email} )</div>
							<div>
								&nbsp;&nbsp;
								<button onclick="">삭제</button>
							</div>
						</div>
					</c:forEach>
				</div>

				<hr />
				<!-- 친구검색. 이후에 탭으로 변경하는 방안. -->
				<!--  일단 회원 중의 이메일을 검색. 나중에는 db에 없는 이메일에 초대 메일 발송기능. -->
				<div class="searchbar">
					<form method="post" name="fSearch" id="fSearch" action="friends">
						<!-- 검색창 부분. -->
						<input type="hidden" name="cmd" id="cmd" value="FRIENDS" /> <input
							type="text" name="frSearch" id="frSearch" placeholder="이메일 주소" />
						<input type="button" value="이메일 검색"
							onclick="fnfrsearch(this.form)" />
					</form>
				</div>
				<!-- 검색 결과창 -->
				<!-- 기등록 친구 제외해야함.  아오!-->
				<div class="FrResult">
					<c:if test="${!empty friendDTO.name}">
						<c:if test="${friendDTO.name != memberDTO.name}">
							<!-- 본인 제외 -->

							<form method="post" action="friends?cmd=INVITE">
								<div style="float: left;">${friendDTO.name}</div>
								<div style="float: left;">
									( ${friendDTO.email} ) <input type="hidden" name="femail"
										id="femail" value="${friendDTO.email}" />
								</div>
								<div>
									<button type="submit">친구 신청</button>
								</div>
							</form>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<script>
		function fnfrsearch(f) {
			var femailList = new Array();
			$("#femail").each(function(i) {
				femailList[i] = $(this).value;
			});

			if (f.frSearch.value == null || f.frSearch.value == "") {
				alert("추가할 친구의 이메일을 적어주세요.");
			} else {
				for (var i = 0; i < femailList.length; i++) {
					if (f.frSearch.value == femailList[i]) {
						alert("이미 등록된 친구 입니다.");
					} else {
						f.submit();
					}
				}
			}
		}
	</script>
</body>
</html>