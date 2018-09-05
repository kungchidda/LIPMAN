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

<!-- 	<form id="registerForm" role="form" method="get"> -->
		<select name="searchType" >
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>
				---</option>
			<option value="wno"
				<c:out value="${cri.searchType eq 'wno'?'selected':''}"/>>
				wno
			</option>
			<option value="uid"
				<c:out value="${cri.searchType eq 'uid'?'selected':''}"/>>
				uid
			</option>
				
			<option value="type"
				<c:out value="${cri.searchType eq 'type'?'selected':''}"/>>
				type
			</option>

			<option value="companyName"
				<c:out value="${cri.searchType eq 'companyName'?'selected':''}"/>>
				companyName
			</option>
			
			<option value="ceoName"
				<c:out value="${cri.searchType eq 'ceoName'?'selected':''}"/>>
				ceoName
			</option>
			
			<option value="registedNo"
				<c:out value="${cri.searchType eq 'registedNo'?'selected':''}"/>>
				registedNo
			</option>
			
			<option value="taxType"
				<c:out value="${cri.searchType eq 'taxType'?'selected':''}"/>>
				taxType
			</option>
			
			<option value="bankName"
				<c:out value="${cri.searchType eq 'bankName'?'selected':''}"/>>
				bankName
			</option>
			
			<option value="accountNo"
				<c:out value="${cri.searchType eq 'accountNo'?'selected':''}"/>>
				accountNo
			</option>
			
			<option value="accountHolder"
				<c:out value="${cri.searchType eq 'accountHolder'?'selected':''}"/>>
				accountHolder
			</option>
			
			<option value="status"
				<c:out value="${cri.searchType eq 'status'?'selected':''}"/>>
				status
			</option>
			<option value="regdate"
				<c:out value="${cri.searchType eq 'regdate'?'selected':''}"/>>
				regdate
			</option>
		</select>
		<input type="text" name='keyword' id="keyword" value='${cri.keyword}'>
		<button id='searchBtn'>Search</button>
<!-- 		</form> -->
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
		<c:forEach items="${withdrawHistory}" var="withdrawVO">
			<div class="historyList" id="${withdrawVO.wno}">
				<a href="/lipmanAdmin/withdrawHistoryReadWno?wno=${withdrawVO.wno}"><span>${withdrawVO.wno}</span></a>
				<span>${withdrawVO.uid}</span>
				<span>${withdrawVO.type}</span>
				<span>${withdrawVO.companyName}</span>
				<span>${withdrawVO.ceoName}</span>
				<span>${withdrawVO.registedNo}</span> 
				<span>${withdrawVO.taxType}</span>
				<span>${withdrawVO.bankName}</span>
				<span>${withdrawVO.accountNo}</span>
				<span>${withdrawVO.accountHolder}</span>
				<span>${withdrawVO.status}</span>
				<span>
					<fmt:formatDate value="${withdrawVO.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</span> 
			</div>
			<hr>
		</c:forEach>
		
	
	
	</div>
	<!-- Pagination -->
	<ul class="historyPageUl">
		<c:if test="${pageMaker.prev}">
			<li class="historyPageLi">
				<a href="withdrawHistoryList${pageMaker.makeSearch(pageMaker.startPage-1)}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
				</a>
			</li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li class="historyPageLi"
				<c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
				<a href="withdrawHistoryList${pageMaker.makeSearch(idx)}">${idx}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage >0}">
			<li class="historyPageLi">
				<a href="withdrawHistoryList${pageMaker.makeSearch(pageMaker.endPage + 1)}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					<span class="sr-only">Next</span>
				</a>
			</li>
		</c:if>
	</ul>
	<script>
	$(document).ready(function() {
		$('#searchBtn').on("click",function(event){
			event.preventDefault();
			console.log("$('#keyword').val() = " + $('#keyword').val());
			self.location = "withdrawHistoryList"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword=" + $('#keyword').val();
				
		});
	});
	</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>



</body>
</html>