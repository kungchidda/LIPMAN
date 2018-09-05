<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link href="/resources/css/mypage.css" rel="stylesheet">
<script src="/resources/js/subscribe-check.js"></script>
<link href="/resources/css/userList.css" rel="stylesheet">
<link href="/resources/css/admin.css" rel="stylesheet">
</head>
<body>
	<div class="history">
		<div class="historyList">
			<span>pno</span>
			<span>uid</span>
			<span>orderNo</span>
			<span>productDesc</span>
			<span>bno</span>
			<span>amount</span> 
			<span>point</span>
			<span>payToken</span>
			<span>complete</span>
			<span>regdate</span>
		</div>
		<%-- <div class="historyList">
			<span class="point">${totalPoint}</span>
		</div> --%>
		<hr>
		<c:forEach items="${payHistory}" var="payVO">
			<div class="historyList" id="${payVO.pno}">
				<a href="/lipmanAdmin/payHistoryRead?pno=${payVO.pno}"><span>${payVO.pno}</span></a>
				<span>${payVO.uid}</span>
				<span>${payVO.orderNo}</span>
				<span>${payVO.productDesc}</span>
				<span>${payVO.bno}</span>
				<span>${payVO.amount}</span>
				<span>${payVO.point}</span>
				<span>${payVO.payToken}</span>
				<span>${payVO.complete}</span>
				
				<span>
					<fmt:formatDate value="${payVO.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</span> 
			</div>
			<hr>
		</c:forEach>
		
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>



</body>
</html>