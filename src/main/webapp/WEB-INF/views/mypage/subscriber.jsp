<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/profile.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/mypage.css" rel="stylesheet">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> -->

<!-- <link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/default.css" />
<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/component.css" />
<script src="/resources/ThumbnailGridExpandingPreview/js/modernizr.custom.js"></script> -->

<!-- <link rel="stylesheet" type="text/css" href="/resources/css/banner/banner.css" /> -->
<!--  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
</head>
<body>


	<!--icon-->
	<div class="mypage-profile-icon">
		<div class="mypage-profile-icon-home">
			<a href="/mypage/home" > <img
				src="/resources/png/comic.png" id="profile-img-home">
			</a>
		</div>
		<div class="mypage-profile-icon-subscribe">
			<a href="/mypage/subscribed"> <img
				src="/resources/png/subscribe.png" id="profile-img-subscribed">
			</a>
		</div>
		<div class="mypage-profile-icon-subscribed">
			<a href="/mypage/subscriber" class="active"> <img
				src="/resources/png/subscribed.png" id="profile-img-subscriber">
			</a>
		</div>
		<div class="mypage-profile-icon-setting">
			<a href="/mypage/setting"> <img src="/resources/png/setting.png"
				id="profile-img-setting">
			</a>
		</div>
	</div>

<!-- 				<ul id="og-grid" class="og-grid rf-content--projects"> -->
				<ul class="mypage-subscriber">
					<c:forEach items="${list}" var="subscribeVO">
						<li>
						 		<div class="mypage-subscriber-img">
									<a href="#"><img src="/displayFile?fileName=${subscribeVO.profileFullName}"></a>
						 		</div>
						 		<div class="mypage-subscriber-name">
						 			<a href="#">${subscribeVO.uname}</a>
						 		</div>
						</li>
						
					</c:forEach>
				</ul>
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="/resources/ThumbnailGridExpandingPreview/js/mypage_grid.js"></script>
		<script>
			$(function() {
				Grid.init();
			});
		</script> -->
	<!-- /.container -->

	<%-- <%@ include file="/WEB-INF/views/include/footer.html"%> --%>
	
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
			<div style="height:50px;" class="subtitleLi" data-sno={{sno}}>
					<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}'>{{subtitle}}</a>
			</div>
		{{/each}}
	</script>
	
	<script> //subtitle print
	var formObj = $("form[role='form']");

	function getSubtitle(tno){
		console.log("click getSubtitle start getPage");
		console.log("tno = " + tno);
		getPage("/sboard/"+tno+"/1", tno);
		
	};	
	
	
	
	Handlebars.registerHelper("prettifyDate", function(timeValue){
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year+"/"+month+"/"+date;
	});
	

	
	
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		subtitlePage = $(this).attr("href");
		getPage("/sboard/"+tno+"/"+subtitlePage);
		
	});
	
	
		
	var printData = function (subtitleArr, target, templateObject){
		console.log("start printData");
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(subtitleArr);
		target.after(html);
	}
		
		
	function getPage(pageInfo, tno){
		console.log("start getPage");
		
		
		//$(".pagination").remove();
		$(".subtitleLi").remove();
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".subtitlesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			console.log("start subtitlecntSmall");
			$(".subtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
		});
	}
	
	var printPaging = function(pageMaker, target){
		console.log("start printPaging");
		var str = "";
		if(pageMaker.endPage != '1'){
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