<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>MANIFUL</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
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

<!-- <!-- WYSIWYG summernote -->
<!-- 	<!-- include libraries(jQuery, bootstrap) -->
<!-- 	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- <!-- 	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
<!-- 	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->


<!-- <!-- include summernote css/js -->
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script> -->

<!-- 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>

</head>
<body>

	<form id="registerForm" role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label> <input type="text" name='title' class="form-control" placeholder="Enter Title">
				<label for="exampleInputEmail1">Subtitle</label> <input type="text" name='subtitle' class="form-control" placeholder="Enter Title">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Writer</label>
				<!-- <Input type="text" name="writer" class="form-control" placeholder="Enter Writer"> -->
				<Input type="hidden" name="uid" class="form-control" value='${login.uid}'>
				<Input type="text" name="uname" class="form-control" value='${login.uname}' readonly>
			</div>
			<div class="form-group">
				<!-- <label for="exampleInputPasswooord1">Content</label> -->
				<!-- <textarea class="form-control" name="content" rows="3" placeholder="Enter ..."></textarea> -->
				<!-- WYSIWYG -->
				<textarea id="summernote" name="content"></textarea>
				<div id="summernote"></div>
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
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" style="width:200px;" alt="Attachment"></span>
			<div class="mailbox-attachment-info" style="width:200px;">
				<a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a>
				<small data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
					<i class="fa fa-fw fa-remove"></i></small>
			</span>
			<div>
		</li>
	</script>
	
	<%-- <%@ include file="/WEB-INF/views/include/footer.html"%> --%>

	<!-- WYSIWYG -->
	<!-- <div id="summernote"></div> -->
		<script>
		$(document).ready(function() {
			  $('#summernote').summernote({
				  //placeholder: 'Content',
				  minHeight: null,             // set minimum height of editor
				  maxHeight: null,             // set maximum height of editor
				  focus: true,      
				  height: 300,
				  toolbar: [
					    // [groupName, [list of button]]
					    ['style', ['bold', 'italic', 'underline', 'clear']],
					    ['font', ['strikethrough', 'superscript', 'subscript']],
					    ['fontsize', ['fontsize']],
					    ['color', ['color']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
					    ['table', ['table']],
					    ['insert', ['link', 'picture', 'hr']],
					    ['view', ['fullscreen', 'codeview']],
					    ['help', ['help']]
					  ],
			       popover: {
			         image: [],
			         link: [],
			         air: []
			       },
			       callbacks: {
			       onImageUpload : function(files, editor, $editable) {
			    	   //console.log('image upload:', files);
			    	   sendFile(files, $(this), $editable);
			        }
			       }
			  });
			  function sendFile(files, editor, welEditable) {
				  formData = new FormData();
				  formData.append("file", files);
				  for(i=0; i<files.length; i++){
			        	var file = files[i];
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
			
			
			});
	</script>

	
	
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