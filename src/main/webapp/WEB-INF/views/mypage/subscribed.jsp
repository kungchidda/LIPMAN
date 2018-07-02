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

<!-- <link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/default.css" /> -->
<link rel="stylesheet" type="text/css" href="/resources/ThumbnailGridExpandingPreview/css/component.css" />
<script src="/resources/ThumbnailGridExpandingPreview/js/modernizr.custom.js"></script>

<!-- <link rel="stylesheet" type="text/css" href="/resources/css/banner/banner.css" /> -->

 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>



 <!--icon-->
    <div class="profile-icon">
        <div class="profile-icon-home">
            <a href="/mypage/home">
<!--             <div id="profile-home-div"> -->
            <img src="/resources/png/comic.png" id="profile-img-home">
            </a>
<!--             </div> -->
        </div>
        <div class="profile-icon-subscribed">
            <a href="/mypage/subscribed"  class="active">
<!--             <div id="profile-subscribed-div" class="active"> -->
            <img src="/resources/png/subscribe.png" id="profile-img-subscribed">
            </a>
<!--             </div> -->
        </div>
        <div class="profile-icon-subscriber">
            <a href="/mypage/subscriber">
<!--             <div id="profile-subscriber-div"> -->
            <img src="/resources/png/subscribed.png" id="profile-img-subscriber">
            </a>
<!--             </div> -->
        </div>
        <div class="profile-icon-setting">
            <a href="/mypage/setting">
<!--             <div id="profile-setting-div"> -->
            <img src="/resources/png/setting.png" id="profile-img-setting">
            </a>
<!--             </div> -->
        </div>
    </div>
    


	
	<section id="mypage-subscribed">
		<div class="container">
					<ul id="og-grid" class="og-grid cards">
					<c:forEach items="${subscribedList}" var="MyPageVO">
						<li>
									<a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${MyPageVO.bno}" data-largesrc="/displayFile?fileName=${MyPageVO.titleFullName}" data-title="${MyPageVO.title}"
									 onclick="getSubtitle(${MyPageVO.tno});">
									<img class="thumbnail" src="/displayFile?fileName=${MyPageVO.titleFullName}" />
									<div class="title">
										${MyPageVO.title}
									</div>
									 <div class="subtitle">
									 	${MyPageVO.subtitle}
									 </div>
									<div class="line"><img src="/resources/svg/line.svg"></div>
									<div class="thumbnail-thumb">
										<img src="/resources/png/pencil.png"><span>${MyPageVO.titlelikecnt}</span>
										<img src="/resources/png/eraser.png"><span>${MyPageVO.titledislikecnt}</span>
									</div>
									<div class="line"><img src="/resources/svg/line.svg"></div>
									<div class="thumbnail-writer">
						                <img src="/resources/png/account.png">
						                <span>${MyPageVO.uname}</span>
						            </div>
									</a>
									
								
								
								
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!-- 	<script src="/resources/ThumbnailGridExpandingPreview/js/mypage_grid.js"></script> -->
	<script src="/resources/ThumbnailGridExpandingPreview/js/grid.js"></script>
		<script>
 			$(function() {
				Grid.init();
//  				GridMypage.init();
			});
		</script>
	<!-- /.container -->

	
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
// 		target.after(html);
		target.append(html);
	}
		
		
	function getPage(pageInfo, tno){
		console.log("start getPage");
		
		
		//$(".pagination").remove();
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
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".og-expander-inner"), $('#subtitle-template'));
			printPaging(data.pageMaker, $(".pagination"));
// 			console.log("start subtitlecntSmall");
// 			$(".subtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
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

/* 		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);
			
			
		}); */
	</script>
	
	<script>
		$(document).ready(function(){
// 			$('#profile-img-subscribed').click();
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
	
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<script id="profile-template" type="text/x-handlebars-template">
			<dis class="uploadedList">
				<img src="{{imgsrc}}" style="width:200px;" alt="Attachment">
			</div>
			<!-- <div class="mailbox-attachment-info" style="width:200px;">
				<a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a>
				<small data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
					<i class="fa fa-fw fa-remove"></i>
				</small>
			</div> -->
	</script>
	
	<script>
	function sendFile(files, editor, welEditable) {
	    formData = new FormData();
	    formData.append("file", files);
	    for (i = 0; i < files.length; i++) {
	        var file = files[i];
	        var formData = new FormData();
	
	        formData.append("file", file);
	        $.ajax({
	            url: '/uploadAjax',
	            data: formData,
	            dataType: 'text',
	            processData: false,
	            contentType: false,
	            type: 'POST',
	            success: function (data) {
	                var fileInfo = getFileInfo(data);
	                var html = template(fileInfo);
	                console.log(data);
	                console.log(fileInfo);
	                console.log(html);
	                $(".uploadedList").append(html);
	                editor.summernote('editor.insertImage', fileInfo.getLink);
	                //editor.insertImage(welEditable, data.url);
	            }
	        });
	    }
	}
	 var template = Handlebars.compile($("#profile-template").html());

     $(".fileDrop").on("dragenter dragover", function (event) {
         event.preventDefault();
     });

     $(".fileDrop").on("drop", function (event) {
         event.preventDefault();

         var files = event.originalEvent.dataTransfer.files;

         for (i = 0; i < files.length; i++) {
             var file = files[i]
             uploadFile(file);
         }

     });

     //$("#upload").on("change", function (event) {
    $("#profile").on("change", function (event) {
         event.preventDefault();

         var files = event.target.files
         for (i = 0; i < files.length; i++) {
             var file = event.target.files[i]
             uploadFile(file);
         }
     });

     $("#registerForm").submit(function (event) {
         event.preventDefault();

         var that = $(this);

         var str = "";

         $(".uploadedList .delbtn").each(function (index) {
             console.log(index);
             str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("data-src") + "'> ";
         });
         that.append(str);

         that.get(0).submit();

     });

     $(".uploadedList").on("click", "small", function (event) {

         var that = $(this);

         $.ajax({
             url: "deleteFile",
             type: "post",
             data: { fileName: $(this).attr("data-src") },
             dataType: "text",
             success: function (result) {
                 if (result == 'deleted') {
                     //alert("deleted");
                     that.parents().parent("li").remove();
                 }
             }
         });
     });



     function uploadFile(file) {
         var formData = new FormData();

         formData.append("file", file);
         $.ajax({
             url: '/uploadAjax',
             data: formData,
             dataType: 'text',
             processData: false,
             contentType: false,
             type: 'POST',
             success: function (data) {
                 var fileInfo = getFileInfo(data);
                 var html = template(fileInfo);
                 console.log("html = " + html);
                 $(".uploadedList").remove();
                 $(".profile-image").append(html);
             }
         });
     }
	
	</script>	
	


</body>
</html>