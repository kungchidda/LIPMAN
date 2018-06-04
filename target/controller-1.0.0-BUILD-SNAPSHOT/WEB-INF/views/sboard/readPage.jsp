<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>${boardVO.title}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<style type="text/css">
	.popup {position : absolute;}
	.back {background-color : gray; opacity : 0.5; width : 100%; height : 300%; overflow : hidden; z-index:1101;}
	.front {z-index : 1110; opacity : 1; boarder : 1px; margin : auto;}
	.show {position : relative; max-width : 1200px; max-height : 800; overflow : auto;}
</style>

</head>
<body>
	
	<form role="form" action="modifyPage" method="post">
		<input type='hidden' name='bno' value="${boardVO.bno}">
		<!-- <input type='hidden' name='page' value="${cri.page}"> --> <!-- 무한스크롤 적용을 위한 주석처리 무조건 1페이지로 이동 -->
		<!-- <input type='hidden' name='perPageNum' value="${cri.perPageNum}"> --> <!-- 무한스크롤 적용을 위한 주석처리 무조건 1페이지로 이동 -->
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">
	</form>
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> <input type="text" name='title' class="form-control" value="${boardVO.title}" readonly="readonly">
			<label for="exampleInputEmail1">Subtitle</label> <input type="text" name='subtitle' class="form-control" value="${boardVO.subtitle}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label> <input type="text" name="uname" class="form-control" value="${boardVO.uname}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<hr>
			${boardVO.content}
			<hr>
		</div>
	</div>
	<!-- <div class='popup back' style="display:none;"></div> -->
	<!-- <div id="popup_front" class='popup front' style="display:none;"> -->
		<!-- <img id="popup_img"> -->
	<!-- </div> -->
	<ul class="mailbox-attachments clearfix uploadedList"></ul>
	<script id="templateAttach" type="text/x-handlebars-template">
		<li data-src='{{fullName}}'>
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
				<div class="mailbox-attachment-info">
				<a href="{{getLink}}" class="mailbox-attachment-name" target="_blank">{{fileName}}</a>
			</span>
			</div>
		</li>
	</script>

	<div class="row">
		<div class="col-md-12">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				
				<c:if test="${not empty login}">
					<div class="box-body">
						<label for="exampleInputEmail1">Writer</label>
						<input type="hidden" id="newReplyUid" value="${login.uid}" readonly="readonly">
						<input class="form-control" type="text" placeholder="USER ID" id="newReplyUname" value="${login.uname}" readonly="readonly">
						<label for="exampleInputEmail1">Reply Text</label>
						<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
					</div>
					
					
					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
						<!-- <button type="submit" id="replyAddBtn">ADD REPLY</button> -->
					</div>
				</c:if>
				<div class="likesDiv">
					<i class='fa fa-thumbs-up' style='color:gray;' id='likeAddBtn'></i>
					<i class='fa fa-thumbs-up' style='color:red;' id='likeDelBtn'></i>
					<i class='fa fa-thumbs-down' style='color:gray;' id='unlikeAddBtn'></i>
					<i class='fa fa-thumbs-down' style='color:red;' id='unlikeDelBtn'></i>
				</div>
					
				<c:if test="${empty login}">
					<div class="box-body">
						<div><a href="/user/login">Login Please</a></div>
					</div>
				</c:if>
					
			</div>
		</div>
	</div>
	
	<%-- <div><i class="fa fa-thumbs-up" style="color:red;"></i> : ${boardVO.likecnt} / <i class="fa fa-thumbs-down"></i> : ${boardVO.likecnt}</div> --%>
	<!-- The time line -->
	<ul class="timeline">
		<!-- timeline time label -->
		<li class="time-label" id="repliesDiv">
			<span class="bg-green">Replies List <small id='replycntSmall'> [ ${boardVO.replycnt} ]</small></span>
		</li>
	</ul>
	<div class='text-center'>
		<ul id="pagination" class="pagination justify-content-center"></ul>
	</div>
	
	<!-- Modal -->
	<!-- <div id="modifyModal" class="" role="dialog">
		<div class="modal-dialog">
			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p><input type="text" id="replytext" class="form-control"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		
	</div> -->
	
	
	<div class="box-footer">
	<button type="submit" class="btn" id="subscribeBtn">SUBSCRIBE</button>
	<button type="submit" class="btn btn-danger" id="unsubscribeBtn">SUBSCRIBED</button>
		<c:if test="${login.uid == boardVO.uid}">
			<button type="submit" class="btn btn-warning" id="modifyPageBtn">Modify</button>
			<button type="submit" class="btn btn-danger" id="removePageBtn">REMOVE</button>
		</c:if>
			<button type="submit" class="btn btn-primary" id="listPageBtn">LIST ALL</button>
	</div>
	<!-- /.box-body -->

	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<li class="replyLi" data-rno={{rno}}>
			<div class="timeline-item">

					<div id="modifyModal" class="" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">{{rno}}</h4>
									<span class="time">
										<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
									</span>
								</div>
								<div class="modal-body">
									<p><input type="text" id="replytext" class="form-control" value="{{replytext}}" readonly="readonly"></p>
								</div>
								<div class="modal-footer" data-rno={{rno}}>
					{{#eqUid uid}}
									<button type="button" class="btn btn-info replyModBtn" data-target="#modifyModal">Modify</button>
									<button type="button" class="btn btn-info replySubmitBtn" style="display:none">SUBMIT</button>
									<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
									<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
					{{/eqUid}}
								</div>
								<div class="replylikesDiv" data-rno={{rno}}>
									<i class="fa fa-thumbs-up replylikeAddBtn" style="color:gray;" id="replyLikeAddBtn"></i>
									<i class="fa fa-thumbs-up replylikeDelBtn" style="color:red;" id="replyLikeDelBtn"></i>
									<i class="fa fa-thumbs-down replydislikeAddBtn" style="color:gray;" id="replyDislikeAddBtn"></i>
									<i class="fa fa-thumbs-down replydislikeDelBtn" style="color:red;" id="replyDislikeDelBtn"></i>
								</div>
								<div id="replylikeLi">
									{{replylikecnt}} / {{replydislikecnt}}
								</div>
							</div>
						</div>
					</div>





				
			</div>
		</li>
		{{/each}}
	</script>
	
	<script id="like_template" type="text/x-handlebars-template">
		{{#each .}}
			<div id="likeLi">
				{{likecnt}} / {{unlikecnt}}
			</div>
		{{/each}}
	</script>
	
	<script id="replylike_template" type="text/x-handlebars-template">
		{{#each .}}
			<div id="replylikeLi">
				{{replylikecnt}} / {{replydislikecnt}}
			</div>
		{{/each}}
	</script>
	
	<script>
		
		$(document).ready(function() {
			
            var bno = ${boardVO.bno};
			var replyPage = 1;
			
			getPage("/replies/"+bno+"/"+replyPage);
			getLikeList();
			subscribedList();
			$("#unsubscribeBtn").hide();
			
			

			
			Handlebars.registerHelper("prettifyDate", function(timeValue){
				var dateObj = new Date(timeValue);
				var year = dateObj.getFullYear();
				var month = dateObj.getMonth() + 1;
				var date = dateObj.getDate();
				return year+"/"+month+"/"+date;
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
			
			var formObj = $("form[role='form']");

			//console.log(formObj);
			
			
			$("#modifyPageBtn").on("click", function() {
				formObj.attr("action", "/sboard/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$("#removePageBtn").on("click", function() {
				
				var replyCnt = $("#replycntSmall").html();
				
				if(replyCnt > 0){
					
				}
			
				
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
				
				var arr = []
				$(".uploadedList li").each(function(index){
					arr.push($(this).attr("data-src"));
				});
				
				if(arr.length > 0){
					$.post("/deleteAllFiles",{files:arr}, function(){
						
					});
				}
				
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
				
			});

				console.log(" document.referrer = " +  document.referrer);			
				var strArray=document.referrer.split('/');
				console.log(strArray[3]);
			$("#listPageBtn").on("click", function() {
				formObj.attr("method", "get");
				if(strArray[3] == 'mypage'){
					formObj.attr("action", "/mypage/home");				
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
			
			
			
			/* 
				//이미지 팝업 삭제
				$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
				var fileLink = $(this).attr("href");
				
				if(checkImageType(fileLink)){
					event.preventDefault();
					
					var imgTag = $("#popup_img");
					imgTag.attr("src", fileLink);
					
					console.log(imgTag.attr("src"));
					
					$(".popup").show('slow');
					imgTag.addClass("show");
				}
			}); */
			
			/* $("#popup_img").on("click", function(){
				$(".popup").hide('slow');
			}); */
			
			
			/**************************************************************************************/
			/**************************************************************************************/
			/*                               	likeBtn start 	                                  */
			/**************************************************************************************/
			/**************************************************************************************/
			
			$("#likeAddBtn").on("click",function(){
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
							$("#unlikeAddBtn").show();
							$("#unlikeDelBtn").hide();
							likeInfo();
						}
					}
					});
			});
			
			$("#likeDelBtn").on("click", function(){
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
							$("#unlikeAddBtn").show();
							$("#unlikeDelBtn").hide();
							likeInfo();
						}
					}
					});	
			});
			
			$("#unlikeAddBtn").on("click",function(){
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
							$("#unlikeAddBtn").hide();
							$("#unlikeDelBtn").show();
							likeInfo();
						}
					}
					});
			});
			
			$("#unlikeDelBtn").on("click", function(){
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
							$("#unlikeAddBtn").show();
							$("#unlikeDelBtn").hide();
							likeInfo();
						}
					}
					});
			});
			
			
			
			
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/sboard/getAttach/"+bno, function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);
			$(".uploadedList").append(html);
		});
	});
	
	
	likeInfo();
	


    /**************************************************************************************/
	/**************************************************************************************/
	/*                               subscribeBtn start                                   */
	/**************************************************************************************/
	/**************************************************************************************/
	
	$("#subscribeBtn").on("click",function(){
		console.log("subscribeBtn start");
		var subscribed = '${boardVO.uid}';
		var subscriber = '${login.uid}';
		$.ajax({
			type : 'post',
			url : '/subscribes/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST" },
			dataType : 'text',
			data : JSON.stringify({subscribed : subscribed, subscriber : subscriber}),
			success:function(result){
				console.log("result:" + result);
				if(result=='SUCCESS'){
					alert("등록 되었습니다.");
					$("#subscribeBtn").toggle();
					$("#unsubscribeBtn").toggle();
				}
			}
			});
	});
	
	$("#unsubscribeBtn").on("click",function(){
		console.log("unsubscribeBtn start");
		var subscribed = '${boardVO.uid}';
		var subscriber = '${login.uid}';
		$.ajax({
			type : 'post',
			url : '/subscribes/delete',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST" },
			dataType : 'text',
			data : JSON.stringify({subscribed : subscribed, subscriber : subscriber}),
			success:function(result){
				console.log("result:" + result);
				if(result=='SUCCESS'){
					alert("삭제 되었습니다.");
					$("#subscribeBtn").toggle();
					$("#unsubscribeBtn").toggle();
				}
			}
			});
		
		
	});

    function subscribedList(){
				console.log("subscribedList start");
				var subscribed = '${boardVO.uid}';
				var subscriber = '${login.uid}';
				$.ajax({
					type : 'post',
					url : '/subscribes/subscribeList',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'json',
					data : JSON.stringify({subscribed : subscribed, subscriber : subscriber}),
					success:function(result){
						console.log("subscribeList result.length : " + result.length);
						if(result.length != 0){
							alert("조회 되었습니다.");
							$("#subscribeBtn").toggle();
							$("#unsubscribeBtn").toggle();
						}
					}
				});
	}
	
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
                    $("#unlikeAddBtn").show();
                    $("#unlikeDelBtn").hide();
                    
                    /* 
                    $("#likeDelBtn").toggle();
                    $("#unlikeDelBtn").toggle();
                     */
                }else{
                    if(result[0].lpo == '1' ){
                        $("#likeAddBtn").hide();
                        $("#likeDelBtn").show();
                        $("#unlikeAddBtn").show();
                        $("#unlikeDelBtn").hide();
                    }
                    if(result[0].lpo == '-1' ){
                        $("#likeAddBtn").show();
                        $("#likeDelBtn").hide();
                        $("#unlikeAddBtn").hide();
                        $("#unlikeDelBtn").show();
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
				console.log("replylikeAddBtn clicked");
				//var bno = ${boardVO.bno};
				//var rno = 23;
				var rno = $(this).parent().parent().find('.modal-footer').attr('data-rno');
				//$(this).parent().parent().css('background-color', 'red');
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
							//$(this).parent().find("#replylikeAddBtn").hide();
							//$("#replylikeDelBtn").show();
							//$("#replydislikeAddBtn").show();
							//$("#replydislikeDelBtn").hide();
							//likeInfo();
						}
					}
				});
				replylikeInfo(rno, $(this));
				//$(this).parent().css('background-color', 'red');
				$(this).parent().find("#replyLikeAddBtn").hide();
				$(this).parent().find("#replyLikeDelBtn").show();
				$(this).parent().find("#replyDislikeAddBtn").show();
				$(this).parent().find("#replyDislikeDelBtn").hide();
			});
			
			$(".replylikeDelBtn").on("click", function(){
				console.log("replylikeDelBtn clicked");
				//var bno = ${boardVO.bno};
				//var rno = 23;
				//var rno = $(".modal-title").html();
				//var rno = $(this).parents().attr('data-rno');
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
// 							$("#replylikeAddBtn").show();
// 							$("#replylikeDelBtn").hide();
// 							$("#replydislikeAddBtn").show();
// 							$("#replydislikeDelBtn").hide();
							//likeInfo();
						}
					}
				});
				replylikeInfo(rno, $(this));
				//$(this).parent().css('background-color', 'red');
				$(this).parent().find("#replyLikeAddBtn").show();
				$(this).parent().find("#replyLikeDelBtn").hide();
				$(this).parent().find("#replyDislikeAddBtn").show();
				$(this).parent().find("#replyDislikeDelBtn").hide();
			});
			
			$(".replydislikeAddBtn").on("click",function(){
				console.log("replydislikeAddBtn clicked");
				//var bno = ${boardVO.bno};
				//var rno = 23;
				//var rno = $(".modal-title").html();
				//var rno = $(this).parents().attr('data-rno');
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
// 							$("#replylikeAddBtn").show();
// 							$("#replylikeDelBtn").hide();
// 							$("#replydislikeAddBtn").hide();
// 							$("#replydislikeDelBtn").show();
// 							likeInfo();
						}
					}
				});
				replylikeInfo(rno, $(this));
				//$(this).parent().css('background-color', 'red');
				$(this).parent().find("#replyLikeAddBtn").show();
				$(this).parent().find("#replyLikeDelBtn").hide();
				$(this).parent().find("#replyDislikeAddBtn").hide();
				$(this).parent().find("#replyDislikeDelBtn").show();
			});
			
			$(".replydislikeDelBtn").on("click", function(){
				console.log("replydislikeDelBtn clicked");
				//var bno = ${boardVO.bno};
				//var rno = 23;
				//var rno = $(".modal-title").html();
				//var rno = $(this).parents().attr('data-rno');
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
// 							$("#replylikeAddBtn").show();
// 							$("#replylikeDelBtn").hide();
// 							$("#replydislikeAddBtn").show();
// 							$("#replydislikeDelBtn").hide();
// 							likeInfo();
						}
					}
				});
				replylikeInfo(rno, $(this));
				//$(this).parent().css('background-color', 'red');
				$(this).parent().find("#replyLikeAddBtn").show();
				$(this).parent().find("#replyLikeDelBtn").hide();
				$(this).parent().find("#replyDislikeAddBtn").show();
				$(this).parent().find("#replyDislikeDelBtn").hide();
			});
            
            
			/* $(".timeline").on("click", ".replyLi", function(event){ */
			
			/* $("#replyModBtn").on("click", ".replyLi", function(event){ */
			$(".replyModBtn").on("click",function(){
				console.log("#replyModBtn clicked");

				var rno = $(this).parents().attr('data-rno');
				console.log("rno = " + rno);
		        $(this).parent().parent().find('#replytext').removeAttr("readonly");
		        
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
							/* $("#modifyModal").modal('hide'); */
							$('#replytext').attr("readonly", "readonly");
					        $('#replyModBtn').show();
					        $('#replySubmitBtn').hide();
					        replyPage=1;
							getPage("/replies/"+bno+"/"+replyPage);
						}
					}
				});
				
				
			});
			
			$("#replyDelBtn").on("click", function(){

				//var rno = $(".modal-title").html();
				var rno = $(this).parents().attr('data-rno');
				//var replytext = $("#replytext").val();
				var replytext = $(this).parent().parent().find('#replytext').val(); //사용안함
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
							/* $("#modifyModal").modal('hide'); */
							replyPage=1;
							getPage("/replies/"+bno+"/"+replyPage);
						}
					}
					});
				});
            
            
            printPaging(data.pageMaker, $(".pagination"));
            
            //$("#modifyModal").modal('hide');
            $("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]");
            
        });
				
	}

    function likeInfo(){
		var bno = ${boardVO.bno}
		var template = Handlebars.compile($('#like_template').html());
		$.getJSON("/likes/info/"+bno,function(data){
			$(data).each(function(){
				var html = template(data);
				$("#likeLi").remove();
				$(".likesDiv").append(html);
			});
		});	
	}
    
    function replylikeInfo(rno, object){
    	
		console.log("replylikeInfo start");
		console.log("rno = " + rno);
		
		var template = Handlebars.compile($('#replylike_template').html());
		
		$.getJSON("/replylikes/info/"+rno,function(data){
			$(data).each(function(){
				var html = template(data);
				console.log("html = " + html);
				object.parent().parent().find("#replylikeLi").remove();//일단 되긴 함
				//object.parent().find("#replylikeLi").remove();
				//object.parents().find("#replylikeLi").css('background', 'red');
				//console.log("replylikeLi remove");
				//object.parent().css('background', 'red');
				object.parent().append(html); //일단 되긴 함
				//object.parents("div").css('background-color', 'red');
				
			});
		});	
	}
    
    function getReplyLikeList(rno, object){
        console.log("getReplyLikeList start");
        console.log("rno = " + rno);
        //var bno = ${boardVO.bno};
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
	
	
	



	<%-- <%@ include file="/WEB-INF/views/include/footer.html"%> --%>

</body>
</html>