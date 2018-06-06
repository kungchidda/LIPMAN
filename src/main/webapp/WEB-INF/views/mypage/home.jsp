<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/default.css" />
<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/component.css" />
<script src="/resources/ThumbnailGridExpandingPreview/js/modernizr.custom.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/banner/banner.css" />

 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>


<!-- Container element -->
	<div class="container">
		<section class="parallax">
			<select name="searchType" >

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
			<!-- <button class="btn btn-lg btn-primary" id='searchBtn'>Search</button>
			<button class="btn btn-lg btn-danger" id='newBtn'>New Board</button> -->
			
			<!-- <h1 style="text-align: center;color:white;">크레에이티브 작품</h1> -->
			<!-- <h1 style="text-align: center;color:white;">전시 및 탐색</h1> -->
			
		</section>
<!-- 				<ul id="og-grid" class="og-grid rf-content--projects"> -->
				<ul id="og-grid" class="og-grid">
						<li>
							<div style="background-color:gray;vertical-align:middle;width:200px;height:300px;">
								<a href="/mypage/register">
									<!-- <img class="thumbnail" src="/displayFile?fileName=/mypageSample.jpg"> -->
									<h3>Upload your webtoon!</h3>
								</a>
							</div>
						</li>
						
					<c:forEach items="${list}" var="MyPageVO">
						<li>
								<a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${MyPageVO.bno}" data-largesrc="/displayFile?fileName=${MyPageVO.fullName}" data-title="${MyPageVO.title}"
								 onclick="getSubtitle(${MyPageVO.bno});" data-description="${MyPageVO.uname}">
								<img class="thumbnail" src="/displayFile?fileName=${MyPageVO.fullName}" />
								<h3>${MyPageVO.title}</h3>
								<h3>${MyPageVO.uname}</h3>
								<div>${MyPageVO.subtitle}</div>
								<div><i class="fa fa-thumbs-up" style="color:red;"></i> : ${MyPageVO.likecnt} / <i class="fa fa-thumbs-down"></i> : ${MyPageVO.unlikecnt}</div>
								<div>subscribe</div>
								<div>share</div>
								</a>
						</li>
						
					</c:forEach>
				</ul>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="/resources/ThumbnailGridExpandingPreview/js/mypage_grid.js"></script>
		<script>
			$(function() {
				Grid.init();
			});
		</script>
	<!-- /.container -->

	<%-- <%@ include file="/WEB-INF/views/include/footer.html"%> --%>
	
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
			{{#if @first}}
				<a href='/sboard/register?tno={{tno}}'>Upload your new webtoon</a>
			{{/if}}
			{{#if @null}}
				<a href='/sboard/register?tno={{tno}}'>Upload your new webtoon</a>
			{{/if}}
			<div style="height:50px;" class="subtitleLi" data-sno={{sno}}>
					<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}'>{{subtitle}}</a>
			</div>
		{{/each}}
	</script>
	
	<script> //subtitle print
	var formObj = $("form[role='form']");

	function getSubtitle(bno){
		console.log("click getSubtitle start getPage");
		console.log("bno = " + bno);
		getPage("/subtitles/"+bno+"/5/1");
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
		getPage("/subtitles/"+bno+"/5/"+subtitlePage);
		
	});
	
	
		
	var printData = function (subtitleArr, target, templateObject){
		console.log("start printData");
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(subtitleArr);
		target.after(html);
	}
		
		
	function getPage(pageInfo){
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