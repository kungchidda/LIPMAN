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
<select name="searchType" >
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>
				---</option>

			<option value="pno"
				<c:out value="${cri.searchType eq 'pno'?'selected':''}"/>>
				pno
			</option>
				
			<option value="uid"
				<c:out value="${cri.searchType eq 'uid'?'selected':''}"/>>
				uid
			</option>

			<option value="orderNo"
				<c:out value="${cri.searchType eq 'orderNo'?'selected':''}"/>>
				orderNo
			</option>
			
			<option value="productDesc"
				<c:out value="${cri.searchType eq 'productDesc'?'selected':''}"/>>
				productDesc
			</option>
			
			<option value="bno"
				<c:out value="${cri.searchType eq 'bno'?'selected':''}"/>>
				bno
			</option>
			
			<option value="amount"
				<c:out value="${cri.searchType eq 'amount'?'selected':''}"/>>
				amount
			</option>
			
			<option value="point"
				<c:out value="${cri.searchType eq 'point'?'selected':''}"/>>
				point
			</option>
			
			<option value="payToken"
				<c:out value="${cri.searchType eq 'payToken'?'selected':''}"/>>
				payToken
			</option>
			
			<option value="complete"
				<c:out value="${cri.searchType eq 'complete'?'selected':''}"/>>
				complete
			</option>
			
			<option value="regdate"
				<c:out value="${cri.searchType eq 'regdate'?'selected':''}"/>>
				regdate
			</option>
		</select>
		<input type="text" name='keyword' id="keyword" value='${cri.keyword}'>
		<button id='searchBtn'>Search</button>

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
	<!-- Pagination -->
	<ul class="historyPageUl">
		<c:if test="${pageMaker.prev}">
			<li class="historyPageLi">
				<a href="payHistoryList${pageMaker.makeSearch(pageMaker.startPage-1)}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
				</a>
			</li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li class="historyPageLi"
				<c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
				<a href="payHistoryList${pageMaker.makeSearch(idx)}">${idx}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage >0}">
			<li class="historyPageLi">
				<a href="payHistoryList${pageMaker.makeSearch(pageMaker.endPage + 1)}" aria-label="Next">
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
			self.location = "payHistoryList"
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