<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>MANIFUL</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
#fileDrop {
/* 	width : 100%; */
/* 	height : 400px; */
/* 	border : 1px dotted blue; */
	width : 400px;
}
#registerForm{
	content-align : center; 
	text-align : center;
}
small {
	margin-left : 3px;
	font-weight : bold;
	color : gray;
}
</style>

	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
	
	<link href="/resources/css/register.css" rel="stylesheet">
</head>
<body>

	<form id="registerForm" role="form" action="/title/register" method="post">
		<div class="og-fullimg" id="fileDrop">
			<div class="uploadedList">
				<img src="/resources/png/number-00.png" style="display: inline;">
			</div>
		</div>
		<div class="form-group">
<!-- 		    <button class="btn" id="upload-button">Select image</button> -->
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
				    <input type="text" name='title' class="form-control" placeholder="Comic Title">
				</div>
				<input type="checkbox" name='genreArr' class="genreInput" value='1'>SF
				<input type="checkbox" name='genreArr' class="genreInput" value='2'>Mystery
				<input type="checkbox" name='genreArr' class="genreInput" value='3'>PureLove
				<input type="checkbox" name='genreArr' class="genreInput" value='4'>Romance
		                        
				<div class="comic-upload-submit">
					<button type="submit" class="btn btn-primary">Write</button>
				</div>
		</div>
			
	

	</form>

	
	<script type="text/javascript" src="/resources/js/upload.js"></script>
<!-- 	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> -->
	<script src="/resources/js/handlebars.js"></script>
	
	<script id="template" type="text/x-handlebars-template">
		<div class="uploadedList">
			<img src="{{imgsrc}}" style="width:400px;" alt="Attachment">
		<div class="mailbox-attachment-info" style="width:200px;">
				<a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a>
				<small data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
					<i class="fa fa-fw fa-remove"></i>
				</small>
		</div>
		</div>
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
	</script>

</body>
</html>