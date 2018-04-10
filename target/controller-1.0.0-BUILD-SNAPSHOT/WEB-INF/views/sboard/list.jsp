<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script type="text/javascript"
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">

		<%@ include file="/WEB-INF/views/include/header.html"%>
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<div class='box-body'>
			<select name="searchType">

				<option value="n"
					<c:out value="${cri.searchType == null?'selected':''}"/>>
					---</option>

				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
					Title</option>


				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
					Content</option>

				<option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
					Writer</option>

				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
					Title OR Content</option>

				<option value="cw"
					<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
					Content OR Writer</option>

				<option value="tcw"
					<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
					Title OR Content OR Writer</option>

			</select> <input type="text" name='keyword' id="keywordInput"
				value='${cri.keyword}'>
			<button id='searchBtn'>Search</button>
			<button id='newBtn'>New Board</button>
		</div>

		<div class="row">
			<c:forEach items="${list}" var="boardVO">
				<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title} <strong>[ ${boardVO.replycnt} ]</strong></a>
							</h4>
							<div><p class="card-text">${boardVO.writer} <span class="badge bg-red">${boardVO.viewcnt}</span></p></div>
							<div>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" />
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	<!-- /.container -->

	<!-- Pagination -->
	<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.prev}">
			<li class="page-item"><a class="page-link"
				href="list${pageMaker.makeSearch(pageMaker.startPage-1)}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
			</a></li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li class="page-item"
				<c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
				<a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage >0}">
			<li class="page-item"><a class="page-link"
				href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
			</a></li>
		</c:if>
	</ul>




	<%@ include file="/WEB-INF/views/include/footer.html"%>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}

		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-primary").on("click", function() {
				self.location = "/board/register";
			});
		});
	</script>
	
	<script>
		$(document).ready(function(){
			$('#searchBtn').on(
					"click",
					function(event){
						
						self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
					});
			$('#newBtn').on("click", function(evt){
				self.location = "register";
			});
		});
	</script>


</body>
</html>