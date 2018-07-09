<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>${titleVO.title}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link href="/resources/css/register2.css" rel="stylesheet">
<style>
/* .fileDrop {
	width : 100%;
	height : 220px;
 	border : 1px dotted blue; 
} */

/* small {
	margin-left : 3px;
	font-weight : bold;
	color : gray;
} */

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
				<input type="hidden" name='tno' class="form-control" value='${titleVO.tno}' readonly>
<!-- 				<label for="exampleInputEmail1">Title</label> -->
<%-- 				<input type="text" name='title' class="form-control" value='${titleVO.title}' readonly> --%>
<!-- 				<label for="exampleInputEmail1">Subtitle</label> -->
<!-- 				<input type="text" name='subtitle' class="form-control" placeholder="Enter Title"> -->
			</div>
			<div class="form-group">
<!-- 				<label for="exampleInputEmail1">Writer</label> -->
				<!-- <Input type="text" name="writer" class="form-control" placeholder="Enter Writer"> -->
				<input type="hidden" name="uid" class="form-control" value='${login.uid}'>
			</div>
<!-- 			<div class="form-group"> -->
				<!-- <label for="exampleInputPasswooord1">Content</label> -->
				<!-- <textarea class="form-control" name="content" rows="3" placeholder="Enter ..."></textarea> -->
				<!-- WYSIWYG -->
				<!-- <textarea id="summernote" name="content"></textarea>
				<div id="summernote"></div> -->
<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<!-- 				<label for="exampleInputEmail1">File Upload or DROP Here</label> -->
<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<!-- 				<input type="file" id="upload" multiple> -->
<!-- 				<div class="fileDrop"> -->
<!-- 					<ul class="mailbox-attachments clearfix uploadedList"></ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			
			
<!-- 			<button type="submit" class="btn btn-primary">Submit</button> -->
	
		</div>
		
		
		<div class="og-expander">
			<%-- <div class="og-fullimg">
	            <div class="og-loading" style="display: none;"></div><img src="/displayFile?fileName=${titleVO.fullName}" style="display: inline;">
	        </div>
	        <div class="form-group">
	            <button class="btn">Select image</button>
	        </div> --%>
	        <div class="comic-list-title">
	            <label for="exampleInputEmail1"> 
	                <input type="text" name='title' class="form-control" value='${titleVO.title}' readonly></label>
	        </div>
	        <!-- <div class="comic-upload-submit">
	            <button type="button" class="btn btn-primary">Modify</button>
	            <button type="button" style="display:none;" class="btn btn-primary">Submit</button>
	        </div> -->
   		</div>



	    <div class="subtitle">
<!-- 	            <ul class="mailbox-attachments clearfix uploadedList"></ul> -->
	        <div class="og-fullimg" id="thumbnail-file-drop">
	        	<div class="uploadedList">
	            	<img src="/resources/png/number-00.png" id="select-file" style="display: inline;">
	            </div>
	        </div>
            <input type="file" style="display:none;" id="thumbnail-upload-input" multiple>
            <script>
				$(function () {
					$('#thumbnail-file-drop').click(function (e) {
						e.preventDefault();
						$('#thumbnail-upload-input').click();
				    });
				});
			</script>
			
			
	        <input type="hidden" id='fileList' name='fileList' class="form-control">
	        <select class="upload-file-list" name="file-list-name" size="2000">
	        
	        </select>
	        
	        <div>
		        <a href = "javascript:moveItem( 'T', 'file-list-name' );">맨위</a><BR><BR>
				<a href = "javascript:moveItem( 'U', 'file-list-name' );">위</a><BR><BR>
				<a href = "javascript:moveItem( 'D', 'file-list-name' );">아래</a><BR><BR>
				<a href = "javascript:moveItem( 'B', 'file-list-name' );">맨아래</a>
			</div>

	        
	        
			<button id="file-upload-button">file upload</button>
			<input type="file" style="display:none;" id="file-upload-input" multiple>
            <script>
				$(function () {
					$('#file-upload-button').click(function (e) {
						e.preventDefault();
						$('#file-upload-input').click();
				    });
				});
			</script>
			<button id="file-delete-button">file delete</button>
			<script>
			$(function () {
				$('#file-delete-button').click(function (e) {
					e.preventDefault();
					
					var dataSrc = $("select[name='file-list-name'] option:selected").attr("data-src");
					console.log("dataSrc = " + dataSrc);
//   					$(".uploadedList").on("click", "small", function(event){
						
// 						var that = $(this);
						
						$.ajax({
							url : "deleteFile",
							type : "post",
							data : {fileName:dataSrc},
							dataType : "text",
							success : function(result){
								if(result == 'deleted'){
									alert("deleted");
									//that.parents().parent("li").remove();
									$("select[name='file-list-name'] option:selected").remove();
								}
							}
						});
//  					});
 			    });
			});
			</script>
	        <div class="comic-list-title">
	                <input type="text" name='subtitle' placeholder="Subtitle" required>
	        </div>
	        
<!-- 	        <div class="fileDrop"> -->
<!-- 	            <input type="file" id="upload" multiple> -->
<!-- 	        </div> -->
	
	        <div class="comment">
<!-- 	        <textarea id="summernote" name="content"></textarea> -->
<!-- 					<div id="summernote"></div> -->
	            <textarea type="text" id="content" name="content" placeholder="Comment"></textarea>
	        </div>
	
	        <div class="preview">
	            <a href="#" target="_blank" type="submit" class="btn btn-primary">Preview</a>
	        </div>
	        <div class="write">
	            <button type="submit" class="btn btn-primary">Write</button>
	        </div>
	    </div>
		
		
		
		
	</form>

	
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	<script id="template" type="text/x-handlebars-template">
		<div class="uploadedList">
			<img src="{{imgsrc}}" style="width:300px;" alt="Attachment">
			<div class="mailbox-attachment-info" style="width:200px;">
					<a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a>
					<small data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
						<i class="fa fa-fw fa-remove"></i>
					</small>
			</div>
		</div>
	</script>
	
	<%-- <%@ include file="/WEB-INF/views/include/footer.html"%> --%>

	<!-- WYSIWYG -->
	<!-- <div id="summernote"></div> -->
		<!-- <script>
		$(document).ready(function() {
			  $('#summernote').summernote({
				  //placeholder: 'Content',
				  minHeight: null,             // set minimum height of editor
				  maxHeight: null,             // set maximum height of editor
				  focus: true,      
// 				  height: 300,
 				  width: 800,
				  height: 600,
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
//			 					$(".uploadedList").append(html);
								$(".uploadedList").remove();
								$("#thumbnail-file-drop").append(html);
								editor.summernote('editor.insertImage', fileInfo.getLink);
								//editor.insertImage(welEditable, data.url);
							}
						});
			      }
			}
			
			
			});
	</script> -->

	
	
	<script>
		var template = Handlebars.compile($("#template").html());
		
		$("#thumbnail-file-drop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$("#thumbnail-file-drop").on("drop", function(event){
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;
			
			for(i=0; i<files.length; i++){
	        	var file = files[i]
				uploadFile(file);	
	        }
			
		});
		
		$("#thumbnail-upload-input").on("change", function(event) {
	        
	    	event.preventDefault();
	    	
	    	var files = event.target.files
	    	for(i=0; i<files.length; i++){
	        	var file = event.target.files[i]
				uploadFile(file);
	        }
	    });
		
		$("#file-upload-input").on("change", function(event) {
	        
	    	event.preventDefault();
	    	
	    	var files = event.target.files
	    	for(i=0; i<files.length; i++){
	        	var file = event.target.files[i]
	        	uploadFileList(file);
	        }
	    	
			
	    });
		
		$("#registerForm").submit(function(event){
			event.preventDefault();
			var that = $(this);
			var str = "";
			var fileList = $('#fileList').val();
			console.log("fileList = " + fileList);

			$(".file-list-value").each(function(index){
				//console.log('$(this).attr("value") = ' + $(this).attr("value"));
				$('#fileList').val($('#fileList').val()+"<img src='" + $(this).attr("value") + "'><br>");
			});
			//$('#fileList').val($('#fileList').val() +"<br>"+fileList);

			
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
					console.log("data = " + data);
					var fileInfo = getFileInfo(data);
					
// 					console.log("fileInfo.fileName = " + fileInfo.fileName);
// 					var fileName = fileInfo.fileName;
// 					$('.upload-file-list').append("<option value='" + fileName + "'>"+ fileName + "</option>" );
					
					var html = template(fileInfo);
// 					$(".uploadedList").append(html);
					$(".uploadedList").remove();
					$("#thumbnail-file-drop").append(html);
				}
			});
	    }
	    
	    function uploadFileList(file){
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
					console.log("data = " + data);
					var fileInfo = getFileInfo(data);
					
					console.log("fileInfo.fileName = " + fileInfo.fileName);
					var fileName = fileInfo.fileName;
					$('.upload-file-list').append("<option class='file-list-value' data-src='"+fileInfo.fullName+"' value='" + fileInfo.getLink + "'>"+ fileName + "</option>" );
					
					$(function() {
						  $('.upload-file-list').each(function() {
						  	var select = this;
						    $( 'option', this ).sort(function(a,b) {
						     return $(a).text() > $(b).text();
								}).appendTo(select);
						  });
					});
				}
			
			});
	    }
	</script>
	
	 <script language="JavaScript">
		/**
		 * 셀렉트 박스에 아이템 추가
		 *
		 * @param name 겉으로 보일 텍스트 값
		 * @param text 실제 값
		 * @param formName 셀렉트 박스명
		 */
		function insertItem(text, value, formName) {
		    var opt = document.getElementsByName(formName)[0];
		
		    var newOpt = document.createElement("OPTION");
		    newOpt.setAttribute("value", value);
		    newOpt.appendChild(document.createTextNode(text));
		
		    opt.appendChild(newOpt);
		
		    return false;
		}
		
		/**
		 * 항목 삭제
		 *
		 * @param formName 셀렉트 박스명
		 */
		function deleteItem(formName) {
		    var sel = document.getElementsByName(formName)[0];
		
		    if (sel.selectedIndex < 0) {
		        alert("삭제할 아이템을 선택하여 주십시오.");
		        return;
		    }
		
		    while (true) {
		        if (sel.selectedIndex != -1)
		            sel.remove(sel.selectedIndex);
		        else
		            break;
		    }
		}
		
		/**
		 * 위치 이동
		 *
		 * @param type U(위), D(아래), T(맨위), B(맨아래) 의 위치 이동 키
		 * @param formName 셀렉트 박스명
		 */
		function moveItem(type, formName) {
		    var sel = document.getElementsByName(formName)[0];
		
		    var index = sel.selectedIndex;
		
		    if (type == "U") {
		        if (index > 0) {
		            swap(sel, index, index - 1);
		        }
		    } else if (type == "D") {
		        if (index < sel.options.length - 1) {
		            swap(sel, index, index + 1);
		        }
		    } else if (type == "T") {
		        for (var i = index; i > 0; i--) {
		            swap(sel, i, i - 1);
		        }
		    } else if (type == "B") {
		        for (var i = index; i < sel.options.length - 1; i++) {
		            swap(sel, i, i + 1);
		        }
		    }
		}
		
		/**
		 * 실제 데이터 교체를 담당
		 *
		 * @param selectedOption 셀렉트 박스
		 * @param index 현재 위치
		 * @param targetIndex 이동 위치
		 */
		function swap(selectedOption, index, targetIndex) {
		    var onetext = selectedOption.options[targetIndex].text;
		    var onevalue = selectedOption.options[targetIndex].value;
		
		    selectedOption.options[targetIndex].text = selectedOption.options[index].text;
		    selectedOption.options[targetIndex].value = selectedOption.options[index].value;
		    selectedOption.options[index].text = onetext;
		    selectedOption.options[index].value = onevalue;
		    selectedOption.options.selectedIndex = targetIndex;
		
		    selectedOption.options[targetIndex].selected = true;
		}
		
		/**
		 * 지정한 위치로 데이터를 이동 시킴
		 * 
		 * @param fromFormName 본 항목을 포함하는 폼명
		 * @param toFormName 이동할 폼명
		 */
		function moveAnotherForm(fromFormName, toFormName) {
		    var from = document.getElementsByName(fromFormName)[0];
		    var to = document.getElementsByName(toFormName)[0];
		
		    // 다중 선택시 이동을 위함
		    while (true) {
		        if (from.selectedIndex != -1) {
		            // 이동할 항목의 데이터를 추출하여
		            var text = from.options[from.selectedIndex].text;
		            var value = from.options[from.selectedIndex].value;
		
		            // 이동될 위치에 새로 삽입한 후
		            insertItem(text, value, toFormName);
		
		            // 기존 항목은 삭제함
		            from.remove(from.selectedIndex);
		        } else {
		            break;
		        }
		    }
		}
		
		</script>

</body>
</html>