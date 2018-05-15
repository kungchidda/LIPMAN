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
<!-- <link href="/resources/css/layout.css" rel="stylesheet"> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/default.css" />
<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/component.css" />
<script src="/resources/ThumbnailGridExpandingPreview/js/modernizr.custom.js"></script>
		
</head>
<body>

	<div class="">
			
			<div class="main">
				<ul id="og-grid" class="og-grid">
					<c:forEach items="${list}" var="boardVO">
						<li>
							<a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}" data-largesrc="/displayFile?fileName=${boardVO.fullName}" data-title="Azuki bean" data-description="Swiss chard pumpkin bunya nuts maize plantain aubergine napa cabbage soko coriander sweet pepper water spinach winter purslane shallot tigernut lentil beetroot.">
								<img src="/displayFile?fileName=${boardVO.fullName}" />
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="/resources/ThumbnailGridExpandingPreview/js/grid.js"></script>
		<script>
			$(function() {
				Grid.init();
			});
		</script>
	<!-- /.container -->

	<%-- <%@ include file="/WEB-INF/views/include/footer.html"%> --%>
	
	
	<script>
								function getSubtitle(bno){
									console.log("click getSubtitle start getPage");
									getPage("/subtitles/"+bno+"/1");
								};	
								
								
								//$(document).ready(function() {
									var formObj = $("form[role='form']");
						
									//console.log(formObj);
									
									
									$(".pagination").on("click", "li a", function(event){
										event.preventDefault();
										subtitlePage = $(this).attr("href");
										getPage("/subtitles/"+bno+"/"+subtitlePage);
										
									});
									
								//});
								
								
								Handlebars.registerHelper("prettifyDate", function(timeValue){
										var dateObj = new Date(timeValue);
										var year = dateObj.getFullYear();
										var month = dateObj.getMonth() + 1;
										var date = dateObj.getDate();
										return year+"/"+month+"/"+date;
									});
									
									var printData = function (subtitleArr, target, templateObject){
										var template = Handlebars.compile(templateObject.html());
										
										var html = template(subtitleArr);
										$(".subtitleLi").remove();
										target.after(html);
									}
									//var bno = ${boardVO.bno};
									//var replyPage = 1;
									
									function getPage(pageInfo){
										console.log("start getPage");
										console.log("pageInfo = " +pageInfo);

										$.getJSON(pageInfo,function(data){
											printData(data.list, $(".subtitlesDiv"), $('#template'));
											printPaging(data.pageMaker, $(".pagination"));
											
											$(".subtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
											
										});
										
									}
									var printPaging = function(pageMaker, target){
										var str = "";
										
										if(pageMaker.prev){
											str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
										}
										
										for(var i=pageMaker.startPage, len= pageMaker.endPage; i <= len; i++){
											var strClass = pageMaker.cri.page == i?'class=active':'';
											str += "<li class='page-item' "+strClass+"><a class='page-link' href='"+i+"'>"+i+"</a></li>";
										}
										
										if(pageMaker.next){
											str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
										}
										
										target.html(str);
									}
								
					
								</script>
	
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