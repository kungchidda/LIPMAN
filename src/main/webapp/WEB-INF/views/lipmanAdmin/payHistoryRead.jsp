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
			<div class="historyList" id="${payVO.pno}">
				<span>${payVO.pno}</span>
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
		
	</div>
	
	<div class="history">
		<div class="historyList">
			<span>wno</span>
			<span>uid</span>
			<span>type</span>
			<span>companyName</span>
			<span>ceoName</span>
			<span>registedNo</span> 
			<span>taxType</span>
			<span>bankName</span>
			<span>accountNo</span>
			<span>accountHolder</span>
			<span>status</span>
			<span>regdate</span>
		</div>
		<hr>
		<form class="registerForm" method="post" action="/lipmanAdmin/withdrawModify">
			<div class="historyList" id="${withdrawVO.wno}">
				<input name="wno" value="${withdrawVO.wno}">
				<input name="uid" value="${withdrawVO.uid}">
				<input name="type" value="${withdrawVO.type}">
				<input name="companyName" value="${withdrawVO.companyName}">
				<input name="ceoName" value="${withdrawVO.ceoName}">
				<input name="registedNo" value="${withdrawVO.registedNo}"> 
				<input name="taxType" value="${withdrawVO.taxType}">
				<input name="bankName" value="${withdrawVO.bankName}">
				<input name="accountNo" value="${withdrawVO.accountNo}">
				<input name="accountHolder" value="${withdrawVO.accountHolder}">
				<input name="status" value="${withdrawVO.status}">
				
				
				<span>
					<fmt:formatDate value="${withdrawVO.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</span> 
				<c:forEach items="${withdrawFullName}" var="withdrawVO">
					<a href="/displayFile?fileName=${withdrawVO.withdrawFullName}" target="_blank">${withdrawVO.withdrawFullName}</a>
				</c:forEach>
				<button type="submit" class="submit">Submit</button>
			</div>
			<hr>
		</form>
		<form method="post" action="/lipmanAdmin/withdrawComplete">
			uid<input name="uid" value="${payVO.uid}" required>
			amount<input name="amount" required>
			productDesc <input name="productDesc" required>
<!-- 			complete <input name="complete" required> -->
			<button type="submit" class="submit">Submit</button>
		</form>
		
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
$(document).ready(function() {
	var point = '${payVO.point}';
	var amount = -point * 70
	$("input[name='amount']").val(amount);
});

</script>


</body>
</html>