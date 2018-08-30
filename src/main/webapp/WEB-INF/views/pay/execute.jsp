<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link href="/resources/css/pay.css" rel="stylesheet">
</head>
<body>

<c:if test="${status eq 'PAY_COMPLETE'}">
	<script>
		$(document).ready(function () {
			location.replace("/pay/success");
		});
	</script>
</c:if>


<c:if test="${status eq 'PAY_CANCEL'}">
	<script>
		$(document).ready(function () {
			location.replace("/pay/fail");
		});
	</script>
</c:if>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>