<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIPMAN</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=0"/>
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>LIPMAN</title>

    <!--    google web font link-->
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Quicksand|Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">

    <!--   style sheet-->
    <link href="/resources/css/header.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">

    <!-- <script src="/resources/js/dropdown-contents.js"></script> -->
    <script src="/resources/js/genre-check.js"></script>
    

    <!--expander style sheet-->
    <link rel="stylesheet" type="text/css" href="/resources/css/component.css" />

    <!--expander script-->

	<!--<script src="/resources/js/expander.js"></script> -->
	<script src="/resources/js/handlebars.js"></script>
	<link rel="shortcut icon" href="/resources/favicon.ico">
	<link rel="apple-touch-icon" sizes="120x120" href="/resources/apple-touch-icon-120x120.png?v=asdf">
<%-- <%@ include file="/WEB-INF/views/include/header.jsp"%> --%>
<link href="/resources/css/pay.css" rel="stylesheet">
</head>
<body>

<c:if test="${status eq 'PAY_COMPLETE'}">
	<script>
		$(document).ready(function () {
			location.replace("/pay/success?orderNo=${orderNo}");
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



<%-- <%@ include file="/WEB-INF/views/include/footer.jsp"%> --%>
</body>
</html>