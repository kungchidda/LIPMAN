<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<meta charset="UTF-8">

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> -->
<script src="/resources/js/handlebars.js"></script>
<!--                     <link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/default.css" /> -->
<!--                     <link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/component.css" /> -->
<!--                     <script src="/resources/ThumbnailGridExpandingPreview/js/modernizr.custom.js"></script> -->
<script src="/resources/js/subtitlePrint.js"></script>
<script src="/resources/js/expander.js"></script>

<!--                     <link rel="stylesheet" type="text/css" href="/resources/css/banner/banner.css" /> -->
<!-- <style>
                     .hide{
                        display:none;
                     }
                    </style> -->

</head>

<body>
	<!-- 				<div class="dim-div"></div> -->

	<!-- Container element -->
	<div class="container">
		<!-- 20180702 before -->
		<%-- <select name="searchType" >

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

			</select>
			<input type="text" name='keyword' id="keywordInput" value='${cri.keyword}'>
			<input type="checkbox" name='genre' class="genreInput" value='1'>SF
			<input type="checkbox" name='genre' class="genreInput" value='2'>Mystery
			<input type="checkbox" name='genre' class="genreInput" value='3'>PureLove
			<input type="checkbox" name='genre' class="genreInput" value='4'>Romance
			
			<button class="btn btn-lg btn-primary" id='searchBtn'>Search</button> --%>
		<!-- 20180702 before -->

		<!-- <button class="btn btn-lg btn-danger" id='newBtn'>New Board</button> -->

		<!-- <h1 style="text-align: center;color:white;">크레에이티브 작품</h1> -->
		<!-- <h1 style="text-align: center;color:white;">전시 및 탐색</h1> -->

		<!-- </section> -->
		<!-- 				<ul id="og-grid" class="og-grid rf-content--projects"> -->
		
		<!--banner-->
		<div class="banner">
			<p class="banner-text">
				Creativity is contagious,<br> pass it on!
			</p>
		</div>
		<ul class="og-grid cards">
			<c:forEach items="${list}" var="boardVO">
				<li class="expander" id="${boardVO.tno}">
					<img class="thumbnail" src="/displayFile?fileName=${boardVO.boardFullName}">

					<div class="title">${boardVO.title}</div>

					<div class="subtitle">${boardVO.subtitle}</div>

					<div class="thumbnail-thumb">
						<img src="/resources/png/pencil.png"><span>${boardVO.likecnt}</span>
						<img src="/resources/png/eraser.png"><span>${boardVO.dislikecnt}</span>
					</div>
					<div class="line">
						<img src="/resources/svg/line.svg">
					</div>

					<div class="thumbnail-writer">
<!-- 						<img src="/resources/png/account.png">  -->
						<img src="/displayFile?fileName=${boardVO.profileFullName}">
						<span>${boardVO.uname}</span>
					</div> <!-- 					</a> -->


					<div class="og-expander hide do-not-close">

						<div class="og-expander-inner do-not-close">
							<div class="expander-title-inner">
								<div class="og-fullimg do-not-close">
									<img class="do-not-close" src="/displayFile?fileName=${boardVO.titleFullName}" style="display: inline;">
								</div>
								<div class="comic-list-genre do-not-close">
									<div>${boardVO.gname}</div>
								</div>
								<div class="comic-list-title do-not-close">
									<div>${boardVO.title}</div>
								</div>
								<!-- <div class="comic-list-setting">
									<img src="/resources/png/setting.png" onclick="#">
								</div> -->
							</div>
								<div class="toggle-page">
									<div class="subtitleLi do-not-close">
										<a href="#">
											<div class="comic-list-img do-not-close">
												<img src="/displayFile?fileName=${boardVO.boardFullName}">
											</div>
											<div class="comic-list-text cursor do-not-close">
												${boardVO.subtitle}
											</div>
											<div class="comic-list-time cursor do-not-close">
											</div>
										</a>
									</div>
								</div>
							<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
							</div>
						</div>
				</li>

			</c:forEach>
		</ul>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

	<c:if test="${not empty login}">
	<script id="subtitle-template" type="text/x-handlebars-template">
		{{#each .}}
			<div class="subtitleLi do-not-close">
				<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}'>
					<div class="comic-list-read do-not-close">{{ifCond uread}}</div>
					
					<div class="comic-list do-not-close"><img src="/displayFile?fileName={{boardFullName}}"></div>
					<div class="comic-list-text cursor do-not-close">{{subtitle}} </div>
					<div class="comic-list-time"> {{prettifyDate regdate}} </div>
				</a>
			</div>
		{{/each}}
		<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
	</script>
	</c:if>
	<c:if test="${empty login}">
	<script id="subtitle-template" type="text/x-handlebars-template">
		{{#each .}}
			<div class="subtitleLi do-not-close">
				<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}'>
					<div class="comic-list-read do-not-close"></div>
					
					<div class="comic-list do-not-close"><img src="/displayFile?fileName={{boardFullName}}"></div>
					<div class="comic-list-text cursor do-not-close">{{subtitle}} </div>
					<div class="comic-list-time"> {{prettifyDate regdate}} </div>
				</a>
			</div>
		{{/each}}
		<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
	</script>
	</c:if>




	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>

	<script>
		$(document).ready(function() {
			/**************************************************************************************/
			/**************************************************************************************/
			/*                               	페이지 로딩 후  	                                  */
			/**************************************************************************************/
			/**************************************************************************************/

			// 			var bno = ${boardVO.bno}
			/* getPage("/subtitles/"+bno+"/5/1"); */

			var formObj = $("form[role='form']");

			console.log(formObj);

			//register button
			/* $(".btn-primary").on("click", function() {
				self.location = "/board/register";
			}); */

			//search button
			/* $('#searchBtn').on("click",function(event){
			//  $("#searchForm").submit(function(event){
			  	event.preventDefault();
			  	var checkArr = [];     // 배열 초기화
			      $("input[name='genre']:checked").each(function(i) {
			          checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
			      });
			  	
			  	console.log("checkArr = " + checkArr);
			  	
				self.location = "list"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val()//;
					+ "&genre=" + checkArr;
					
					//$(this).get(0).submit();
			  }); */

			$('#newBtn').on("click", function(evt) {
				self.location = "register";
			});

			//무한 스크롤 기능 일시 정지 
			//현재 페이지 받아옴
			var i = ${pageMaker.cri.page};

			//스크롤 이벤트 발생
			$(window).scroll(function() {
				var easeEffect = 'easeInQuint';

				var diff = $(document).height() - $(window).height();
				//console.log($(window).scrollTop() + "==" + diff );
				//현재 스크롤의 top 좌표가 == (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
				if ($(window).scrollTop() == diff) {
					//현재 페이지 보다 ++
					i++;

					var url = 'listScroll?page=' + i;

					console.log("page = " + i);
					$.ajax({
						type : 'GET',
						url : url,
						dataType : 'html',
						success : function(html) {
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
