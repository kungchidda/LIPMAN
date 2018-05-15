<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>${boardVO.title}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
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
						<span id="likeDelBtn" style="color:red;">♥</span>
						
						<span id="likeAddBtn"  style="color:red;">♡</span>
				</c:if>
					
				<c:if test="${empty login}">
					<div class="box-body">
						<div><a href="/user/login">Login Please</a></div>
					</div>
				</c:if>
					
			</div>
		</div>
	</div>
	

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
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
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
		
	</div>
	
	
	
	<div class="box-footer">
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
		<i class="fa fa-comments bg-blue"></i>
			<div class="timeline-item">
				<span class="time">
					<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
				</span>
				<h3 class="timeline-header"><strong>{{rno}}</strong> -{{uname}}</h3>
				<div class="timeline-body">{{replytext}}</div>
				<div class="timeline-footer">
					{{#eqUid uid}}
						<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
					{{/eqUid}}
				</div>
			</div>
		</li>
		{{/each}}
	</script>
	
	<script>
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
			//$(".replyLi").remove();
			target.after(html);
		}
	
		var bno = ${boardVO.bno};
		var replyPage = 1;
		
		function getPage(pageInfo){
			console.log("pageInfo = " +pageInfo);
			$.getJSON(pageInfo,function(data){
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.pageMaker, $(".pagination"));
				
				//$("#modifyModal").modal('hide');
				$("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]");
				
			});
			
		}
		getPage("/replies/"+bno+"/"+replyPage);
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
		
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);

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

			$("#listPageBtn").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/sboard/list");
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
			
			$(".timeline").on("click", ".replyLi", function(event){
				var reply = $(this);
				
				$("#replytext").val(reply.find('.timeline-body').text());
				$(".modal-title").html(reply.attr("data-rno"));
			});
			
			$("#replyModBtn").on("click",function(){
				
				var rno = $(".modal-title").html();
				var replytext = $("#replytext").val();
				
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
							$("#modifyModal").modal('hide');
							getPage("/replies/"+bno+"/"+replyPage);
						}
					}
				});
			});
			
			$("#replyDelBtn").on("click", function(){
			
				var rno = $(".modal-title").html();
				var replytext = $("#replytext").val();
				
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
							$("#modifyModal").modal('hide');
							getPage("/replies/"+bno+"/"+replyPage);
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
			
			
			
		});
	</script>

	<script>
	var bno = ${boardVO.bno};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/sboard/getAttach/"+bno, function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);
			$(".uploadedList").append(html);
		});
	});
	</script>
	
	<script>
	
	function getAllList() {
		var str = "";
		var data = "";
		$.getJSON("/replies/all/" + bno,	function(data) {
			console.log(data.length);
			$(data).each(function() {
				str += "<li data-rno='"+this.rno+"' class='replyLi'>"
				+ this.rno
				+ ":"
				+ this.replytext
				+ "<button>MOD</button></li>";
			});
			$("#replies").html(str);
		});
	}
	
	$("#likeAddBtn").on("click",function(){
		
		var uidObj = $("#newReplyUid");
		var uid = uidObj.val();
		
		$.ajax({
			type : 'post',
			url : '/likes/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST" },
			dataType : 'text',
			data : JSON.stringify({bno:bno, uid:uid}),
			success:function(result){
				console.log("result:" + result);
				if(result=='SUCCESS'){
					alert("등록 되었습니다.");
				}
			}
			});
			
		});

	$("#likeDelBtn").on("click", function(){
		
		//var lno = $(".modal-title").html();
		var uidObj = $("#newReplyUid");
		var uid = uidObj.val();
		
		console.log("this.lno = "+ this.lno);
		
		$.ajax({
			type : 'delete',
			url : '/likes/'+lno,
			headers : {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "DELETE" },
			dataType:'text',
			success:function(result){
				console.log("result : " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
					$("#modifyModal").modal('hide');
				}
			}
			});
		});
	</script>
	
	
	



	<%@ include file="/WEB-INF/views/include/footer.html"%>

</body>
</html>