<%@ page contentType="text/html; charset=utf-8"%>
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
					<c:forEach var="fr" items="${friendsList}">
						<div style="background-color: silver;">
							<div style="float: left;">${fr.name}</div>
							<div style="float: left;">( ${fr.email} )</div>
							<div>
								&nbsp;&nbsp;
								<button onclick="#">삭제</button>
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
				<div class="FrResult">
					<c:if test="${!empty friendDTO.name}">
					<form method="post" action="friends?cmd=INVITE">
						<div style="float: left;">${friendDTO.name}</div>
						<div style="float: left;">( ${friendDTO.email} )
						<input type="hidden" name="femail" id="femail" value="${friendDTO.email}"/>
						</div>
						<div>
							<button type="submit">친구 신청</button>
						</div>
					</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<script>
	function fnfrsearch(f){
		if(f.frSearch.value==null||f.frSearch.value==""){
		//alert(f);
			alert("친구의 이메일을 적어주세요.");
		}else{
			f.submit();			
		}
	}
	
	</script>
</body>
</html>