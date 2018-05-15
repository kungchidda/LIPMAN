<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>MANIFUL</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- Custom styles for this template -->
<link href="/resources/bootstrap/4-col-portfolio/css/4-col-portfolio.css" rel="stylesheet">
<!-- <link href="/resources/css/layout.css" rel="stylesheet"> -->
<link href="/resources/css/layout2.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<!-- <script type="text/javascript" src="/resources/js/layout.js"></script> -->
<!-- <script type="text/javascript" src="/resources/js/layout2.js"></script> -->

<!-- AdminLTE App -->
<script src="/resources/bootstrap/AdminLTE-2.4.3/dist/js/adminlte.min.js"></script>
</head>
<body>

	<div class="container">

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
			<button class="btn btn-lg btn-primary" id='searchBtn'>Search</button>
			<button class="btn btn-lg btn-danger" id='newBtn'>New Board</button>
		</div>

		<div class="row">
			<section class="image-grid">
			<c:forEach items="${list}" var="boardVO">
					<!-- <div class="image__cell is-collapsed" > -->
					<div class="image__cell" id="expand-jump-${boardVO.bno}"><!-- second -->
						<div class="card h-100">
								<div class="image--basic">
									<!-- <a href="#;return false;"> -->
									<a href="#expand-jump-${boardVO.bno}">
										<img class="card-img-top basic__img" src="/displayFile?fileName=${boardVO.fullName}">
									</a>
									<a href="#close-jump-${boardVO.bno}" class="expand-close"></a>
								</div>
							
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
						<div class="image--expand">
						    <img class="image--large" src="/displayFile?fileName=${boardVO.fullName}" />
						</div>
					</div>
			</c:forEach>
			</section>
		</div>
	</div>
	<!-- /.container -->

	<%@ include file="/WEB-INF/views/include/footer.html"%>
	
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
			
			
			//무한 스크롤 기능 일시 정지 
			//현재 페이지 받아옴
			var i = ${pageMaker.cri.page};
			
			//스크롤 이벤트 발생
			$(window).scroll(function(){
				var easeEffect = 'easeInQuint';
			
				var diff = $(document).height() - $(window).height() ;
				console.log($(window).scrollTop() + "==" + diff );
				//현재 스크롤의 top 좌표가 == (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
				if ($(window).scrollTop() == diff ) {
					//현재 페이지 보다 ++
					i++;
					
					var url = 'listScroll?page=' + i;
					
					console.log("page = " + i);
					$.ajax({
						type : 'GET',
						url : url,
						dataType : 'html',
						success:function(html){
							$(".image-grid").append(html);
						}
					});
				}
			/*
				//무한스크롤 적용을 위한 주석처리 무조건 1페이지로 이동
				//무한스크롤 업스크롤 기능 삭제
				//현재 스크롤의 top 좌표가  <= 0 되는 순간
	            if ($(window).scrollTop() == 0 ){
					i--;
					var url = 'listScroll?page=' + i;
					
					console.log("page = " + i);
					$.ajax({
						type : 'GET',
						url : url,
						dataType : 'html',
						success:function(html){
							$(".row").prepend(html);
						}
					});
	            }
 			*/

			});
			
		});
	</script>
	


</body>
</html>