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
<!-- <script src="/resources/js/subtitlePrint.js"></script> -->
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
		<div class="cards search-genre-keyword hide">
			<span class="genre-search-1 hide">SF</span> <span
				class="genre-search-2 hide">Mystery</span> <span
				class="genre-search-3 hide">Pure Love</span> <span
				class="genre-search-4 hide">Romance</span> <span
				class="genre-search-5 hide">Comic</span> <span
				class="genre-search-6 hide">Reasoning</span> <span
				class="genre-search-7 hide">School Life</span> <span
				class="genre-search-8 hide">Sports</span> <span
				class="genre-search-9 hide">Fantasy</span> <span
				class="genre-search-10 hide">Medicine</span> <span
				class="genre-search-11 hide">Food</span> <span
				class="genre-search-12 hide">Education</span> <span
				class="genre-search-13 hide">Battle</span> <span
				class="genre-search-14 hide">Mecanic</span> <span
				class="genre-search-15 hide">Daily</span> <span
				class="genre-search-16 hide">Age</span> <span
				class="genre-search-17 hide">Graphic Novel</span> <span
				class="genre-search-18 hide">Thriller</span> <span
				class="genre-search-19 hide">Drama</span> <span
				class="genre-search-20 hide">Adventure</span>
			<c:if test="${not empty cri.keyword}">
				<span class="search-keyword"></span>
			</c:if>
		</div>
		<div class="no-search-result">
			<c:if test="${empty list}">
				<span>검색 결과가 없습니다.</span>
			</c:if>
		</div>
		<ul class="og-grid cards">
			<c:forEach items="${list}" var="boardVO">
				<li class="expander" id="${boardVO.tno}"><img class="thumbnail"
					src="/displayFile?fileName=${boardVO.boardFullName}">

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
									<img class="do-not-close"
										src="/displayFile?fileName=${boardVO.titleFullName}"
										style="display: inline;">
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
											${boardVO.subtitle}</div>
										<div class="comic-list-time cursor do-not-close"></div>
									</a>
								</div>
							</div>
							<ul id="pagination"
								class="pagination do-not-close comic-list-pagi"></ul>
						</div>
					</div></li>

			</c:forEach>
		</ul>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

	<c:if test="${not empty login}">
		<script id="subtitle-template" type="text/x-handlebars-template">
		{{#each .}}
			<div class="subtitleLi do-not-close">
				<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}' class='do-not-close'>
					
					<div class="comic-list do-not-close"><img src="/displayFile?fileName={{boardFullName}}" class='do-not-close'></div>
					<div class="comic-list-read do-not-close">{{ifCond uread}}</div>
					<div class="comic-list-text cursor do-not-close">{{subtitle}} </div>
					<div class="comic-list-time do-not-close"> {{prettifyDate regdate}} </div>
					{{#if point}}<div class="comic-list-point class='do-not-close'"><img class="comic-list-point-img do-not-close" src="/resources/images/point.jpg">{{point}}</div>{{/if}}
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
				<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}' class='do-not-close'>
					
					<div class="comic-list do-not-close"><img src="/displayFile?fileName={{boardFullName}}" class='do-not-close'></div>
					<div class="comic-list-read do-not-close"></div>
					<div class="comic-list-text cursor do-not-close">{{subtitle}} </div>
					<div class="comic-list-time class='do-not-close'"> {{prettifyDate regdate}} </div>
					{{#if point}}<div class="comic-list-point class='do-not-close'"><img class="comic-list-point-img do-not-close" src="/resources/images/point.jpg">{{point}}</div>{{/if}}
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

	<script>
	
	
	/**************************************************************************************/
	/**************************************************************************************/
	/*                               	subtitle print 	                                  */
	/**************************************************************************************/
	/**************************************************************************************/
	
	var formObj = $("form[role='form']");

	function getSubtitle(tno, page){
		console.log("click getSubtitle start getPage");
		getPage("/sboard/"+tno+"/"+page+"/6", tno);
		return 1;
	};	
	
//	Handlebars.registerHelper("prettifyDate", function(timeValue){
//			var dateObj = new Date(timeValue);
//			var year = dateObj.getFullYear();
//			var month = dateObj.getMonth() + 1;
//			var date = dateObj.getDate();
//			return year+"/"+month+"/"+date;
//	});
	
	Handlebars.registerHelper('ifCond', function(uread) {
		  if(uread == 0) {
		    return '●';
		  }
		  if(uread == 1) {
			    return '◑';
		  }
		  if(uread == 2) {
			    return '';
		  }
		  return '';
	});
	
	
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		
		var regdate = new Date(timeValue);
		var regdateTime = new Date(timeValue).getTime();
		regdateTime = regdateTime / 1000;
//		console.log("regdateTime = " + regdateTime);
		
		var current = new Date();
		var currentTime = new Date().getTime();
		currentTime = currentTime / 1000;
//		console.log("currentTime = " + currentTime);
		
		var diff = currentTime - regdateTime;
//		console.log("diff = " + diff);
		var year = regdate.getFullYear();
		var month = regdate.getMonth() + 1;
		var date = regdate.getDate();
		
		var prettifyDate;
		    if(diff < 60) {
		    	prettifyDate = "방금";
		    } else if(diff >= 60 && diff < 3600) {
		    	prettifyDate = Math.floor(diff/60) + "분 전";
		    } else if(diff >= 3600 && diff < 86400) {
		    	prettifyDate = Math.floor(diff/3600) + "시간 전";
		    } else if(diff >= 86400 && diff < 2419200) {
		    	prettifyDate = Math.floor(diff/86400) + "일 전";
		    } else {
		    	prettifyDate = year+"-"+month+"-"+date;
		    }
		     
		    return prettifyDate;
		});

	
	/* $(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		subtitlePage = $(this).attr("href");
		getPage("/subtitles/"+bno+"/5/"+subtitlePage);
		
	}); */
	
	var printData = function (subtitleArr, target, templateObject){
		console.log("start printData");
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(subtitleArr);
		
		console.log("subtitleArr = " + subtitleArr);
		target.append(html);
		
		$('a').on('click',function(event) {
//			event.preventDefault();
			var uid = '${login.uid}';
			console.log("로그인 아이디 = " + uid);
			var point = $(this).find(".comic-list-point").text();
			var target = $(this).attr("href");
			  // Request 객체 생성
			 var request = new Request(target);
			 // test 라는 파라메터 값을 얻기
			  var bno = request.getParameter("bno");

			console.log("목적지 = " + bno);
			if(point > 0){
				location.href="/pay/confirm?target="+bno;
/* 				var r = confirm("유료 컨텐츠입니다. "+ point +"포인트를 사용하여 보시겠습니까?");
				if (r == false) {
				    event.preventDefault();
				}else{
					if('${login.uid}' == ""){
						alert("로그인이 필요합니다");
//							location.href="/user/login";
//	 					$(window).scrollTop();
						$("body").animate({ // top값에 맞게 스크롤이 움직인다.
							"scrollTop": 0
						},300);
						$("#myPageBar").slideDown(300);
						event.preventDefault();
					}
				} */
			}
			
			
		});
		
		function Request(target){
			var requestParam ="";
			//getParameter 펑션
			this.getParameter = function(param){
				//현재 주소를 decoding
				var url = unescape(target); 
				//파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다.
				var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
				
				for(var i = 0 ; i < paramArr.length ; i++){
					var temp = paramArr[i].split("="); //파라미터 변수명을 담음
					if(temp[0].toUpperCase() == param.toUpperCase()){
						// 변수명과 일치할 경우 데이터 삽입
						requestParam = paramArr[i].split("=")[1]; 
						break;
					}
				}
				return requestParam;
			}
		}
	}
		
		
	function getPage(pageInfo, tno){
		console.log("start getPage pageInfo = " + "["+pageInfo+"]");
		
		$(".pagination").remove();
		$(".subtitleLi").remove();
		
		$.ajax({
			  type: 'GET',
			  url: pageInfo,
			  //data: data,
			  dataType : "JSON",
			  async:false,
			  success : function(data){
				  printData(data.list, $(".toggle-page"),$('#subtitle-template'));
				  printPaging(data.pageMaker, $(".pagination"), tno);
				}
			});
		
		
//		$.getJSON(pageInfo,function(data){
////			printData(data.list, $(".og-expander-inner"), $('#template'));
//			printData(data.list, $(".toggle-page"),$('#subtitle-template'));
//			printPaging(data.pageMaker, $(".pagination"), tno);
//// 			$(".subtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
//			
//		});
		
	}
	
	var printPaging = function(pageMaker, target, tno){
		console.log("start printPaging");
		console.log("pageMaker = " + pageMaker);
		console.log("target = " + target);
		console.log("tno = " + tno);
		var str = "";
		if(pageMaker.endPage != '1'){
			if(pageMaker.prev){
				str += //"<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>"
				'<li class="page-link do-not-close comic-list-prev" onclick="getSubtitle('+tno+','+(pageMaker.startPage-1)+');"> << </li>';
			}
			
			for(var i=pageMaker.startPage, len= pageMaker.endPage; i <= len; i++){
				var strClass = pageMaker.cri.page == i?'class=active':'';
				str += '<li class="page-item do-not-close comic-list-pagi" '+strClass+'><div class="comic-list do-not-close" onclick="getSubtitle('+tno+','+i+');">'+i+'</div></li>';
			}
			
			if(pageMaker.next){
				str += //"<li><div href='/sboard/" + tno + "/" + (pageMaker.endPage+1)+"'> >> </div></li>";
					'<li class="page-link do-not-close comic-list-next" onclick="getSubtitle('+tno+','+ (pageMaker.endPage+1) +');"> >> </li>';
			}
		}
		target.html(str);
	}
	
	

	
	</script>


</body>

</html>
