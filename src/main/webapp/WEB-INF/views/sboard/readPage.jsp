<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>${boardVO.title}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>

  	<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>

<link href="/resources/css/contents.css" rel="stylesheet">
<script src="/resources/js/subscribe-check.js"></script>
<script src="/resources/js/subtitlePrint.js"></script>
<script src="/resources/js/expander.js"></script>

<script type="text/javascript" src="/resources/js/date.js"></script>

<!-- <link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/default.css" />
<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/component.css" />
<script src="/resources/ThumbnailGridExpandingPreview/js/modernizr.custom.js"></script> -->



</head>
<body>
<section>
	<form role="modifyForm" action="modifyPage" method="post">
		<input type='hidden' name='bno' value="${boardVO.bno}">
		<!-- <input type='hidden' name='page' value="${cri.page}"> --> <!-- 무한스크롤 적용을 위한 주석처리 무조건 1페이지로 이동 -->
		<!-- <input type='hidden' name='perPageNum' value="${cri.perPageNum}"> --> <!-- 무한스크롤 적용을 위한 주석처리 무조건 1페이지로 이동 -->
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">
		<input type='hidden' name='title' class="form-control" value="${boardVO.title}" readonly="readonly">
		<input type='hidden' name='subtitle' class="form-control" value="${boardVO.subtitle}" readonly="readonly">
		<input type='hidden' name="uname" class="form-control" value="${boardVO.uname}" readonly="readonly">
	</form>

    <!--profile-->
    <div class="content-writer-profile">
        <div class="content-writer-img">
            <img src="/displayFile?fileName=${boardVO.profileFullName}">
        </div>
        <div class="content-writer-name">
	        	<form id="subscriberForm" role="form" action="/mypage/titleList" method="GET">
					<input type="hidden" name="uid" value='${boardVO.uid}'>
					<button type="submit" class="default-button-style"><p>${boardVO.uname}</p></button>
				</form>
<%--             <h3>${boardVO.uname}</h3> --%>
        </div>
        <div class="content-writer-subscribe">
            <span>
				<c:if test="${login.uid == boardVO.uid}">
					<button type="button" class="modifyPageBtn">Modify</button>
					<button type="button" class="removePageBtn">REMOVE</button>
				</c:if>
            	<c:if test="${login.uid != boardVO.uid}">
           			<button type="submit" class="subscribedCount subscribe subscribeBtn">SUBSCRIBE</button>
					<button type="submit" class="subscribedCount subscribed unsubscribeBtn">SUBSCRIBED</button>
				</c:if>
			</span>
        </div>
    </div>
    
    <hr>
	<br>
	<!--contents-->
    <div class="contents">
        <p class="comic">
            ${boardVO.fileList}
        </p>
    </div>
    
    <!--thumb-->
    <div class="evaluate ">
        <div class="evaluate-pencil">
            <img src="/resources/png/pencil-g.png" id='likeAddBtn'>
            <img src="/resources/png/pencil.png" id='likeDelBtn'>
        </div>
        <div class="evaluate-no-1 likesDiv">
        </div>
        <div class="evaluate-eraser"  >
            <img src="/resources/png/eraser-g.png" id='dislikeAddBtn'>
            <img src="/resources/png/eraser.png" id='dislikeDelBtn'>
        </div>
        <div class="evaluate-no-2 dislikesDiv">
        </div>
    </div>
    
</section>
    
	

	
<!-- <hr>  -->   
    
    
    
    <!--comic-infor-->
   <div class="comic-infor">
       <div class="comic-thumbnail">
<!--            <a href="mypage-home.html"><img src="images/thumbnail-001.jpg"></a> -->
           <img src="/displayFile?fileName=${boardVO.boardFullName}">
       </div>
       <div class="comic-title">
           <span>${boardVO.subtitle}</span>
       </div>
       <div class="raw-time hide">
			<fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd-HH-mm-ss"/>
       </div>
       
       <div class="comic-time">
           <span><img src="/resources/png/comic.png">
<%--             	<fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd-HH-mm-ss"/> --%>
<%--             	<fmt:parseDate var="startDate_D"  value="${boardVO.regdate}" pattern="yyyy-MM-dd"/> --%>
<%--             	<fmt:parseNumber var="startTime_N" value="${startDate_D.time}" integerOnly="true" /> --%>
            </span> 
       </div>
       <div class="comic-view">
			<span><img src="/resources/png/view.png"></span>${boardVO.viewcnt}
       </div>
       <div class="comic-link">
           <a href="#"><span><img src="/resources/png/copy-link.png"></span>copy link</a>
       </div>
       <div class="writer-subscribe">
			<span>
				<c:if test="${login.uid == boardVO.uid}">
					<button type="button" class="modifyPageBtn">Modify</button>
					<button type="button" class="removePageBtn">REMOVE</button>
				</c:if>
            	<c:if test="${login.uid != boardVO.uid}">
           			<button type="submit" class="subscribedCount subscribe subscribeBtn">SUBSCRIBE</button>
					<button type="submit" class="subscribedCount subscribed unsubscribeBtn">SUBSCRIBED</button>
				</c:if>
			</span>
       </div>
   </div>
   
   <!--comic-comment-->
   <!-- <div class="strapline">
      	<h4>Author Comment</h4>
    </div> -->
      <div class="comic-infor-comment">
      	<div class="comic-comment">
      		${boardVO.content}
      	</div>
       </div>


				
				
					
	
	<hr>
	<!--next comic-->
    <div class="strapline">
        <h4>Comic List</h4>
    </div>


		<div class="content-margin-bottom">
	<div class="og-expanded list-og-expanded another-og-expanded do-not-close">
		<div class="og-expander-inner list-og-expander-inner another-og-expander-inner do-not-close">
			<div class="expander-title-inner list-expander-title-inner">
				<div class="og-fullimg list-og-fullimg do-not-close">
					<img class="do-not-close" src="/displayFile?fileName=${boardVO.titleFullName}" style="display: inline;">
				</div>
				<div class="comic-list-genre list-comic-list-genre do-not-close">
					<div>${boardVO.gname}</div>
				</div>
				<div class="comic-list-title list-comic-list-title do-not-close">
					<div>${boardVO.title}</div>
				</div>
				<!-- <div class="comic-list-setting">
					<img src="/resources/png/setting.png" onclick="#">
				</div> -->
			</div>
			<div class="readpage-toggle-page list-readpage-toggle-page another-readpage-toggle-page">
				<div class="thissubtitleLi do-not-close">
					<a href="#">
						<div class="comic-list list-comic-list another-comic-list do-not-close">
							<img src="/displayFile?fileName=${boardVO.boardFullName}">
						</div>
						<div class="comic-list-text another-comic-list-text cursor do-not-close">
							${boardVO.subtitle}
						</div>
						<div class="comic-list-time">  </div>
					</a>
					<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
				</div>
			</div>
		</div>
	</div>
</div>

    <hr>
    
    <!--another comic-->
    <div class="strapline">
        <h4>Another Comic</h4>
    </div>

		<%-- <ul id="og-grid" class="og-grid cards">
			<c:forEach items="${list}" var="boardVO">
				<li class="expander" id="${boardVO.tno}">
					<img class="thumbnail" src="/displayFile?fileName=${boardVO.boardFullName}" />
								
					<div class="title">
            						${boardVO.title}
        						</div>
        						
		            <div class="subtitle">
		                ${boardVO.subtitle}
		            </div>
					
					<div class="thumbnail-thumb">
						<img src="/resources/png/pencil.png"><span>${boardVO.likecnt}</span>
						<img src="/resources/png/eraser.png"><span>${boardVO.dislikecnt}</span>
					</div>
					<div class="line"><img src="/resources/svg/line.svg"></div>
					
					<div class="thumbnail-writer">
		                <img src="/resources/png/account.png">
		                <span>${boardVO.uname}</span>
		            </div>
<!-- 					</a> -->
					
					<div class="og-expander hide" style=" height: 700px;">
<!-- 					<div class="og-expander " style=" height: 700px;"> -->
							<div class="og-expander">
								<div class="og-fullimg">
									<img src="/displayFile?fileName=${boardVO.titleFullName}" style="display: inline;">
								</div>
								<div class="comic-list-title">
									<div>${boardVO.title}</div>
								</div>
							<div style="height:50px;" class="subtitleLi" data-sno=>
										<div class="comic-list">
											<img src="/displayFile?fileName=${boardVO.boardFullName}">
										</div>
										<div class="comic-list-text cursor">
											${boardVO.subtitle}
										</div>
								<ul id="pagination" class="pagination"></ul>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul> --%>
		
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
							<div class="expander-title-inner another-expander-title-inner">
								<div class="og-fullimg another-og-fullimg do-not-close">
									<img class="do-not-close" src="/displayFile?fileName=${boardVO.titleFullName}" style="display: inline;">
								</div>
								<div class="comic-list-genre another-comic-list-genre do-not-close">
									<div>${boardVO.gname}</div>
								</div>
								<div class="comic-list-title another-comic-list-title do-not-close">
									<div>${boardVO.title}</div>
								</div>
								<!-- <div class="comic-list-setting">
									<img src="/resources/png/setting.png" onclick="#">
								</div> -->
							</div>
								<div class="toggle-page another-toggle-page">
									<div class="subtitleLi do-not-close">
										<a href="#">
											<div class="comic-list do-not-close">
												<img src="/displayFile?fileName=${boardVO.boardFullName}">
											</div>
											<div class="comic-list-text cursor do-not-close">
												${boardVO.subtitle}
											</div>
										</a>
										<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
									</div>
								</div>
							</div>
						</div>
				</li>

			</c:forEach>
		</ul>
		<br>
		
    <hr>
<section class="section">
	<div class="comments">
			    <!--comment-->
			    <div class="strapline">
			        <h4 id='replycntSmall'>Comment</h4>
			    </div>
				
				<c:if test="${not empty login}">
					<div class="comment">
						<input type="hidden" id="newReplyUid" value="${login.uid}" readonly="readonly">
						<input type="hidden" placeholder="USER ID" id="newReplyUname" value="${login.uname}" readonly="readonly">
						
						<textarea class="comment-text" id="newReplyText" placeholder="Comment"></textarea>
            			<button type="submit" class="comment-button" id="replyAddBtn"><img src="/resources/png/comic.png"></button>
            			
            
					</div>
					
				</c:if>
				
					
				<c:if test="${empty login}">
					<!-- <div class="box-body">
						<div><a href="/user/login">Login Please</a></div>
					</div> -->
					<div class="comment">
						
						<textarea class="comment-text" id="newReplyText" placeholder="Comment" readonly>Login Please</textarea>
            			<button type="button" class="comment-button"><img src="/resources/png/comic.png"></button>
            			
            
					</div>
				</c:if>
	</div>
					
	
	<%-- <div><i class="fa fa-thumbs-up" style="color:red;"></i> : ${boardVO.likecnt} / <i class="fa fa-thumbs-down"></i> : ${boardVO.likecnt}</div> --%>
	<!-- The time line -->
	<ul class="timeline">
		<!-- timeline time label -->
		<li class="time-label" id="repliesDiv">
		</li>
	</ul>
	<div class='text-center'>
		<ul id="pagination" class="pagination justify-content-center"></ul>
	</div>
	</section>
	
	<div class="footer"></div>
	
	<%-- <div class="box-footer">
	<button type="submit" class="btn" id="subscribeBtn">SUBSCRIBE</button>
	<button type="submit" class="btn btn-danger" id="unsubscribeBtn">SUBSCRIBED</button>
		<c:if test="${login.uid == boardVO.uid}">
			<button type="submit" class="btn btn-warning" id="modifyPageBtn">Modify</button>
			<button type="submit" class="btn btn-danger" id="removePageBtn">REMOVE</button>
		</c:if>
			<button type="submit" class="btn btn-primary" id="listPageBtn">LIST ALL</button>
	</div> --%>
	<!-- /.box-body -->

 	<!--another comment-->
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<li class="replyLi" data-rno={{rno}}>
    		<div class="another-comment">
				<div class="another-user-image">
						<form id="subscriberForm" role="form" action="/mypage/titleList" method="GET">
							<input type="hidden" name="uid" value='{{uid}}'>
							<button type="submit" class="reply-profile-img-button"><img src="/displayFile?fileName={{profileFullName}}"></button>
						</form>
        		</div>
				<div class="another-user-name">
					<h4 class="modal-title" style="display:none">{{rno}}</h4>
						<form id="subscriberForm" role="form" action="/mypage/titleList" method="GET">
							<input type="hidden" name="uid" value='{{uid}}'>
							<button type="submit" class="reply-profile-name-button">{{uname}}</button>
						</form>
					<span class="another-user-time">{{prettifyDate regdate}}</span>
				</div>

				<div class="another-comment-modify modal-footer " data-rno={{rno}}>
{{#eqUid uid}}
            		<img class="replyModBtn" src="/resources/png/modify.png">
					<img class="replySubmitBtn" style="display:none" src="/resources/png/modify.png">
            		<img class="replyDelBtn" src="/resources/png/delete.png">
	{{/eqUid}}
        		</div>

				<!-- <div class="modal-body another-user-comment comment"> -->
					<textarea class="comment-text" id="replytext" readonly>{{replytext}}</textarea>
				<!-- </div> -->

                <div class="replylikesDiv another-comment-thumb" data-rno={{rno}}>
                    <img src="/resources/png/pencil-g.png" class="replylike replylikeAddBtn" id="replyLikeAddBtn">
                    <img src="/resources/png/pencil.png" class="replylike replylikeDelBtn" id="replyLikeDelBtn">
					<span id="replylikeLi">
                    	{{replylikecnt}}
                	</span>
                    <img src="/resources/png/eraser-g.png" class="replydislike replydislikeAddBtn" id="replyDislikeAddBtn">
                    <img src="/resources/png/eraser.png" class="replydislike replydislikeDelBtn" id="replyDislikeDelBtn">
					<span id="replydislikeLi">
                    	{{replydislikecnt}}
                	</span>
                </div>

				<!-- <div class="another-comment-more">
            		<a href="#">More comments</a>
        		</div> -->
			</div>
		</li>
		{{/each}}
	</script>
	
	<script id="like_template" type="text/x-handlebars-template">
		{{#each .}}
			<div id="likeLi">
				{{likecnt}}
			</div>
		{{/each}}
	</script>
	
	<script id="dislike_template" type="text/x-handlebars-template">
		{{#each .}}
			<div id="dislikeLi">
				{{dislikecnt}}
			</div>
		{{/each}}
	</script>
	
	
	<script id="replylike_template" type="text/x-handlebars-template">
		{{#each .}}
				<span id="replylikeLi">
                   	{{replylikecnt}}
               	</span>
		{{/each}}
	</script>
	<script id="replydislike_template" type="text/x-handlebars-template">
		{{#each .}}
				<span id="replydislikeLi">
                   	{{replydislikecnt}}
               	</span>
		{{/each}}
	</script>
	<script id="prettifyDate_template" type="text/x-handlebars-template">
		{{#each .}}
			<span><img src="/resources/png/comic.png">
				{{prettifyDate regdate}}
			</span>
		{{/each}} 
	</script>
	
	
	<script>
		
		$(document).ready(function() {
			var regdate = $(".raw-time").text().trim();			
			console.log("raw-time span regdate = " + regdate);
			var regdateArr = [];
			regdateArr = regdate.split("-");
			for(i=0; i<regdateArr.length; i++){
				console.log("regdateArr["+i+"] = " + regdateArr[i]);				
			}
			
			console.log("regdateArr[3] = " + regdateArr[3]);
// 			regdateArr[3] = regdateArr[3]-9;
			console.log("regdateArr[3] = " + regdateArr[3]);
			
			var regdateTime = new Date(regdateArr[0], regdateArr[1]-1, regdateArr[2], regdateArr[3], regdateArr[4], regdateArr[5], 0).getTime();;
			regdateTime = regdateTime / 1000;
			var current = new Date();
			console.log("current = " + current);
			
			var currentTime = current.getTime();
			currentTime = currentTime/1000;
			console.log("currentTime = " + currentTime);
			console.log("regdate = " + regdate);
			console.log("regdateTime = " + regdateTime);

			var diff = currentTime - regdateTime;
			console.log("diff = " + diff);
			
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
		    $(".comic-time").append(prettifyDate);
		    
			
			
			
			
			
			
			
			
			$('img').each(function() {
			    if((typeof this.naturalWidth != "undefined" && this.naturalWidth == 0 ) || this.readyState == 'uninitialized' ) {
			    	$(this).hide();
			    }
			});
			
            var tno = ${boardVO.tno};
            var bno = ${boardVO.bno};
			var replyPage = 1;
			getThisPage("/sboard/"+tno+"/"+"1"+"/6", tno);
			
			
			getPage("/replies/"+bno+"/"+replyPage);
			getLikeList();
			subscribedList('${boardVO.uid}', '${login.uid}');
// 			$(".unsubscribeBtn").hide();
			
			

			
			//	Handlebars.registerHelper("prettifyDate", function(timeValue){
//			var dateObj = new Date(timeValue);
//			var year = dateObj.getFullYear();
//			var month = dateObj.getMonth() + 1;
//			var date = dateObj.getDate();
//			return year+"/"+month+"/"+date;
//	});
	
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		console.log("timeValue = " + timeValue);
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
			
			
			//로그인한 사용자가 작성한 본인의 댓글만 수정이 가능
			/* Handlebars.registerHelper("eqReplyer", function(replyer, block){ */
			Handlebars.registerHelper("eqUid", function(uid, block){
				var accum = '';
				if(uid == '${login.uid}'){
					accum += block.fn();
				}
				return accum;
			});
			
			var printData = function (replyArr, target, templateObject){
				var template = Handlebars.compile(templateObject.html());
				
				var html = template(replyArr);
				
				console.log("replyArr = " + replyArr);
				
				$(".replyLi").remove();
				target.after(html);
				
			}
		

			
/* 			var printPaging = function(pageMaker, target){
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
			} */
			
			var formObj = $("form[role='modifyForm']");

			console.log(formObj);
			
			
			$(".modifyPageBtn").on("click", function() {
				formObj.attr("action", "/sboard/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".removePageBtn").on("click", function() {
				
				var replyCnt = $("#replycntSmall").html();
				
				if(replyCnt > 0){
					
				}
			
				
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
				
				var deleteArr = [];
				var front;
				var end;
				var thumbnailSrc =  "${boardVO.boardFullName}"
				var dataSrc;
				var fileList = "${boardVO.fileList}";
				console.log("fileList = " + fileList);
		        var fileArray = fileList.split("<br>");

		        console.log("thumbnailSrc = " + thumbnailSrc);
			    deleteArr.push(thumbnailSrc);
		        
		        front = thumbnailSrc.substring(0, 12);
		        end = thumbnailSrc.substring(14);
		        dataSrc = front + end;
		        
		        console.log("thumbnail dataSrc = " + dataSrc);
		        deleteArr.push(dataSrc);
			        
			        
		        for(var i=0; i<fileArray.length-1; i++){
		        	
		        	var fileNameLength = fileArray[i].length - 2;
		        	console.log('fileArray[' + i + '] = ' + fileArray[i]);
		        	var value = fileArray[i].substring(10, fileNameLength);
		        	var dataSrc = fileArray[i].substring(32, fileNameLength);
		        	var fileName = fileArray[i].substring(81, fileNameLength);
		        	
		        	console.log('value = ' + value);
			        console.log('list dataSrc = ' + dataSrc);
			        console.log('fileName = ' + fileName);
			        front = dataSrc.substring(0, 12);
					end = dataSrc.substring(12);
					thumbnailSrc = front + "s_" + end;
					
			        
					deleteArr.push(thumbnailSrc);
					deleteArr.push(dataSrc);
		        }
		        
		        
		        
		        for(var i=0; i<deleteArr.length; i++){
			        console.log("deleteArr["+i+"] = " + deleteArr[i]);
		        }
				/* $(".uploadedList li").each(function(index){
					arr.push($(this).attr("data-src"));
				}); */
				
				if(deleteArr.length > 0){
					$.post("/deleteAllFiles",{files:deleteArr}, function(){
						
					});
				}
				
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
				
			});

				console.log("document.referrer = " +  document.referrer);			
				//console.log(strArray[3]);
			$("#listPageBtn").on("click", function() {
				formObj.attr("method", "get");
				var strArray=document.referrer.split('/');
				if(strArray[3] == 'mypage'){
					formObj.attr("action", "/mypage/titleList");				
				}else{
					formObj.attr("action", "/sboard/list");	
				}
				
				formObj.submit();
			});
			
			$("repliesDiv").on("click", function(){
				if($(".timeline li").size() > 1){
					return;
				}
				getPage("/replies/"+bno+"/1");
			});
			
			$(".pagination").on("click", "li a", function(event){
				event.preventDefault();
				replyPage = $(this).attr("href");
				getPage("/replies/"+bno+"/"+replyPage);
				
			});
			
			$("#replyAddBtn").on("click",function(){
			
				var uidObj = $("#newReplyUid");
				var unameObj = $("#newReplyUname");
				var replytextObj = $("#newReplyText");
				var uid = uidObj.val();
				var uname = unameObj.val();
				var replytext = replytextObj.val();
				
				$.ajax({
					type : 'post',
					url : '/replies/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({bno:bno, uid:uid, uname:uname, replytext:replytext}),
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
							replyPage=1;
							getPage("/replies/"+bno+"/"+replyPage);
							//uidObj.val("");
							//unameObj.val("");
							replytextObj.val("");
							
						}
					}
					});
					
				});
			
			
			
			
			
			/**************************************************************************************/
			/**************************************************************************************/
			/*                               	likeBtn start 	                                  */
			/**************************************************************************************/
			/**************************************************************************************/
			
			$("#likeAddBtn").on("click",function(){
				if('${login.uid}' == ""){
					alert("로그인이 필요합니다");
					location.href="/user/login";
				}else{
				var bno = ${boardVO.bno};
				var uid = '${login.uid}';
				var lpo = '1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/likes/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({bno:bno, uid:uid, lpo:lpo}),
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
							$("#likeAddBtn").hide();
							$("#likeDelBtn").show();
							$("#dislikeAddBtn").show();
							$("#dislikeDelBtn").hide();
							likeInfo();
						}
					}
					});
			}
			});
			
			$("#likeDelBtn").on("click", function(){
				if('${login.uid}' == ""){
					alert("로그인이 필요합니다");
					location.href="/user/login";
				}else{
				var bno = ${boardVO.bno};
				var uid = '${login.uid}';
				var lpo = '1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/likes/delete/',
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data : JSON.stringify({bno:bno, uid:uid, lpo:lpo}),
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							$("#likeAddBtn").show();
							$("#likeDelBtn").hide();
							$("#dislikeAddBtn").show();
							$("#dislikeDelBtn").hide();
							likeInfo();
						}
					}
					});	
				}
			});
			
			$("#dislikeAddBtn").on("click",function(){
				if('${login.uid}' == ""){
					alert("로그인이 필요합니다");
					location.href="/user/login";
				}else{
				var bno = ${boardVO.bno};
				var uid = '${login.uid}';
				var lpo = '-1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/likes/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({bno:bno, uid:uid, lpo:lpo}),
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
							$("#likeAddBtn").show();
							$("#likeDelBtn").hide();
							$("#dislikeAddBtn").hide();
							$("#dislikeDelBtn").show();
							likeInfo();
						}
					}
					});
				}
			});
			
			$("#dislikeDelBtn").on("click", function(){
				if('${login.uid}' == ""){
					alert("로그인이 필요합니다");
					location.href="/user/login";
				}else{
				var bno = ${boardVO.bno};
				var uid = '${login.uid}';
				var lpo = '-1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/likes/delete/',
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data : JSON.stringify({bno:bno, uid:uid, lpo:lpo}),
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							$("#likeAddBtn").show();
							$("#likeDelBtn").hide();
							$("#dislikeAddBtn").show();
							$("#dislikeDelBtn").hide();
							likeInfo();
						}
					}
					});
				}
			});
			
			
			
			
/* 	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/sboard/getAttach/"+bno, function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);
			$(".uploadedList").append(html);
		});
	}); */
	
	
	likeInfo();
	


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
		 	subscribeBtnClick('${boardVO.uid}', '${login.uid}');
		}
	});
	
	$(".unsubscribeBtn").on("click",function(){
		if('${login.uid}' == ""){
			alert("로그인이 필요합니다");
			location.href="/user/login";
		}else{
			unsubscribeBtnClick('${boardVO.uid}', '${login.uid}');
		}
	});

	
    function getLikeList(){
        console.log("getLikeList start");
        var bno = ${boardVO.bno};
        var uid = '${login.uid}';
        var str = "";
        $.ajax({
            type : 'post',
            url : '/likes/' + bno,
            headers : {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST" },
            dataType:'json',
            data : JSON.stringify({bno:bno, uid:uid}),
            success:function(result){
                console.log("getLikeList result.length : " + result.length);
                if(result.length == 0){
                    $("#likeAddBtn").show();
                    $("#likeDelBtn").hide();
                    $("#dislikeAddBtn").show();
                    $("#dislikeDelBtn").hide();
                    
                    /* 
                    $("#likeDelBtn").toggle();
                    $("#dislikeDelBtn").toggle();
                     */
                }else{
                    if(result[0].lpo == '1' ){
                        $("#likeAddBtn").hide();
                        $("#likeDelBtn").show();
                        $("#dislikeAddBtn").show();
                        $("#dislikeDelBtn").hide();
                    }
                    if(result[0].lpo == '-1' ){
                        $("#likeAddBtn").show();
                        $("#likeDelBtn").hide();
                        $("#dislikeAddBtn").hide();
                        $("#dislikeDelBtn").show();
                    }
                }
            }
        });
	}
    
    
    
	
    function getPage(pageInfo){
        console.log("pageInfo = " +pageInfo);
        $.getJSON(pageInfo,function(data){
            printData(data.list, $("#repliesDiv"), $('#template'));
            console.log("data.list.length = " + data.list.length);
            for(i=0; i<data.list.length; i++){
            	console.log("data.list[" + i + "].rno = " + data.list[i].rno);
            	//$(".repliesDiv").parents().css('background-color','red');
            	//console.log('Object.keys(data)', Object.keys(data));
            	var rno = data.list[i].rno;
            	//$(".replylikesDiv[data-rno="+rno+"]").css('background-color','red');

            	getReplyLikeList(rno, $(".replylikesDiv[data-rno="+rno+"]"));
            }
            //replylikeInfo(41, $(this));
            
            
            
            
            /**************************************************************************************/
			/**************************************************************************************/
			/*                               replylikeBtn start                                   */
			/**************************************************************************************/
			/**************************************************************************************/
			
			
			$(".replylikeAddBtn").on("click",function(){
				if('${login.uid}' == ""){
					alert("로그인이 필요합니다");
					location.href="/user/login";
				}else{
				console.log("replylikeAddBtn clicked");
				var rno = $(this).parent().parent().find('.modal-footer').attr('data-rno');
				console.log("rno = " + rno);
				var uid = '${login.uid}';
				var rlpo = '1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/replylikes/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({rno:rno, uid:uid, rlpo:rlpo}),
					async: false,
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
						}
					}
				});
				replylikeInfo(rno, $(this));
				$(this).parent().find("#replyLikeAddBtn").hide();
				$(this).parent().find("#replyLikeDelBtn").show();
				$(this).parent().find("#replyDislikeAddBtn").show();
				$(this).parent().find("#replyDislikeDelBtn").hide();
				}
			});
			
			$(".replylikeDelBtn").on("click", function(){
				if('${login.uid}' == ""){
					alert("로그인이 필요합니다");
					location.href="/user/login";
				}else{
				console.log("replylikeDelBtn clicked");
				var rno = $(this).parent().parent().find('.modal-footer').attr('data-rno');
				console.log("rno = " + rno);
				var uid = '${login.uid}';
				var rlpo = '1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/replylikes/delete/',
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data : JSON.stringify({rno:rno, uid:uid, rlpo:rlpo}),
					async: false,
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
						}
					}
				});
				replylikeInfo(rno, $(this));
				$(this).parent().find("#replyLikeAddBtn").show();
				$(this).parent().find("#replyLikeDelBtn").hide();
				$(this).parent().find("#replyDislikeAddBtn").show();
				$(this).parent().find("#replyDislikeDelBtn").hide();
				}
			});
			
			$(".replydislikeAddBtn").on("click",function(){
				if('${login.uid}' == ""){
					alert("로그인이 필요합니다");
					location.href="/user/login";
				}else{
				console.log("replydislikeAddBtn clicked");
				var rno = $(this).parent().parent().find('.modal-footer').attr('data-rno');
				console.log("rno = " + rno);
				var uid = '${login.uid}';
				var rlpo = '-1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/replylikes/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					data : JSON.stringify({rno:rno, uid:uid, rlpo:rlpo}),
					async: false,
					success:function(result){
						console.log("result:" + result);
						if(result=='SUCCESS'){
							alert("등록 되었습니다.");
						}
					}
				});
				replylikeInfo(rno, $(this));
				$(this).parent().find("#replyLikeAddBtn").show();
				$(this).parent().find("#replyLikeDelBtn").hide();
				$(this).parent().find("#replyDislikeAddBtn").hide();
				$(this).parent().find("#replyDislikeDelBtn").show();
				}
			});
			
			$(".replydislikeDelBtn").on("click", function(){
				if('${login.uid}' == ""){
					alert("로그인이 필요합니다");
					location.href="/user/login";
				}else{
				console.log("replydislikeDelBtn clicked");
				var rno = $(this).parent().parent().find('.modal-footer').attr('data-rno');
				console.log("rno = " + rno);
				var uid = '${login.uid}';
				var rlpo = '-1';
				console.log("uid = " + uid);
				$.ajax({
					type : 'post',
					url : '/replylikes/delete/',
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data : JSON.stringify({rno:rno, uid:uid, rlpo:rlpo}),
					async: false,
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
						}
					}
				});
				replylikeInfo(rno, $(this));
				$(this).parent().find("#replyLikeAddBtn").show();
				$(this).parent().find("#replyLikeDelBtn").hide();
				$(this).parent().find("#replyDislikeAddBtn").show();
				$(this).parent().find("#replyDislikeDelBtn").hide();
				}
			});
            
            
			$(".replyModBtn").on("click",function(){
				console.log("#replyModBtn clicked");

				var rno = $(this).parents().attr('data-rno');
				console.log("rno = " + rno);
		        $(this).parent().parent().find('#replytext').removeAttr("readonly").focus();
		        
				$(this).hide();
		        $(this).next().show();
			        
			});
			
			
			$(".replySubmitBtn").on("click",function(){
				console.log("#replySubmitBtn clicked");		
				
				var rno = $(this).parents().attr('data-rno');
				var replytext = $(this).parent().parent().find('#replytext').val();
				console.log("rno = " + rno);
				console.log("replytext = " + replytext);
				
				$.ajax({
					type : 'put',
					url : '/replies/'+rno,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT" },
					data : JSON.stringify({replytext:replytext}),
					dataType : 'text',
					success : function(result){
						console.log("result : " + result);
						if(result=='SUCCESS'){
							alert("수정 되었습니다.");
							$('#replytext').attr("readonly", "readonly");
					        $('#replyModBtn').show();
					        $('#replySubmitBtn').hide();
					        replyPage=1;
							getPage("/replies/"+bno+"/"+replyPage);
						}
					}
				});
				
				
			});
			
			$(".replyDelBtn").on("click", function(){

				var rno = $(this).parents().attr('data-rno');
				//var replytext = $(this).parent().parent().find('#replytext').val(); //사용안함
				console.log("rno = " + rno);
				$.ajax({
					type : 'delete',
					url : '/replies/'+rno,
					headers : {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "DELETE" },
					dataType:'text',
					success:function(result){
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							replyPage=1;
							getPage("/replies/"+bno+"/"+replyPage);
						}
					}
					});
				});
            
            
            //printPaging(data.pageMaker, $(".pagination"));
            
            $("#replycntSmall").html("Comment [ " + data.pageMaker.totalCount +" ]");
            
        });
				
	}

    function likeInfo(){
		var bno = ${boardVO.bno}
		var template_like = Handlebars.compile($('#like_template').html());
		var template_dislike = Handlebars.compile($('#dislike_template').html());
		$.getJSON("/likes/info/"+bno,function(data){
			$(data).each(function(){
				var html_like = template_like(data);
				var html_dislike = template_dislike(data);
				$("#likeLi").remove();
				$(".likesDiv").append(html_like);
				
				$("#dislikeLi").remove();
				$(".dislikesDiv").append(html_dislike);
			});
		});	
	}
    
    function replylikeInfo(rno, object){
    	
		console.log("replylikeInfo start");
		console.log("rno = " + rno);
		
		
		
		var template_like = Handlebars.compile($('#replylike_template').html());
		var template_dislike = Handlebars.compile($('#replydislike_template').html());
		$.getJSON("/replylikes/info/"+rno,function(data){
			$(data).each(function(){
				var html_like = template_like(data);
				var html_dislike = template_dislike(data);
				console.log("replylike_template html = " + html_like);
				console.log("replydislike_template html = " + html_dislike);
				
				//object.parent().parent().find("#replylikeLi").remove();
				object.parent().parent().find("#replylikeLi").remove();
				object.parent().children("#replyLikeDelBtn").after(html_like);
				
				//object.parent().parent().find("#replydislikeLi").remove();
				object.parent().parent().find("#replydislikeLi").remove();
				object.parent().children("#replyDislikeDelBtn").after(html_dislike);
				
				
			});
		});	
		
	}
    
    function getReplyLikeList(rno, object){
        console.log("getReplyLikeList start");
        console.log("rno = " + rno);
        var uid = '${login.uid}';
       	var result;
        $.ajax({
            type : 'post',
            url : '/replylikes/' + rno,
            headers : {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST" },
            dataType:'json',
            data : JSON.stringify({rno:rno, uid:uid}),
            success:function(result){
                console.log("getReplyLikeList result.length : " + result.length);
                if(result.length == 0){
                	object.parent().find("#replyLikeAddBtn").show();
                	object.parent().find("#replyLikeDelBtn").hide();
                	object.parent().find("#replyDislikeAddBtn").show();
                	object.parent().find("#replyDislikeDelBtn").hide();
                	
                    
                }else{
                    if(result[0].rlpo == '1' ){
                    	object.parent().find("#replyLikeAddBtn").hide();
                    	object.parent().find("#replyLikeDelBtn").show();
                    	object.parent().find("#replyDislikeAddBtn").show();
                    	object.parent().find("#replyDislikeDelBtn").hide();
                    }
                    if(result[0].rlpo == '-1' ){
                    	object.parent().find("#replyLikeAddBtn").show();
                    	object.parent().find("#replyLikeDelBtn").hide();
                    	object.parent().find("#replyDislikeAddBtn").hide();
                    	object.parent().find("#replyDislikeDelBtn").show();
                    }
                }
            }
        });
	}
    

    });
	</script>
	
	
	<script id="subtitle-template" type="text/x-handlebars-template">
		{{#each .}}
			<div class="subtitleLi">
					<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}' >
						<div class="comic-list"><img src="/displayFile?fileName={{boardFullName}}"></div>
						<div class="comic-list-text cursor">{{subtitle}} </div>
						<div class="comic-list-time"> {{prettifyDate regdate}} </div>
					</a>
			</div>
		{{/each}}
		<ul id="pagination" class="pagination do-not-close comic-list-pagi"></ul>
	</script>
	
	<script id="thissubtitle_template" type="text/x-handlebars-template">
		{{#each .}}
			<div class="thissubtitleLi">
					<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno={{bno}}' >
						<div class="comic-list"><img src="/displayFile?fileName={{boardFullName}}"></div>
						<div class="comic-list-text cursor">{{subtitle}} </div>
						<div class="comic-list-time"> {{prettifyDate regdate}} </div>
					</a>
			</div>
		{{/each}}
		<ul class="this-pagination do-not-close comic-list-pagi"></ul>
	</script>
	
	
	<script> //subtitle print
	function getThisSubtitle(tno, page){
		console.log("click getSubtitle start getPage");
		getThisPage("/sboard/"+tno+"/"+page+"/6", tno);
		return 1;
	};	
	
	function getThisPage(pageInfo, tno){
		console.log("start getSubtitlePage");
		$(".this-pagination").remove();
		$(".thissubtitleLi").remove();
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".readpage-toggle-page"), $('#thissubtitle_template'));
			thisPrintPaging(data.pageMaker, $(".this-pagination"), tno);
			console.log("start subtitlecntSmall");
// 			$(".thissubtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
		});
		
		
	}
	
	
	var thisPrintPaging = function(pageMaker, target, tno){
		console.log("start printPaging");
		var str = "";
		if(pageMaker.endPage != '1'){
			if(pageMaker.prev){
				str += //"<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>"
				'<li class="page-link do-not-close comic-list-prev" onclick="getThisSubtitle('+tno+','+(pageMaker.startPage-1)+');"> << </li>';
			}
			
			for(var i=pageMaker.startPage, len= pageMaker.endPage; i <= len; i++){
				var strClass = pageMaker.cri.page == i?'class=active':'';
				str += '<li class="page-item do-not-close comic-list-pagi" '+strClass+'><div class="comic-list do-not-close" onclick="getThisSubtitle('+tno+','+i+');">'+i+'</div></li>';
			}
			
			if(pageMaker.next){
				str += //"<li><div href='/sboard/" + tno + "/" + (pageMaker.endPage+1)+"'> >> </div></li>";
					'<li class="page-link do-not-close comic-list-next" onclick="getThisSubtitle('+tno+','+ (pageMaker.endPage+1) +');"> >> </li>';
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
	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="/resources/ThumbnailGridExpandingPreview/js/grid.js"></script>
		<script>
			$(function() {
				Grid.init();
			});
		</script> -->
	
	
	
	
	
</body>
</html>