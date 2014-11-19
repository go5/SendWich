<%@ page contentType="text/html; charset=utf-8"%>

<%--구버전. 
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="HeadInfo.jsp"/>
</head>
<body>
	<!---start-header---->
	<jsp:include page="Sub_Header.jsp" />
	<!---//End-header--
	-->
	<jsp:include page="Content.jsp" />
</body>
</html>

 --%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/HeadInfo.jsp"/>
</head>
<body>
	<!--  header  -->
<jsp:include page="/Sub_Header.jsp"/>
<!--  end header  -->
	<!-- start content  -->
<jsp:include page="/Content.jsp"/>
	<!-- end content  -->

</body>
</html>
