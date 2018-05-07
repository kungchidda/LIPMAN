<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>${boardVO.title}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<style>
.fileDrop {
	width : 100%;
	height : 200px;
	border : 1px dotted blue;
}

small {
	margin-left : 3px;
	font-weight : bold;
	color : gray;
}
.popup {
	position : absolute;
}
.back {
	background-color : gray;
	opacity : 0.5;
	width : 100%;
	height : 300%;
	overflow : hidden;
	z-index:1101;
}
.front {
	z-index : 1110;
	opacity : 1;
	boarder : 1px;
	margin : auto;
}
.show {
	position : relative;
	max-width : 1200px;
	max-height : 800;
	overflow : auto;
}

</style>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

</head>
<body>
	
	
	<form id="modifyForm" role="form" action="modifyPage" method="post">
		<input type='hidden' name='page' value="${cri.page}">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">BNO</label>
				<input type="text" name='bno' class="form-control" value="${boardVO.bno}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label>
				<input type="text" name='title' class="form-control" value="${boardVO.title}">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Writer</label>
				<input type="text" name="writer" class="form-control" value="${boardVO.writer}">
			</div>
			<div class="form-group">
				<!-- <label for="exampleInputPassword1">Content</label> -->
				<!-- <textarea class="form-control" name="content" rows="3">${boardVO.content}</textarea>  -->
				<!-- WYSIWYG -->
				<textarea id="summernote" name="content">${boardVO.content}</textarea>
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
			<div>
				<hr>
			</div>
			
			<script id="template" type="text/x-handlebars-template">
			<li data-src='{{fullName}}'>
				<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
					<div class="mailbox-attachment-info">
						<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
						<small data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
						<i class="fa fa-fw fa-remove"></i></small>
				</span>
					</div>
			</li>
	</script>
	
		</div>
	</form>

	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	
	
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">SAVE</button>
		<button type="submit" class="btn btn-warning">CANCEL</button>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.html"%>
	
	<!-- WYSIWYG -->
	<!-- <div id="summernote"></div> -->
		<script>
		$(document).ready(function() {
			  $('#summernote').summernote({
				  placeholder: 'Content',
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
			
			var file = files[0];
			
			var formData = new FormData();
			
			formData.append("file", file);
			console.log(file);
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
		});
		
		$("#modifyForm").submit(function(event){
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
		});
		
		$("#popup_img").on("click", function(){
			$(".popup").hide('slow');
		});
		
		$("#upload").on("change", function(event) {
	        event.preventDefault();
	        var file = event.target.files[0]
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
	    });
	</script>
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");
			console.log(formObj);

			$(".btn-warning").on("click", function() {
				self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});

			$(".btn-primary").on("click", function() {
				formObj.submit();
			});
		});
	</script>
	<script>
		var bno = ${boardVO.bno};
		//var template = Handlebars.compile($("#templateAttach").html());
	
		$.getJSON("/sboard/getAttach/"+bno, function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);
			$(".uploadedList").append(html);
		});
	});
	</script>
</body>
</html>