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
				<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
				<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/default.css" />
				<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/component.css" />
				<script src="/resources/ThumbnailGridExpandingPreview/js/modernizr.custom.js"></script>
				<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			</head>

			<body>



				<!--icon-->
				<div class="profile-icon">
					<div class="profile-icon-home">
			            <a href="/mypage/home" class="active">
							<img src="/resources/png/comic.png" id="profile-img-home">
			            </a>
					</div>
					<div class="profile-icon-subscribed">
						<a href="/mypage/subscribed">
							<img src="/resources/png/subscribe.png" id="profile-img-subscribed">
						</a>
					</div>
					<div class="profile-icon-subscriber">
						            <a href="/mypage/subscriber">
							<img src="/resources/png/subscribed.png" id="profile-img-subscriber">
							            </a>
					</div>
					<div class="profile-icon-setting">
						            <a href="/mypage/setting">
							<img src="/resources/png/setting.png" id="profile-img-setting">
							            </a>
					</div>
				</div>



				<section id="mypage-home">
					<div class="container">
						<ul id="og-grid-mypage" class="og-grid cards">
								<!-- 								<div style="background-color:gray;vertical-align:middle;width:200px;height:300px;"> -->
								
								<li class="title-register">
                                    <!-- <a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}" data-largesrc="/displayFile?fileName=${boardVO.titleFullName}" data-title="${boardVO.title}"
						 class="expander" onclick="getSubtitle(${boardVO.tno});"> data-description="${boardVO.uname}"> -->
	                                        <img class="thumbnail" src="/resources/png/upload.png">

                                        <div class="title">
                                            Upload New Title
                                        </div>

                                        <div class="subtitle">
                                           -
                                        </div>

                                        <div class="line"><img src="/resources/svg/line.svg"></div>
                                        <div class="thumbnail-thumb">
                                            <img src="/resources/png/pencil.png"><span>0</span>
                                            <img src="/resources/png/eraser.png"><span>0</span>
                                        </div>
										<div class="line">
											<img src="/resources/svg/line.svg">
										</div>

                                        <div class="thumbnail-writer">
                                            <img src="/resources/png/account.png">
                                            <span>${login.uname}</span>
                                        </div>
                                        <!-- 					</a> -->
                                        
										<form id="registerForm" role="form" action="/title/register" method="post">
                                        <div class="og-title-register hide do-not-close" style=" height: 700px;">
                                                <div class="og-fullimg do-not-close" id="fileDrop">
													<div class="uploadedList do-not-close" >
														<img src="/resources/png/number-00.png" class="do-not-close" style="display: inline;">
													</div>
												</div>
                                                <input type="hidden" name="uid" class="form-control" value='${login.uid}'>
											    <input type="file" id="upload-input" style="display: none;">
											    <script>
									        		$(function () {
									        			$('#fileDrop').click(function (e) {
									        				e.preventDefault();
									        				$('#upload-input').click();
									        				
									        			});
									        		});
									        		
									       		</script>
                                                <div class="comic-list-title">
                                                    <div><input type="text" name='title' class="do-not-close" placeholder="Comic Title"></div>
                                                </div>
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput1" value='1'>SF
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput2" value='2'>Mystery
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput3" value='3'>PureLove
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput4" value='4'>Romance
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput5" value='5'>Comic
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput6" value='6'>Reasoning
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput7" value='7'>SchoolLife
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput8" value='8'>Sports
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput9" value='9'>Fantasy
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput10" value='10'>Medical
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput11" value='11'>Food
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput12" value='12'>Education
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput13" value='13'>Battle
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput14" value='14'>Mecanic
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput15" value='15'>Daily
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput16" value='16'>Age
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput17" value='17'>GraphicNovel
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput18" value='18'>Thriller
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput19" value='19'>Drama
													<input type="checkbox" name='genreArr' class="do-not-close" id="genreInput20" value='20'>Adventure
                                        <button type="button" id="submit-title">submit</button>
                                        </div>
                                        </form>
                                        
                                </li>

							
							
							
							 <c:forEach items="${homeList}" var="MyPageVO">
<%--                                 <li class="expander" onclick="getSubtitle(${MyPageVO.tno});"> --%>
                                <li class="expander" id="${MyPageVO.tno}">
									<form id="modifyForm-${MyPageVO.tno}" role="form" action="/title/modifyTitle" method="post">
									
                                    <!-- <a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}" data-largesrc="/displayFile?fileName=${boardVO.titleFullName}" data-title="${boardVO.title}"
						 class="expander" onclick="getSubtitle(${boardVO.tno});"> data-description="${boardVO.uname}"> -->
										<img class="thumbnail" src="/displayFile?fileName=${MyPageVO.titleFullName}">

                                        <div class="title">
                                            ${MyPageVO.title}
                                        </div>

                                        <div class="subtitle">
                                            ${MyPageVO.subtitle}-
                                        </div>

                                        <div class="line"><img src="/resources/svg/line.svg"></div>
                                        <div class="thumbnail-thumb">
                                            <img src="/resources/png/pencil.png"><span>${MyPageVO.titlelikecnt}</span>
                                            <img src="/resources/png/eraser.png"><span>${MyPageVO.titledislikecnt}</span>
                                        </div>
										<div class="line">
											<img src="/resources/svg/line.svg">
										</div>

                                        <div class="thumbnail-writer">
                                            <img src="/resources/png/account.png">
                                            <span>${MyPageVO.uname}</span>
                                        </div>
                                        <!-- 					</a> -->
                                        <div class="og-expander hide" style=" height: 700px;">
                                            <div class="og-expander-inner do-not-close">
                                                <div class="og-fullimg do-not-close">
                                                    <img class="do-not-close" src="/displayFile?fileName=${MyPageVO.titleFullName}" style="display: inline;">
                                                </div>
                                                <div class="comic-list-title do-not-close">
                                                    <div class="mypage-title do-not-close">
                                                    	${MyPageVO.title}
                                                    </div>
                                                    <div class="mypage-gname do-not-close">
                                                    	${MyPageVO.gname}
                                                    </div>
                                					
                                					<div class="edit-title-button" genre="${MyPageVO.genre}">
                                						<button type="button" class="edit-title do-not-close">change</button>
                                					</div>
                                					
                                					<div class="submit-cancel-button do-not-close">
                                                    	<div><input type="text" name="title" class="input-text title-input do-not-close" value="${MyPageVO.title}" readonly></div>
                                                    	<div style="display:none;"><input type="text" class="do-not-close" name="tno" value="${MyPageVO.tno}" readonly></div>
                                						<div><button type="button" class="submit-title do-not-close">submit</button></div>
                                						<div><button type="button" class="cancel-title do-not-close">cancel</button></div>
                                					</div>
                                                </div>
                                                <div class="register"></div>
                                                <div style="height:50px;" class="subtitleLi">
<!--                                                     <a href="/sboard/readPage?page=1&amp;perPageNum=50&amp;searchType&amp;keyword&amp;bno=5"> -->
                                                        <div class="comic-list">
                                                        <c:if test="${not empty MyPageVO.boardFullName}">
                                                            <img src="/displayFile?fileName=${MyPageVO.boardFullName}">
                                                            </c:if>
                                                        </div>
                                                        <div class="comic-list-text cursor">
                                                            ${MyPageVO.subtitle}
                                                        </div>
<!--                                                     </a> -->
                                                    <ul id="pagination" class="pagination"></ul>
                                                </div>
                                                <div class="genre-input">
                                                	<input type="checkbox" name='genreArr' class="do-not-close genreInput1" value='1'>SF
													<input type="checkbox" name='genreArr' class="do-not-close genreInput2" value='2'>Mystery
													<input type="checkbox" name='genreArr' class="do-not-close genreInput3" value='3'>PureLove
													<input type="checkbox" name='genreArr' class="do-not-close genreInput4" value='4'>Romance
													<input type="checkbox" name='genreArr' class="do-not-close genreInput5" value='5'>Comic
													<input type="checkbox" name='genreArr' class="do-not-close genreInput6" value='6'>Reasoning
													<input type="checkbox" name='genreArr' class="do-not-close genreInput7" value='7'>SchoolLife
													<input type="checkbox" name='genreArr' class="do-not-close genreInput8" value='8'>Sports
													<input type="checkbox" name='genreArr' class="do-not-close genreInput9" value='9'>Fantasy
													<input type="checkbox" name='genreArr' class="do-not-close genreInput10" value='10'>Medical
													<input type="checkbox" name='genreArr' class="do-not-close genreInput11" value='11'>Food
													<input type="checkbox" name='genreArr' class="do-not-close genreInput12" value='12'>Education
													<input type="checkbox" name='genreArr' class="do-not-close genreInput13" value='13'>Battle
													<input type="checkbox" name='genreArr' class="do-not-close genreInput14" value='14'>Mecanic
													<input type="checkbox" name='genreArr' class="do-not-close genreInput15" value='15'>Daily
													<input type="checkbox" name='genreArr' class="do-not-close genreInput16" value='16'>Age
													<input type="checkbox" name='genreArr' class="do-not-close genreInput17" value='17'>GraphicNovel
													<input type="checkbox" name='genreArr' class="do-not-close genreInput18" value='18'>Thriller
													<input type="checkbox" name='genreArr' class="do-not-close genreInput19" value='19'>Drama
													<input type="checkbox" name='genreArr' class="do-not-close genreInput20" value='20'>Adventure
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
							<div class="compony-infor">
								Copyright © 2018 LIPMAN. 모든 권리 보유.
							</div>
						</div>



<!-- 						<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
						<script src="/resources/ThumbnailGridExpandingPreview/js/mypage_grid.js"></script>
							<script src="/resources/ThumbnailGridExpandingPreview/js/grid.js"></script>
						<script>
							$(function () {
								// 				Grid.init();
								GridMypage.init();
							});
						</script> -->
						<script>
                    /**************************************************************************************/
                    /**************************************************************************************/
                    /*                               	expander	 	                                  */
                    /**************************************************************************************/
                    /**************************************************************************************/
                    $(document).ready(function() {
                        // expander 클래스를 클릭했을때
                        $(".expander").click(function() {
                        	
                        
                        	if (!$(this).parents().find(".genre-input").is(":visible")){
                        		$(this).parents().find('.edit-title-button').show();
                                $(this).parents().find('.mypage-title').show();
                                $(this).parents().find('.subtitleLi').show();
                                $(this).parents().find('.genre-input').hide();
								$(this).parents().find('.submit-cancel-button').hide();
                                $(this).parents().find('.title-input').attr("readonly");
                        	}
                        	
                            console.log("expander clicked");
                            var submenu = $(this).find(".og-expander");
                            var tno = $(this).attr('id');
                            console.log("tno = " + tno);

                            if (submenu.is(":visible")) { //보이면 올림
                            	if(!event.target.matches('.do-not-close')){
	                                $(this).parents().find(".background-blur").removeClass("background-blur"); //blur 효과 없애기
	                                submenu.slideUp(300);
	                                $(this).removeClass("margin-bottom");
                            	}
                            } else {
                            	var getSubtitleResult = getSubtitle(tno);
                                if(getSubtitleResult){
                            		
                                	
                                    if ($(this).parents().find(".og-expander").is(":visible")||$(this).parents().find(".og-title-register").is(":visible")) { //열린 곳이 있으면
                                    	
                                    	$(this).parents().find(".og-title-register").hide(); //다른 곳은 닫음
                                        $(this).parents().find(".og-expander").hide(); //다른 곳은 닫음
                                        $(this).parents().find(".background-blur").removeClass("background-blur"); //blur 효과 없애기
                                        $(".expander").not(this).addClass("background-blur"); //blur 효과 주기
                                        $(this).parents().find(".margin-bottom").removeClass("margin-bottom"); //margin 삭제
                                        $(this).addClass("margin-bottom");
                                        
                                        submenu.show();

                                    } else { //열린 곳이 없으면
                                        
                                    	$(this).parents().find(".og-expander").hide(); //다른 곳은 닫음
                                        $(this).parents().find(".background-blur").removeClass("background-blur"); //blur 효과 없애기
                                        $(".expander").not(this).addClass("background-blur"); //blur 효과 주기
                                        $(this).parents().find(".margin-bottom").removeClass("margin-bottom"); //margin 삭제
                                        $(this).addClass("margin-bottom");
                                        
                                        submenu.slideDown(300);
                                    }
                                    
                                	}
                      
                            }
                        });
                        
						//$(".title-register").click(function() {
						$(".title-register").click(function() {
							
                            console.log("title-register clicked");
                            var submenu = $(".og-title-register");
	                       if (submenu.is(":visible")) { //보이면 올림
                            	if(!event.target.matches('.do-not-close')){
	                                $(this).parents().find(".background-blur").removeClass("background-blur"); //blur 효과 없애기
	                                submenu.slideUp(300);
	                                $(this).removeClass("margin-bottom");
                            	}
                            } else {
                            	
                            	if ($(this).parents().find(".og-expander").is(":visible")||$(this).parents().find(".og-title-register").is(":visible")) { //열린 곳이 있으면
                            		  
                            		  $(this).parents().find(".og-expander").hide(); //다른 곳은 닫음
                                      $(this).parents().find(".background-blur").removeClass("background-blur"); //blur 효과 없애기
                                      $(".title-register").not(this).addClass("background-blur"); //blur 효과 주기
                                      $(this).parents().find(".margin-bottom").removeClass("margin-bottom"); //margin 삭제
                                      $(this).addClass("margin-bottom");
                            		  
                                        
                                        submenu.show();

                                    } else { //열린 곳이 없으면
                                        
//										$(this).parents().find(".og-title-register").hide(); //다른 곳은 닫음
//										$(this).parents().find(".background-blur").removeClass("background-blur"); //blur 효과 없애기
										$(".title-register").not(this).addClass("background-blur"); //blur 효과 주기
//										$(this).parents().find(".margin-bottom").removeClass("margin-bottom"); //margin 삭제
										$(this).addClass("margin-bottom");
                                        
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
			<img src="{{imgsrc}}" style="width:400px;" alt="Attachment" class="do-not-close" style="display: inline;">
		<div class="mailbox-attachment-info do-not-close"style="width:200px;">
				<a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a>
				<small data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
					<i class="fa fa-fw fa-remove"></i>
				</small>
		</div>
		</div>
	</script>


						<script id="subtitle-template" type="text/x-handlebars-template">
		{{#each .}}
			<!-- <div style="height:50px;" class="subtitleLi" data-sno={{sno}}>
					<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}'>{{subtitle}}</a>
			</div> -->
			<div class="subtitleLi">
					<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}' >
						<div class="comic-list"><img src="/displayFile?fileName={{boardFullName}}"></div>
						<div class="comic-list-text cursor">{{subtitle}}</div>
					</a>
			</div>
		{{/each}}
		<ul id="pagination" class="pagination"></ul>
	</script>

						<script> //subtitle print
							// 	var formObj = $("form[role='form']");

							function getSubtitle(tno) {
								console.log("click getSubtitle start getPage");
								console.log("tno = " + tno);
								getPage("/sboard/" + tno + "/1", tno);
								return 1;

							};



							Handlebars.registerHelper("prettifyDate", function (timeValue) {
								var dateObj = new Date(timeValue);
								var year = dateObj.getFullYear();
								var month = dateObj.getMonth() + 1;
								var date = dateObj.getDate();
								return year + "/" + month + "/" + date;
							});




							$(".pagination").on("click", "li a", function (event) {
								event.preventDefault();
								subtitlePage = $(this).attr("href");
								getPage("/sboard/" + tno + "/" + subtitlePage);

							});



							var printData = function (subtitleArr, target, templateObject) {
								console.log("start printData");
								var template = Handlebars.compile(templateObject.html());

								var html = template(subtitleArr);
								// 		target.after(html);
								target.append(html);
							}


							function getPage(pageInfo, tno) {
								console.log("start getPage");


								// 		$(".subtitleLi").remove();
								// 		$.getJSON(pageInfo,function(data){
								// 			printData(data.list, $(".subtitlesDiv"), $('#subtitle-template'));
								// 			printPaging(data.pageMaker, $(".pagination"));
								// 			console.log("start subtitlecntSmall");
								// 			$(".subtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
								// 			var str = '<a href="/sboard/register?tno='+tno+'">Upload your new webtoon</a>';
								// 			console.log("str = " + str);
								// 			//$('.register').remove();
								// 			$('.register').html(str);

								// 		});
								$(".pagination").remove();
								$(".subtitleLi").remove();
								$.getJSON(pageInfo, function (data) {
									printData(data.list, $(".og-expander-inner"), $('#subtitle-template'));
									printPaging(data.pageMaker, $(".pagination"));
									// 			console.log("start subtitlecntSmall");
									// 			$(".subtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
									var str = '<div class="subtitleLi"><a href="/sboard/register?tno=' + tno + '" class="comic-list"><img src="/resources/png/upload.png"></a></div>';
									//'<div class="comic-list-01 cursor"><a href="/sboard/register?tno='+tno+'"><img src="/resources/png/upload.png"></a></div>
									console.log("str = " + str);
									//$('.register').remove();
									$('.register').html(str);

								});
							}

							var printPaging = function (pageMaker, target) {
								console.log("start printPaging");
								var str = "";
								if (pageMaker.endPage != '1') {
									if (pageMaker.prev) {
										str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
									}

									for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
										var strClass = pageMaker.cri.page == i ? 'class=active' : '';
										str += "<li class='page-item' " + strClass + "><a class='page-link' href='" + i + "'>" + i + "</a></li>";
									}

									if (pageMaker.next) {
										str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
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

/* 		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);
			
			
		}); */
						</script>

						<script>
							$(document).ready(function () {
// 								$('#profile-img-home').click();
								$('#searchBtn').on(
									"click",
									function (event) {

										self.location = "list"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword=" + $('#keywordInput').val();
									});

								$('#newBtn').on("click", function (evt) {
									self.location = "register";
								});

								
                                $('.edit-title').click(function (e) {
                                	$(this).parent().parent().find('.edit-title-button').hide();
                                    $(this).parent().parent().find('.mypage-title').hide();
                                    $(this).parent().parent().parent().find('.subtitleLi').hide();
									$(this).parent().parent().find('.submit-cancel-button').show();
                                    $(this).parent().parent().parent().find('.genre-input').show();
                                    $(this).parent().parent().find('.title-input').removeAttr("readonly").focus();
                                    
                                    var genreStr = $(this).parent().attr('genre');
                                    console.log("genreStr = " + genreStr);
//                                     var genreStr = "${MyPageVO.genre}";
                                	var genreArr = genreStr.split(',');
                                	var genreLen = genreArr.length;
                                	
                                	for(var i = 0; i <genreLen; i++){
                                		console.log("genreArr[" + i + "] = " + genreArr[i]);
            							$(".genreInput"+genreArr[i]).prop( "checked", true );
                                	}
                                });
                                
                                
                                $('.cancel-title').click(function (e) {
									$(this).parents().find('.edit-title-button').show();
                                    $(this).parents().find('.mypage-title').show();
                                    $(this).parents().find('.subtitleLi').show();
                                    $(this).parents().find('.genre-input').hide();
									$(this).parents().find('.submit-cancel-button').hide();
                                    $(this).parents().find('.title-input').attr("readonly");
                                });
                                
                                /* var formObj = $("form[role='form']");
                                console.log(formObj); */

                                $(".submit-title").on("click", function () {
                                    $(this).parent().parent().parent().parent().parent().parent().submit();
                                });

								//무한 스크롤 기능 일시 정지 
								//현재 페이지 받아옴
								var i = ${ pageMaker.cri.page };

								//스크롤 이벤트 발생
								$(window).scroll(function () {
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
											type: 'GET',
											url: url,
											dataType: 'html',
											success: function (html) {
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
		
		$("#fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$("#fileDrop").on("drop", function(event){
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;
			
			for(i=0; i<files.length; i++){
	        	var file = files[i]
				uploadFile(file);	
	        }
			
		});
		
	    $("#upload-input").on("change", function(event) {
	        
	    	event.preventDefault();
	    	
	    	var files = event.target.files
	    	for(i=0; i<files.length; i++){
	        	var file = event.target.files[i]
				uploadFile(file);
	        }
	    });
		
		$("#registerForm").submit(function(event){
			event.preventDefault();
			
			var that = $(this);
			
			var str = "";
			console.log("str = " + str);
			$(".uploadedList .delbtn").each(function(index){
				console.log(index);
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src") +"'> ";
				console.log("str = " + str);
			});
			that.append(str);
			
			that.get(0).submit();
			
		});
		
		$(".uploadedList").on("click", "small", function(event){
			
			var that = $(this);
			
			$.ajax({
				url : "deleteFile",
				type : "post",
				data : {fileName:$(this).attr("data-src")},
				dataType : "text",
				success : function(result){
					if(result == 'deleted'){
						//alert("deleted");
						that.parents().parent("li").remove();
					}
				}
			});
		});
		

	    
	    function uploadFile(file){
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
// 					$(".uploadedList").append(html);
					$(".uploadedList").remove();
					$("#fileDrop").append(html);
					
				}
			});
	    }
	    
	    var formObj = $("form[role='form']");
	    $("#submit-title").on("click", function () {
            formObj.submit();
        });
	</script>



			</body>

			</html>