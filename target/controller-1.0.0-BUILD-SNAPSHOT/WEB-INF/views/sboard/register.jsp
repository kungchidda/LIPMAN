<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.fileDrop {
	width : 100%;
	height : 220px;
	border : 1px dotted blue;
}

small {
	margin-left : 3px;
	font-weight : bold;
	color : gray;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.html"%>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<form id="registerForm" role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label> <input type="text" name='title' class="form-control" placeholder="Enter Title">
			</div>
			<div class="form-group">
				<label for="exampleInputPasswooord1">Content</label>
				<textarea class="form-control" name="content" rows="3" placeholder="Enter ..."></textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Writer</label>
				<Input type="text" name="writer" class="form-control" placeholder="Enter Writer">
			</div>
			<div class="form-group">
			
				<label for="exampleInputEmail1">File Upload or DROP Here</label>
			</div>
			<div class="form-group">
				<input type="file" id="upload" multiple>
				<div class="fileDrop">
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
				</div>
			</div>
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			
			
			<button type="submit" class="btn btn-primary">Submit</button>
	
		</div>
	</form>

	
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	<script id="template" type="text/x-handlebars-template">
		<li>
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
			<div class="mailbox-attachment-info">
				<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
				<small data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
					<i class="fa fa-fw fa-remove"></i></small>
			</span>
			<div>
		</li>
	</script>
	
	<%@ include file="/WEB-INF/views/include/footer.html"%>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	<script>
		var template = Handlebars.compile($("#template").html());
		
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;
			
			for(i=0; i<files.length; i++){
	        	var file = files[i]
				uploadFile(file);	
	        }
			
		});
		
	    $("#upload").on("change", function(event) {
	        
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

			$(".uploadedList .delbtn").each(function(index){
				console.log(index);
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src") +"'> ";
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
					$(".uploadedList").append(html);
				}
			});
	    }
	</script>

</body>
</html>