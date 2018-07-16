<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/user/profile.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/resources/css/mypage.css" rel="stylesheet">

</head>

<body>

<%@ include file="/WEB-INF/views/mypage/user/userIcon.jsp"%>



	<section id="mypage-home">
		<div class="container">
			<ul class="og-grid cards">
				<c:forEach items="${homeList}" var="MyPageVO">
					<li class="expander" id="${MyPageVO.tno}">
						<form id="modifyForm-${MyPageVO.tno}" role="form" method="post">
							<input type="text" class="do-not-close hide" name="tno" value="${MyPageVO.tno}" readonly>
							<img class="thumbnail" src="/displayFile?fileName=${MyPageVO.titleFullName}">

							<div class="mypage-home-title">${MyPageVO.title}</div>


							<div class="line">
								<img src="/resources/svg/line.svg">
							</div>
							<div class="mypage-thumbnail-thumb">
								<img src="/resources/png/pencil.png"><span>${MyPageVO.titlelikecnt}</span>
								<img src="/resources/png/eraser.png"><span>${MyPageVO.titledislikecnt}</span>
							</div>
							<div class="og-expander hide do-not-close" style="height: 550px;">
								<div class="og-expander-inner do-not-close">
									<div class="expander-title-inner">
										<div class="og-fullimg do-not-close">
											<img class="do-not-close" src="/displayFile?fileName=${MyPageVO.titleFullName}" style="display: inline;">
										</div>
										<div class="comic-list-genre do-not-close">
											${MyPageVO.gname}
										</div>
										<div class="comic-list-title do-not-close">
											<div class="comic-title">
												${MyPageVO.title}
											</div>
											<div class="comic-title-edit hide">
												<input type="text" name='title' class="do-not-close input-title" value="${MyPageVO.title}" placeholder="Comic Title">
											</div>
										</div>
										<%-- <div class="edit-title-button comic-list-setting do-not-close" genre="${MyPageVO.genre}">
											<img src="/resources/png/setting.png" class="edit-title-img do-not-close">
										</div> --%>
									</div>
									<div class="toggle-page">
										<div class="register"></div>
										<div class="subtitleLi do-not-close">
											<div class="og-fullimg do-not-close">
												<c:if test="${not empty MyPageVO.boardFullName}">
													<img src="/displayFile?fileName=${MyPageVO.boardFullName}">
												</c:if>
											</div>
											<div class="comic-list-text cursor do-not-close">
												${MyPageVO.subtitle}
											</div>
											<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
										</div>
									</div>
								</div>
							</div>
						</form>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>

	<div class="compony">
		<div class="compony-infor">Copyright © 2018 LIPMAN. 모든 권리 보유.</div>
	</div>



	<script>
		/**************************************************************************************/
		/**************************************************************************************/
		/*                               	expander	 	                                  */
		/**************************************************************************************/
		/**************************************************************************************/
		$(document).ready(function() {
			// expander 클래스를 클릭했을때
			$(".expander").click(function() {
				
				console.log("expander clicked");
				var submenu = $(this).find(".og-expander");
				var tno = $(this).attr('id');
				console.log("tno = " + tno);
				
				
				//$('.input-title').attr("readonly").focus();
				
		
				if (submenu.is(":visible")) { //보이면 올림
					if (!event.target.matches('.do-not-close')) {
						$(".background-blur").removeClass("background-blur"); //blur 효과 없애기
						submenu.slideUp(300);
						$(this).removeClass("margin-bottom");
					}
				} else {
					var getSubtitleResult = getSubtitle(tno, 1);
					if (getSubtitleResult) {
		
						if ($(".og-expander").is(":visible") || $(".og-title-register").is(":visible")) { //열린 곳이 있으면
		
							//$(".og-title-register").hide(); //다른 곳은 닫음
							$(".og-expander").hide(); //다른 곳은 닫음
							$(".background-blur").removeClass("background-blur"); //blur 효과 없애기
							$(".expander").not(this).addClass("background-blur"); //blur 효과 주기
							$(".margin-bottom").removeClass("margin-bottom"); //margin 삭제
							$(this).addClass("margin-bottom");
							
							$('.toggle-page').show();
							$('.title-genre-checkbox').addClass("hide");
							
							$('.comic-title').show();
							$('.comic-title-edit').addClass("hide");
							$('.input-title').attr("readonly");
							
							submenu.slideDown(300);
		
						} else { //열린 곳이 없으면
							$(".expander").not(this).addClass("background-blur"); //blur 효과 주기
							$(this).addClass("margin-bottom");
		
							$('.toggle-page').show();
							$('.title-genre-checkbox').addClass("hide");
							submenu.slideDown(300);
						}
					}
				}
			});
		
			$(".title-register").click(function() {
		
				console.log("title-register clicked");
				$('.title-genre-checkbox').removeClass("hide");

				
				var submenu = $(".og-title-register");
				if (submenu.is(":visible")) { //보이면 올림
					if (!event.target.matches('.do-not-close')) {
						$(".background-blur").removeClass("background-blur"); //blur 효과 없애기
						submenu.slideUp(300);
						$(this).removeClass("margin-bottom");
					}
				} else {
		
					if ($(".og-expander").is(":visible") || $(".og-title-register").is(":visible")) { //열린 곳이 있으면
		
						
						$('.toggle-page').hide();
						$('.title-genre-checkbox').removeClass("hide");
						
						$('.comic-title').show();
						$('.comic-title-edit').addClass("hide");
						$('.input-title').attr("readonly");
						
						$('.title-register-inner').show();
						$('.title-input').attr("readonly");
						for(var i=1; i<=20; i++){
	 						$(".genre-" + i).prop("checked", false);
	 						$(".genre-"+ i).next().removeClass("true");
	 						$(".genre-"+ i).next().addClass("false");
						}
						
						$(".og-expander").hide(); //다른 곳은 닫음
						$(".background-blur").removeClass("background-blur"); //blur 효과 없애기
						$(".title-register").not(this).addClass("background-blur"); //blur 효과 주기
						$(".margin-bottom").removeClass("margin-bottom"); //margin 삭제
						$(this).addClass("margin-bottom");
		
						//submenu.show();
						submenu.slideDown(300);
		
					} else { //열린 곳이 없으면
						
						
						$('.title-register-inner').show();
						$('.title-input').attr("readonly");
						for(var i=1; i<=20; i++){
	 						$(".genre-" + i).prop("checked", false);
	 						$(".genre-"+ i).next().removeClass("true");
	 						$(".genre-"+ i).next().addClass("false");
						}
		
						$(".title-register").not(this).addClass("background-blur"); //blur 효과 주기
						$(this).addClass("margin-bottom");
		
						$(".og-expander").hide(); //다른 곳은 닫음
						submenu.slideDown(300);
					}
				}
			});
		});
	</script>
	<!-- /.container -->

	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script id="template" type="text/x-handlebars-template">
		<div class="uploadedList do-not-close">
			<img src="{{imgsrc}}" alt="Attachment" class="do-not-close" style="display: inline;">
		<div class="mailbox-attachment-info do-not-close"style="width:200px;">
				<a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a>
				<small data-src="{{fullName}}" class="hide btn btn-default btn-xs pull-right delbtn">
				<i class="fa fa-fw fa-remove"></i>
				</small>
		</div>
		</div>
	</script>


	<script id="subtitle-template" type="text/x-handlebars-template">
		{{#each .}}
			<div class="subtitleLi">
					<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}' >
						<div class="comic-list do-not-close"><img src="/displayFile?fileName={{boardFullName}}"></div>
						<div class="comic-list-text cursor do-not-close">{{subtitle}}</div>
					</a>
			</div>
		{{/each}}
		<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
	</script>

	<script>
		//subtitle print
		// 	var formObj = $("form[role='form']");

		function getSubtitle(tno, page) {
			console.log("click getSubtitle start getPage");
			console.log("1. tno = " + tno);
			getPage("/sboard/" + tno + "/"+ page +"/5", tno);
			return 1;

		};

		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});

// 		$(".pagination").on("click", "li a", function(event) {
// 			event.preventDefault();
// 			subtitlePage = $(this).attr("href");
// 			getPage("/sboard/" + tno + "/" + subtitlePage + "/5");

// 		});

		var printData = function(subtitleArr, target, templateObject) {
			console.log("start printData");
			var template = Handlebars.compile(templateObject.html());

			var html = template(subtitleArr);
			// 		target.after(html);
			target.append(html);
		}

		function getPage(pageInfo, tno) {
			console.log("2. tno = " + tno);
			console.log("start getPage");

			$(".pagination").remove();
			$(".subtitleLi").remove();
			$.getJSON(pageInfo,function(data) {
// 				printData(data.list, $(".og-expander-inner"),$('#subtitle-template'));
				printData(data.list, $(".toggle-page"),$('#subtitle-template'));
				printPaging(data.pageMaker, $(".pagination"), tno);
				//var str = '<div class="subtitleLi do-not-close register"><a href="/sboard/register?tno=' + tno + '" class="comic-list do-not-close"><div class="comic-list do-not-close"><img src="/resources/png/sub-gray.png"></div><div class="comic-list-text cursor do-not-close">New Subtitle</div></a></div>';
				console.log("str = " + str);
				$('.register').html(str);

			});
		}

		var printPaging = function(pageMaker, target, tno) {
			console.log("start printPaging");
			console.log("3. tno = " + tno);
			var str = "";
			if (pageMaker.endPage != '1') {
				if (pageMaker.prev) {
					str += '<li class="page-link do-not-close comic-list-prev" onclick="getSubtitle('+tno+','+(pageMaker.startPage-1)+');"> << </li>';
				}

				for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
					var strClass = pageMaker.cri.page == i ? 'class=active': '';
					str += '<li class="page-item do-not-close comic-list-pagi" '+strClass+'><div class="page-link do-not-close" onclick="getSubtitle('+tno+','+i+');">'+i+'</div></li>';
				}

				if (pageMaker.next) {
					str += '<li class="page-link do-not-close comic-list-next" onclick="getSubtitle('+tno+','+ (pageMaker.endPage+1) +');"> >> </li>';
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

	</script>

	<script>
		$(document).ready(function() {
					
					$('.mypage-profile-icon-home').addClass('active');
			
					$('#searchBtn').on("click", function(event) {
						self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + $('#keywordInput').val();
					});

					$('#newBtn').on("click", function(evt) {
						self.location = "register";
					});

					$('.edit-title-img').click(function(e) {
						
						for(var i=1; i<=20; i++){
	 						$(".genre-" + i).prop("checked", false);
	 						$(".genre-"+ i).next().removeClass("true");
	 						$(".genre-"+ i).next().addClass("false");
						}
						
							$('.toggle-page').toggle();
							$('.title-genre-checkbox').toggleClass("hide");
							
							$('.comic-title').toggle();
							$('.comic-title-edit').toggle();
							$('.input-title').removeAttr("readonly").focus();

							var genreStr = $(this).parent().attr('genre');
							
							console.log("genreStr = " + genreStr);
							var genreArr = genreStr.split(',');
							var genreLen = genreArr.length;

							for (var i = 0; i < genreLen; i++) {
								console.log("genreArr[" + i + "] = "+ genreArr[i]);
								$(".genre-" + genreArr[i]).prop("checked", true);
								$(".genre-"+genreArr[i]).next().toggleClass("false");
								$(".genre-"+genreArr[i]).next().toggleClass("true");
							}
					});

					$('.cancel-title').click(
							function(e) {
								$('.comic-title').show();
								$('.comic-title-edit').hide();
								$('.toggle-page').show();
								$('.title-register-inner').hide();
								$('.title-input').attr("readonly");
								for(var i=0; i<20; i++){
									$(".genre-" + i).prop("checked", false);
									$(".genre-"+ i).next().removeClass("true");
									$(".genre-"+ i).next().addClass("false");
								}
							});


					$(".submit-title").on("click",function() {
						console.log("clicked submit-title");
						$(this).parent().parent().parent().parent().attr("action", "/title/modifyTitle");
						$(this).parent().parent().parent().parent().submit();
					});
					
					$(".delete-title").on("click", function() {
						console.log("clicked delete-title");
						$(this).parent().parent().parent().parent().attr("action", "/title/removeTitle");
						$(this).parent().parent().parent().parent().submit();
						
					});
					
					/**************************************************************************************/
					/**************************************************************************************/
					/*                               subscribeBtn start                                   */
					/**************************************************************************************/
					/**************************************************************************************/
					
					$(".subscribeBtn").on("click",function(){
						
						 subscribeBtnClick('${cri.uid}', '${login.uid}');
					});
					
					$(".unsubscribeBtn").on("click",function(){
						unsubscribeBtnClick('${cri.uid}', '${login.uid}');
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
		var template = Handlebars.compile($("#template").html());

		$("#fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$("#fileDrop").on("drop", function(event) {
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;

			for (i = 0; i < files.length; i++) {
				var file = files[i]
				uploadFile(file);
			}

		});

		$("#upload-input").on("change", function(event) {

			event.preventDefault();

			var files = event.target.files
			for (i = 0; i < files.length; i++) {
				var file = event.target.files[i]
				uploadFile(file);
			}
		});

		$("#registerForm").submit(
				function(event) {
					event.preventDefault();

					var that = $(this);

					var str = "";
					console.log("str = " + str);
					$(".uploadedList .delbtn").each(
							function(index) {
								console.log(index);
								str += "<input type='hidden' name='files["+ index + "]' value='"+ $(this).attr("data-src") + "'> ";
								console.log("str = " + str);
							});
					that.append(str);

					that.get(0).submit();

				});

		$(".uploadedList").on("click", "small", function(event) {

			var that = $(this);

			$.ajax({
				url : "deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("data-src")
				},
				dataType : "text",
				success : function(result) {
					if (result == 'deleted') {
						that.parents().parent("li").remove();
					}
				}
			});
		});

		function uploadFile(file) {
			var formData = new FormData();

			formData.append("file", file);
			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					console.log("html = " + html);
					$(".uploadedList").remove();
					$("#fileDrop").append(html);

				}
			});
		}

		var formObj = $("form[role='form']");
		$("#submit-title").on("click", function() {
			formObj.submit();
		});
	</script>



</body>

</html>
