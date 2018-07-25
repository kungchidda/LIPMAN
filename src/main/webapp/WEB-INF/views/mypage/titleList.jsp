<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/profile.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/resources/css/mypage.css" rel="stylesheet">

</head>

<body>

<%@ include file="/WEB-INF/views/mypage/userIcon.jsp"%>

<c:if test="${login.uid == cri.uid}">
<section id="mypage-home">
		<div class="container">
			<ul class="og-grid cards">

				<li class="title-register" id="0">
					<img class="mypage-home-start-image" src="/resources/png/register.png">
					<div class="mypage-home-start-talk" style="height: 75px">
						<!-- <span>Show it!</span><br>
						<span>Your Comic :)</span> -->
					</div>

					<form id="registerForm" role="registerForm" action="/title/register" method="post">
						<div class="og-title-register hide do-not-close">
							<div class="title-register-inner do-not-close">
								<div class="title-edit-input do-not-close">
									<div class="og-fullimg do-not-close" id="fileDrop">
										<div class="uploadedList do-not-close">
											<img src="/resources/png/thumbnail.png" class="do-not-close" style="display: inline;">
										</div>
									</div>
									<input type="hidden" name="uid" class="form-control" value='${login.uid}'>
									<input type="file" id="upload-input" style="display: none;">
									<script>
										$(function() {
											$('#fileDrop').click(function(e) {
												e.preventDefault();
												$('#upload-input').click();
	
											});
										});
									</script>
									<div class="comic-list-title do-not-close">
										<input type="text" name='title' class="do-not-close input-title" placeholder="Comic Title">
									</div>
								</div>
								<div class="title-genre-checkbox do-not-close">
									<div class="genre-1 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-1" value='1'>
										<span class="title-genre-1 do-not-close false">SF</span>
									</div>
									<div class="genre-2 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-2" value='2'>
										<span class="title-genre-2 do-not-close false">Mystery</span>
									</div>
									<div class="genre-3 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-3" value='3'>
										<span class="title-genre-3 do-not-close false">PureLove</span>
									</div>
									<div class="genre-4 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-4" value='4'>
										<span class="title-genre-4 do-not-close false">Romance</span>
									</div>
									<div class="genre-5 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-5" value='5'>
										<span class="title-genre-5 do-not-close false">Comic</span>
									</div>
									<div class="genre-6 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-6" value='6'>
										<span class="title-genre-6 do-not-close false">Reasoning</span>
									</div>
									<div class="genre-7 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-7" value='7'>
										<span class="title-genre-7 do-not-close false">SchoolLife</span>
									</div>
									<div class="genre-8 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-8" value='8'>
										<span class="title-genre-8 do-not-close false">Sports</span>
									</div>
									<div class="genre-9 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-9" value='9'>
										<span class="title-genre-9 do-not-close false">Fantasy</span>
									</div>
									<div class="genre-10 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-10" value='10'>
										<span class="title-genre-10 do-not-close true">Medicine</span>
									</div>
									<div class="genre-11 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-11" value='11'>
										<span class="title-genre-11 do-not-close false">Food</span>
									</div>
									<div class="genre-12 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-12" value='12'>
										<span class="title-genre-12 do-not-close false">Education</span>
									</div>
									<div class="genre-13 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-13" value='13'>
										<span class="title-genre-13 do-not-close false">Battle</span>
									</div>
									<div class="genre-14 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-14" value='14'>
										<span class="title-genre-14 do-not-close false">Mecanic</span>
									</div>
									<div class="genre-15 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-15" value='15'>
										<span class="title-genre-15 do-not-close false">Daily</span>
									</div>
									<div class="genre-16 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-16" value='16'>
										<span class="title-genre-16 do-not-close false">Age</span>
									</div>
									<div class="genre-17 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-17" value='17'>
										<span class="title-genre-17 do-not-close false">GraphicNovel</span>
									</div>
									<div class="genre-18 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-18" value='18'>
										<span class="title-genre-18 do-not-close false">Thriller</span>
									</div>
									<div class="genre-19 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-19" value='19'>
										<span class="title-genre-19 do-not-close false">Drama</span>
									</div>
									<div class="genre-20 do-not-close">
										<input type="checkbox" name='genreArr' class="do-not-close hide genre-20" value='20'>
										<span class="title-genre-20 do-not-close false">Adventure</span>
									</div>
									<button type="submit" class="title-register-complete-btn" id="register-title">Complete</button>
								</div>
							</div>
						</div>
					</form>
				</li>




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
								<img src="/resources/png/pencil.png"><span>${MyPageVO.likecnt}</span>
								<img src="/resources/png/eraser.png"><span>${MyPageVO.dislikecnt}</span>
							</div>
							<div class="og-expander hide do-not-close">
								<div class="og-expander-inner do-not-close">
									<div class="expander-title-inner do-not-close">
										<div class="og-fullimg do-not-close title-fileDrop">
											<div class="uploadedList do-not-close">
												<img class="do-not-close" src="/displayFile?fileName=${MyPageVO.titleFullName}" style="display: inline;">
											</div>
										</div>
										<input type="file" class="title-upload-input do-not-close" style="display: none;">
										
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
										<div class="edit-title-button comic-list-setting do-not-close" genre="${MyPageVO.genre}">
											<img src="/resources/png/setting.png" class="edit-title-img do-not-close">
										</div>
									</div>
									<div class="toggle-page do-not-close">
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
									<div class="title-genre-checkbox hide do-not-close">
										<div class="genre-1 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-1" value='1'>
											<span class="title-genre-1 do-not-close false">SF</span>
										</div>
										<div class="genre-2 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-2" value='2'>
											<span class="title-genre-2 do-not-close false">Mystery</span>
										</div>
										<div class="genre-3 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-3" value='3'>
											<span class="title-genre-3 do-not-close false">PureLove</span>
										</div>
										<div class="genre-4 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-4" value='4'>
											<span class="title-genre-4 do-not-close false">Romance</span>
										</div>
										<div class="genre-5 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-5" value='5'>
											<span class="title-genre-5 do-not-close false">Comic</span>
										</div>
										<div class="genre-6 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-6" value='6'>
											<span class="title-genre-6 do-not-close false">Reasoning</span>
										</div>
										<div class="genre-7 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-7" value='7'>
											<span class="title-genre-7 do-not-close false">SchoolLife</span>
										</div>
										<div class="genre-8 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-8" value='8'>
											<span class="title-genre-8 do-not-close false">Sports</span>
										</div>
										<div class="genre-9 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-9" value='9'>
											<span class="title-genre-9 do-not-close false">Fantasy</span>
										</div>
										<div class="genre-10 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-10" value='10'>
											<span class="title-genre-10 do-not-close false">Medicine</span>
										</div>
										<div class="genre-11 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-11" value='11'>
											<span class="title-genre-11 do-not-close false">Food</span>
										</div>
										<div class="genre-12 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-12" value='12'>
											<span class="title-genre-12 do-not-close false">Education</span>
										</div>
										<div class="genre-13 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-13" value='13'>
											<span class="title-genre-13 do-not-close false">Battle</span>
										</div>
										<div class="genre-14 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-14" value='14'>
											<span class="title-genre-14 do-not-close false">Mecanic</span>
										</div>
										<div class="genre-15 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-15" value='15'>
											<span class="title-genre-15 do-not-close false">Daily</span>
										</div>
										<div class="genre-16 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-16" value='16'>
											<span class="title-genre-16 do-not-close false">Age</span>
										</div>
										<div class="genre-17 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-17" value='17'>
											<span class="title-genre-17 do-not-close false">GraphicNovel</span>
										</div>
										<div class="genre-18 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-18" value='18'>
											<span class="title-genre-18 do-not-close false">Thriller</span>
										</div>
										<div class="genre-19 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-19" value='19'>
											<span class="title-genre-19 do-not-close false">Drama</span>
										</div>
										<div class="genre-20 do-not-close">
											<input type="checkbox" name='genreArr' class="do-not-close hide genre-20" value='20'>
											<span class="title-genre-20 do-not-close false">Adventure</span>
										</div>
										<button type="button" class="delete-title do-not-close title-register-delete-btn">Delete</button>
										<button type="button" class="submit-title do-not-close title-register-complete-btn confirm-button">submit</button>
									</div>
								</div>
							</div>
						</form>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>

</c:if>

<c:if test="${login.uid != cri.uid}">
									
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
								<img src="/resources/png/pencil.png"><span>${MyPageVO.likecnt}</span>
								<img src="/resources/png/eraser.png"><span>${MyPageVO.dislikecnt}</span>
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
	</c:if>
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
						
						initialExpander();
						
					}
				} else {
					var getSubtitleResult = getSubtitle(tno, 1);
					
					var imgSrc = $(this).find('.thumbnail').attr("src");
					imgSrc = imgSrc.substring(22);
					console.log("imgSrc = " + imgSrc);
					var fileInfo = getFileInfo(imgSrc);
					var html = template(fileInfo);
					
					$(".uploadedList").remove();
//	 				$("#fileDrop").append(html);
					$(".title-fileDrop").append(html);
					
					
					
					if (getSubtitleResult) {
		
						if ($(".og-expander").is(":visible") || $(".og-title-register").is(":visible")) { //열린 곳이 있으면
		
							$(".og-title-register").hide(); //다른 곳은 닫음
							$(".og-expander").hide(); //다른 곳은 닫음
							$(".background-blur").removeClass("background-blur"); //blur 효과 없애기
							$(".expander").not(this).addClass("background-blur"); //blur 효과 주기
							$(".margin-bottom").removeClass("margin-bottom"); //margin 삭제
							$(this).addClass("margin-bottom");
							
							initialExpander();
							
							submenu.slideDown(300);
		
						} else { //열린 곳이 없으면
							$(".expander").not(this).addClass("background-blur"); //blur 효과 주기
							$(this).addClass("margin-bottom");
		
							initialExpander();

							
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
		
					var fileInfo = getFileInfo("/thumbnail.png");
					var html = template(fileInfo);
					
					$(".uploadedList").remove();
					$("#fileDrop").append(html);
//	 				$(".title-fileDrop").append(html);
					
					if ($(".og-expander").is(":visible") || $(".og-title-register").is(":visible")) { //열린 곳이 있으면
		
						$('.toggle-page').hide();
						$('.title-genre-checkbox').removeClass("hide");
						
						$('.comic-title').show();
						$('.comic-title-edit').hide();
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
			<img src="{{imgsrc}}" alt="Attachment" class="registed-img do-not-close" style="display: inline;">
		<div class="mailbox-attachment-info do-not-close"style="width:200px;">
				<!-- <a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a> -->
				<small data-src="{{fullName}}" class="hide btn btn-default btn-xs pull-right delbtn">
				<!-- <i class="fa fa-fw fa-remove"></i> -->
				</small>
		</div>
		</div>
	</script>
	
	<script id="upload-template" type="text/x-handlebars-template">
		<div class="uploadedList do-not-close">
			<img src="{{imgsrc}}" alt="Attachment" class="do-not-close submit-yet" style="display: inline;">
		<div class="mailbox-attachment-info do-not-close"style="width:200px;">
				<!-- <a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a> -->
				<small data-src="{{fullName}}" class="hide btn btn-default btn-xs pull-right delbtn">
				<!-- <i class="fa fa-fw fa-remove"></i> -->
				</small>
		</div>
		</div>
	</script>


	<script id="subtitle-template-first-page" type="text/x-handlebars-template">
		{{#each .}}
 			{{#if @first}}
				<div class="subtitleLi do-not-close register">
					<a href="/sboard/register?tno={{tno}}" class="comic-list do-not-close">
						<div class="comic-list do-not-close">
							<img src="/resources/png/register.png">
						</div>
						<div class="comic-list-text cursor do-not-close">
						</div>
					</a>
				</div>
 			{{else}}
				<div class="subtitleLi">
						<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}' >
							<div class="comic-list do-not-close"><img src="/displayFile?fileName={{boardFullName}}"></div>
							<div class="comic-list-text cursor do-not-close">{{subtitle}} {{prettifyDate regdate}}</div>
						</a>
				</div>
			{{/if}}
		{{/each}}
		<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
	</script>
	<script id="subtitle-template" type="text/x-handlebars-template">
		{{#each .}}
				<div class="subtitleLi">
						<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}' >
							<div class="comic-list do-not-close"><img src="/displayFile?fileName={{boardFullName}}"></div>
							<div class="comic-list-text cursor do-not-close">{{subtitle}} {{prettifyDate regdate}}</div>
						</a>
				</div>
		{{/each}}
		<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
	</script>

	<script>
		function initialExpander(){
			$('.toggle-page').show();
			$('.title-genre-checkbox').addClass("hide");
			
			$('.comic-title').show();
			$('.comic-title-edit').hide();
			$('.input-title').attr("readonly");
		}
	
		//subtitle print
		// 	var formObj = $("form[role='form']");

		function getSubtitle(tno, page) {
			console.log("click getSubtitle start getPage");
			console.log("1. tno = " + tno);
			getPage("/sboard/" + tno + "/"+ page +"/6?uid="+'${cri.uid}', tno, page);
			return 1;

		};

/* 		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		}); */
		
		Handlebars.registerHelper("prettifyDate", function(timeValue){
			var regdate = new Date(timeValue);
			var regdateTime = new Date(timeValue).getTime();
			regdateTime = regdateTime / 1000;
			console.log("regdateTime = " + regdateTime);
			
			var current = new Date();
			var currentTime = new Date().getTime();
			currentTime = currentTime / 1000;
			console.log("currentTime = " + currentTime);
			
			var diff = currentTime - regdateTime;
			console.log("diff = " + diff);
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

		function getPage(pageInfo, tno, page) {
			console.log("2. tno = " + tno);
			console.log("start getPage");

			$(".pagination").remove();
			$(".subtitleLi").remove();
			$.getJSON(pageInfo,function(data) {
// 				printData(data.list, $(".og-expander-inner"),$('#subtitle-template'));
				if("${login.uid}" == "${cri.uid}" && page == 1){
					printData(data.list, $(".toggle-page"),$('#subtitle-template-first-page'));
				}else{
					printData(data.list, $(".toggle-page"),$('#subtitle-template'));
				}
				printPaging(data.pageMaker, $(".pagination"), tno);
				//var str = '<div class="subtitleLi do-not-close register"><a href="/sboard/register?tno=' + tno + '" class="comic-list do-not-close"><div class="comic-list do-not-close"><img src="/resources/png/sub-gray.png"></div><div class="comic-list-text cursor do-not-close">New Subtitle</div></a></div>';

				/* if('${cri.uid}'== '${login.uid}' && page == 1){
					var str = '<div class="subtitleLi do-not-close register"><a href="/sboard/register?tno=' + tno + '" class="comic-list do-not-close"><div class="comic-list do-not-close"><img src="/resources/png/register.png"></div><div class="comic-list-text cursor do-not-close"></div></a></div>';
					console.log("str = " + str);
					$('.register').html(str);
				} */

			});
		}

		var printPaging = function(pageMaker, target, tno) {
			console.log("start printPaging");
			console.log("3. tno = " + tno);
			console.log("pageMaker.totalCount = " + pageMaker.totalCount);
			console.log("pageMaker.startPage = " + pageMaker.startPage);
			console.log("pageMaker.endPage = " + pageMaker.endPage);
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
					
					$("input").on("change", function(event) {
						console.log("input change");
						$(".confirm-button").addClass("input-change");
					});
					
					$("input[type='checkbox']").on("change", function(event) {
						console.log("input change");
						$(".confirm-button").addClass("input-change");
					});
					
 					$('.title-fileDrop').click(function(e) {
						e.preventDefault();
						if ($(".title-genre-checkbox").is(":visible")) {
							console.log('$(".title-genre-checkbox").is(":visible") = ' + $(".title-genre-checkbox").is(":visible"));
							$(this).parent().find("input[type='file']").click();
						};
					});
			
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
								$(this).parent().parent().parent().find(".genre-" + genreArr[i]).prop("checked", true);
								$(this).parent().parent().parent().find(".genre-"+genreArr[i]).next().toggleClass("false");
								$(this).parent().parent().parent().find(".genre-"+genreArr[i]).next().toggleClass("true");
							}
					});

/* 					$('.cancel-title').click(
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
					}); */


					$(".submit-title").on("click",function() {
						checkUnload = false;
						
						var deleteArr = [];
						arr.pop();
						console.log("arr.length = " + arr.length);
						console.log("registedArr.length = " + registedArr.length);
						
						deleteArr = arr.concat(registedArr);
						
						 if(deleteArr.length > 0){
								$.ajax({
									  type: 'POST',
									  url: "/deleteAllFiles",
									  data: {files:deleteArr},
									  dataType : "text",
									  async:false,
									  success : function(result){
										}
								});
						}
						
						var str = "";
						console.log("clicked submit-title");
						$(this).parent().parent().parent().parent().attr("action", "/title/modifyTitle");
						$(this).parent().parent().parent().find(".uploadedList .delbtn").each(
								function(index) {
									console.log(index);
									str += "<input type='hidden' name='files["+ index + "]' value='"+ $(this).attr("data-src") + "'> ";
									console.log("str = " + str);
								});
						$(this).parent().parent().parent().parent().append(str);
						$(this).parent().parent().parent().parent().submit();
					});
					
					$(".delete-title").on("click", function() {
						console.log("clicked delete-title");
						$(this).parent().parent().parent().parent().attr("action", "/title/removeTitle");
						$(this).parent().parent().parent().parent().submit();
						
					});
					
					
					/**************************************************************************************/
					/**************************************************************************************/
					/*                               beforeunload start                                   */
					/**************************************************************************************/
					/**************************************************************************************/
					
					var arr = [];
					var registedArr = [];
					var checkUnload = true;

					$(window).on("beforeunload", function(){
						if(checkUnload){
							/* $(".submit-yet").each(function(index){
								var dataSrc = $(this).attr("src");
								dataSrc = dataSrc.substring(22);
								console.log("dataSrc = " + dataSrc);
								arr.push(dataSrc);
								
								var front = dataSrc.substring(0, 12);
								var end = dataSrc.substring(12);
								thumbnailSrc = front + "s_" + end;
								console.log("thumbnailSrc" + thumbnailSrc);
								arr.push(thumbnailSrc);
							}); */
							console.log("arr.length = " + arr.length);
							
							for(i=0; i<arr.length; i++){
								console.log("arr["+i+"] = " + arr[i]);
							}
							
							if(arr.length > 0){
								
								$.ajax({
									  type: 'POST',
									  url: "/deleteAllFiles",
									  data: {files:arr},
									  dataType : "text",
									  async:false,
									  success : function(result){
										}
									});
							}
							
							console.log("beforeunload event");
//			 				return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
						}
						
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

					
					
					/**************************************************************************************/
					/**************************************************************************************/
					/*                            infinity scroll start                                   */
					/**************************************************************************************/
					/**************************************************************************************/
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



		$("#fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$("#fileDrop").on("drop", function(event) {
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;
			var tno = $(this).parent().parent().parent().parent().parent().attr("id");
			for (i = 0; i < files.length; i++) {
				var file = files[i]
				uploadFile(file, tno);
			}

		});

		$("#upload-input").on("change", function(event) {

			event.preventDefault();
			var tno = $(this).parent().parent().parent().parent().parent().attr("id");
			var files = event.target.files
			for (i = 0; i < files.length; i++) {
				var file = event.target.files[i]
				uploadFile(file, tno);
			}
		});
		
		$(".title-upload-input").on("change", function(event) {

			event.preventDefault();
			var tno = $(this).parent().parent().parent().parent().parent().attr("id");
			console.log("upload-input tno = " + tno);
			var files = event.target.files
			for (i = 0; i < files.length; i++) {
				var file = event.target.files[i]
				uploadFile(file, tno);
			}
		});

		$("#registerForm").submit(
				function(event) {
					checkUnload = false;
					event.preventDefault();

					var deleteArr = [];
					arr.pop();
					console.log("arr.length = " + arr.length);
					console.log("registedArr.length = " + registedArr.length);
					
					deleteArr = arr.concat(registedArr);
					
					 if(deleteArr.length > 0){
							$.ajax({
								  type: 'POST',
								  url: "/deleteAllFiles",
								  data: {files:deleteArr},
								  dataType : "text",
								  async:false,
								  success : function(result){
									}
							});
					}
					
					
					var that = $(this);

					var str = "";
					console.log("str = " + str);
					$("#registerForm").find(".uploadedList .delbtn").each(
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

		function uploadFile(file, tno) {
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
					
					arr.push(data);
					
					/* $(".uploadedList .submit-yet").each(function(index){
						var dataSrc = $(this).attr("src");
						dataSrc = dataSrc.substring(22);
						console.log("dataSrc = " + dataSrc);
						arr.push(dataSrc);
					}); */
					
					var fileInfo = getFileInfo(data);
					var html = uploadTemplate(fileInfo);
					
					
					
					console.log("html = " + html);
					console.log("tno = " + tno);
					
					
					if(tno == 0){
						$(".uploadedList").remove();
						$("#fileDrop").append(html);
					
					}else{
						registedArr = [];
						var registedImgSrc = $("#"+tno).find(".uploadedList .registed-img").attr("src");
						console.log("registedImgSrc = " + registedImgSrc);
						if(registedImgSrc != null){
							registedImgSrc = registedImgSrc.substring(22);
							registedArr.push(registedImgSrc);
						}
						
						/* $(".uploadedList .submit-yet").each(function(index){
							var dataSrc = $(this).attr("src");
							dataSrc = dataSrc.substring(22);
							console.log("dataSrc = " + dataSrc);
							arr.push(dataSrc);
						}); */
						
						$("#"+tno).find(".uploadedList").remove();
						$("#"+tno).find(".title-fileDrop").append(html);
					}

				}
			});
		}

/* 		var formObj = $("form[role='registerForm']");
		$("#register-title").on("click", function() {
			formObj.submit();
		}); */
	});

		var template = Handlebars.compile($("#template").html());
		var uploadTemplate = Handlebars.compile($("#upload-template").html());
	</script>



</body>

</html>
