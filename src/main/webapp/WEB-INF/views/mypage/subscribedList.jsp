<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>LIPMAN</title>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage//profile.jsp"%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> -->
<script src="/resources/js/handlebars.js"></script>
<link href="/resources/css/mypage.css" rel="stylesheet">
<script src="/resources/js/subtitlePrint.js"></script>
<script src="/resources/js/expander.js"></script>
</head>
<body>



	<%@ include file="/WEB-INF/views/mypage/userIcon.jsp"%>
    

	<c:if test="${userVO.subscriber_p == 1 || login.uid == cri.uid}">
		<ul class="og-grid cards">
			<c:forEach items="${subscribedList}" var="MyPageVO">
				<li class="expander" id="${MyPageVO.tno}">
					<img class="thumbnail" src="/displayFile?fileName=${MyPageVO.boardFullName}" />
					<div class="title">${MyPageVO.title}</div>
					
					<div class="subtitle">${MyPageVO.subtitle}</div>
					
					<div class="thumbnail-thumb">
						<img src="/resources/png/pencil.png"><span>${MyPageVO.likecnt}</span>
						<img src="/resources/png/eraser.png"><span>${MyPageVO.dislikecnt}</span>
					</div>
					<div class="line">
						<img src="/resources/svg/line.svg">
					</div>
					
					<div class="thumbnail-writer">
						<img src="/displayFile?fileName=${MyPageVO.profileFullName}">
						<span>${MyPageVO.uname}</span>
					</div>
					
					<div class="og-expander hide do-not-close">
							<div class="og-expander-inner do-not-close">
								<div class="expander-title-inner">
									<div class="og-fullimg do-not-close">
										<img class="do-not-close" src="/displayFile?fileName=${MyPageVO.titleFullName}" style="display: inline;">
									</div>
									<div class="comic-list-genre do-not-close">
										<div>${MyPageVO.gname}</div>
									</div>
									<div class="comic-list-title do-not-close">
										<div>${MyPageVO.title}</div>
									</div>
								</div>
									<div class="toggle-page">
										<div class="subtitleLi do-not-close">
											<a href="#">
												<div class="comic-list-img do-not-close">
													<img src="/displayFile?fileName=${MyPageVO.boardFullName}">
												</div>
												<div class="comic-list-text cursor do-not-close">
													${MyPageVO.subtitle}</div>
											</a>
											<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
										</div>
									</div>
							</div>
						</div>
					
				</li>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${userVO.subscriber_p != 1 && login.uid != cri.uid}">
    	<%@ include file="/WEB-INF/views/mypage/private.jsp"%>
	</c:if>
	
	<!-- /.container -->

	
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
		$(document).ready(function(){
			
			$('.mypage-profile-icon-subscribe').addClass('active');
			
// 			$('#profile-img-subscribed').click();
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
			
			/**************************************************************************************/
			/**************************************************************************************/
			/*                               subscribeBtn start                                   */
			/**************************************************************************************/
			/**************************************************************************************/
			
			$(".subscribeBtn").on("click",function(){
						if('${login.uid}' == ""){
							alert("로그인이 필요합니다");
							location.href="/user/login";
						}else{
						 	subscribeBtnClick('${cri.uid}', '${login.uid}');
						}
					});
					
					$(".unsubscribeBtn").on("click",function(){
						if('${login.uid}' == ""){
							alert("로그인이 필요합니다");
							location.href="/user/login";
						}else{
							unsubscribeBtnClick('${cri.uid}', '${login.uid}');
						}
					});
			
			
			//무한 스크롤 기능 일시 정지 
			//현재 페이지 받아옴
			var i = ${pageMaker.cri.page};
			
			//스크롤 이벤트 발생
			$(window).scroll(function(){
				var easeEffect = 'easeInQuint';
			
				var diff = $(document).height() - $(window).height() ;
				//console.log($(window).scrollTop() + "==" + diff );
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