<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>${boardVO.subtitle}</title>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link href="/resources/css/register.css" rel="stylesheet">

</head>
<body>

	<form id="registerForm" role="modifyForm" action="/sboard/modifyPage"  method="post">
		<div class="box-body">
			<div class="form-group">
				<input type="hidden" name='bno' class="form-control" value='${boardVO.bno}' readonly>
			</div>
			<div class="form-group">
				<input type="hidden" name="uid" class="form-control" value='${login.uid}'>
			</div>
		</div>




	    <div class="write-comic">

			<input type="text" name='title' class="write-comic-title" value='${boardVO.title}' readonly>
			<input type="text" name='subtitle' class="write-comic-subtitle" placeholder="Subtitle" value="${boardVO.subtitle}" required>
			
	        <div class="write-comic-thumbnail" id="thumbnail-file-drop">
	        	<div class="uploadedList">
	            	<img src="/displayFile?fileName=${boardVO.boardFullName}" class="registed-img" id="select-file" style="display: inline;">
	            </div>
	        </div>
            <input type="file" accept="image/*" style="display:none;" id="thumbnail-upload-input">
            <script>
				$(function () {
					$('#thumbnail-file-drop').click(function (e) {
						e.preventDefault();
						$('#thumbnail-upload-input').click();
				    });
				});
			</script>
	        <input type="hidden" id='fileList' name='fileList' class="form-control">
	        <select class="upload-file-list hide" name="file-list-name" multiple>
	        </select>
	        
	        <script>
		        var fileList = "${boardVO.fileList}";
		        var fileArray = fileList.split("<br>");

		        for(var i=0; i<fileArray.length-1; i++){
		        	
		        	var fileNameLength = fileArray[i].length - 2;
		        	console.log('fileArray[' + i + '] = ' + fileArray[i]);
		        	var value = fileArray[i].substring(10, fileNameLength);
		        	var dataSrc = fileArray[i].substring(32, fileNameLength);
		        	var fileName = fileArray[i].substring(81, fileNameLength);
		        	
			        console.log('value = ' + value);
			        console.log('dataSrc = ' + dataSrc);
			        console.log('fileName = ' + fileName);
			        
			        var str = '<option class="file-list-value" data-src=' + dataSrc + ' value=' + value + '>' + fileName + '</option>';
			        console.log('str = ' + str);
			        $('.upload-file-list').append(str);
			        
			        $(".upload-file-list").removeClass("hide");
			        var optionlength = $("select[name='file-list-name'] option").length
			    	var selectHeight = 20*optionlength + 20;
			    	$(".write-comic").css("grid-template-rows", "100px 100px 42px "+ selectHeight + "px 150px 150px 42px");
			        
		        }
	        </script>
	        
	        <button id="file-upload-button" class="write-comic-add"> + </button>
			<input type="file" accept="image/*" style="display:none;" id="file-upload-input" multiple>
            <script>
				$(function () {
					$('#file-upload-button').click(function (e) {
						e.preventDefault();
						$('#file-upload-input').click();
				    });
				});
			</script>
			
			
			<button id="file-delete-button" class="write-comic-delete"> - </button>
			
			
			<button type="button" class="write-comic-up"> ▲ </button>
			<button type="button" class="write-comic-down"> ▼ </button>

	        
			
            <textarea type="text" id="content" name="content" class="write-comic-comment" placeholder="Comment">${boardVO.content}</textarea>

            <div class="write-comic-tags">
				<input type="text" id="tags" name="tags" class="write-comic-tags-input" placeholder="Tags" />
				            	
            </div>

            <button class="write-comic-preview">Preview</button>
            <button type="submit" class="write-comic-complete">Write</button>
            <button type="button" class="write-comic-cancel" onclick="location='javascript:history.back()'">Cancel</button>
	    </div>
	</form>
	<form id="previewForm" class="hide" method="post" target="preview"  action="/sboard/previewPage">
		<input type='hidden' name='boardFullName' id="previeBoardFullName">
		<input type="hidden" name='title' id="previewTitle" value='${titleVO.title}' readonly>
		<input type="hidden" name='subtitle' id="previewSubtitle" placeholder="Subtitle" required>
		<input type="hidden" name='fileList' id='previewFileList'>
		<textarea id="previewContent" name="content" class="hide"></textarea>
	</form>
	
	<script>
	
		var formObj = $("#previewForm");
		var boardFullName = "";
		$(".write-comic-preview").click(function () {
			var regdate = new Date();
			var previewSubtitle = $(".write-comic-subtitle").val();
			var previewContent = $(".write-comic-comment").val();
			var previeBoardFullName = $(".uploadedList .delbtn").attr("data-src"); 
			$("#previewSubtitle").val(previewSubtitle);
			$("#previewContent").val(previewContent);
			$("#previeBoardFullName").val(previeBoardFullName);
			
			$(".file-list-value").each(function(index){
				$("#previewFileList").val($("#previewFileList").val()+"<img src='" + $(this).attr("value") +"'><br>");
			});
			
			
// 			alert("boardFullName = " + boardFullName);
// 			alert("previewSubtitle = " + $("#previewSubtitle").val());
// 			alert("previewContent = " + $("#previewContent").val());
// 			alert("previewFileList = " + $("#previewFileList").val());
// 			checkUnload = false;
			
			window.open('', 'preview', 'width=1000, height=700');

			formObj.submit();
			
		});
	</script>
	
	<script type="text/javascript" src="/resources/js/upload.js"></script>
<!-- 	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> -->
	<script src="/resources/js/handlebars.js"></script>
	
	<script id="template" type="text/x-handlebars-template">
		<div class="uploadedList">
			<img src="{{imgsrc}}" class="submit-yet" alt="Attachment">
			<div class="mailbox-attachment-info" style="width:200px;">
					<a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a>
					<small data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
						<i class="fa fa-fw fa-remove"></i>
					</small>
			</div>
		</div>
	</script>
	
	
	<script>
	$(document).ready(function() {
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
	    	
	    	console.log("file-upload-input change");
	    	$(".upload-file-list").removeClass("hide");
	    	
	    	var optionlength = $("select[name='file-list-name'] option").length
	    	var selectHeight = 20*optionlength + 20;
	    	$(".write-comic").css("grid-template-rows", "100px 100px 42px "+ selectHeight + "px 150px 42px");
	    });
		var arr = [];
		var registedArr = [];
		var listArr = [];
		var deleteArr = [];
		

		$('#file-delete-button').click(function (e) {
			e.preventDefault();
			
// 			var dataSrc = $("select[name='file-list-name'] option:selected").attr("data-src");
			
			var dataSrc = "";
			$("select[name='file-list-name'] option:selected").each(function () {
				   var $this = $(this);
				   if ($this.length) {
				    dataSrc = $this.attr("data-src");
					console.log("dataSrc = " + dataSrc);
				    deleteArr.push(dataSrc);
				   }
				});
			
			
			
// 			deleteArr.push(dataSrc);

// 			var front = dataSrc.substring(0, 12);
// 			var end = dataSrc.substring(12);
			
// 			var thumbnailSrc = front + "s_" + end;
// 			deleteArr.push(thumbnailSrc);
			
			$("select[name='file-list-name'] option:selected").remove();
				/* $.ajax({
					url : "deleteFile",
					type : "post",
					data : {fileName:dataSrc},
					dataType : "text",
					success : function(result){
						if(result == 'deleted'){
							alert("deleted");
							$("select[name='file-list-name'] option:selected").remove();
						}
					}
				}); */
				
			var optionlength = $("select[name='file-list-name'] option").length
			var selectHeight = 0;
			if(optionlength != 0){
		    	selectHeight = 20*optionlength + 20;
			}else{
		    	$(".upload-file-list").addClass("hide");
			}
	    	$(".write-comic").css("grid-template-rows", "100px 100px 42px "+ selectHeight + "px 150px 42px");
		
		});
		
		$("#registerForm").submit(function(event){
			event.preventDefault();
			checkUnload = false;
			
			
			arr.pop();
			console.log("arr.length = " + arr.length);
// 			console.log("listArr.length = " + listArr.length);
			console.log("registedArr.length = " + registedArr.length);
			
			deleteArr = deleteArr.concat(arr);
// 			deleteArr = deleteArr.concat(listArr);
			deleteArr = deleteArr.concat(registedArr);
			
			for(i=0; i<deleteArr.length; i++){
				console.log("deleteArr["+i+"] = "+ deleteArr[i]);
			}
			
			 if(deleteArr.length > 0){
					$.ajax({
						  type: 'POST',
						  url: "/deleteAllFiles",
						  data: {files:deleteArr},
						  dataType : "text",
						  async:false,
						  success : function(result){
							}
					});
			}
			/* 
			if(arr.length > 0){
				$.post("/deleteAllFiles",{files:arr}, function(){
					
				});
			} */
			
			
			console.log("$('.write-comic-subtitle').val() = " + $('.write-comic-subtitle').val());
			var that = $(this);
			var str = "";
			var fileList = $('#fileList').val();
			console.log("fileList = " + fileList);
			$(".file-list-value").each(function(index){
				$("#fileList").val($("#fileList").val()+"<img src='" + $(this).attr("value") +"'><br>");
			});

			
			$(".uploadedList .delbtn").each(function(index){
				console.log(index);
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src") +"'> ";
				
			});
			
			//var names = ["Mike","Matt","Nancy","Adam","Jenny","Nancy","Carl"];
			var uniqueTags = [];
			
			$.each(tagList, function(i, tag){
				if($.inArray(tag, uniqueTags) === -1) uniqueTags.push(tag);
			});
			
			uniqueTags.forEach( function(tag, index){
// 				console.log("tag = " + tag + ", index = " + index);
				str += "<input type='hidden' name='tags["+index+"]' value='"+ tag +"'> ";
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
					
					var html = template(fileInfo);
					var registedImgSrc = $(".registed-img").attr("src");
					if(registedImgSrc != null){
						registedImgSrc = registedImgSrc.substring(22);
						registedArr.push(registedImgSrc);
					}
					
					/* $(".uploadedList .submit-yet").each(function(index){
						var dataSrc = $(this).attr("src");
						dataSrc = dataSrc.substring(22);
						console.log("dataSrc = " + dataSrc);
						arr.push(dataSrc);
					}); */
					arr.push(data);
					
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
				async: false,
				type : 'POST',
				success : function(data) {
					console.log("uploadFileList data = " + data);
					
					listArr.push(data);
					
					var front = data.substring(0, 12);
					var end = data.substring(12);
					var thumbnailSrc = front + "s_" + end;
					console.log("thumbnailSrc" + thumbnailSrc);
					listArr.push(thumbnailSrc);
					
					
					
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
	    
	    var checkUnload = true;
 		$(window).on("beforeunload", function(){
			if(checkUnload){
//  				var deleteArr = [];
				console.log("arr.length = " + arr.length);
 				console.log("listArr.length = " + listArr.length);
				
				
/* 				$(".uploadedList .submit-yet").each(function(index){
						var dataSrc = $(this).attr("src");
						dataSrc = dataSrc.substring(22);
						console.log("dataSrc = " + dataSrc);
						arr.push(dataSrc);
				}); */
				
 				deleteArr = arr.concat(listArr);
				
				for(i=0; i<deleteArr.length; i++){
					console.log("arr["+i+"] = " + deleteArr[i]);
				}
				
				if(deleteArr.length > 0){
					
					$.ajax({
						  type: 'POST',
						  url: "/deleteAllFiles",
						  data: {files:deleteArr},
						  dataType : "text",
						  async:false,
						  success : function(result){
							}
						});
				}
				
				console.log("beforeunload event");
// 				return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
			}
			
		});
	    
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
		
		$(".write-comic-up").click(function () {
	    	var count = 0;
			$("select[name='file-list-name'] option:selected").each( function() {
				var newPos = $("select[name='file-list-name'] option").index(this) -1;
				if (newPos > -1 && newPos - count > -1) {
					$(this).insertBefore($(this).prev());
				}
				count++;
			});
		});
		
		$(".write-comic-down").click(function () {
	    	var count = 0;
	    	var optionLength = $("select[name='file-list-name'] option").length;
			$($("select[name='file-list-name'] option:selected").get().reverse()).each( function() {
				var newPos = $("select[name='file-list-name'] option").index(this) +1;
				if (newPos < optionLength && newPos + count < optionLength) {
					$(this).insertAfter($(this).next());
				}
				count++;
			});
		});
		
		var tags = '${boardVO.tag}';
		var tagList = [];
		
		tagList = tags.split(',');
		tagList.forEach( function(tag, i){
			console.log("tag = " + tag + ", index = " + i);
			tag = tag.trim();
			if(tag != ""){
				var html = "<span class='tags-list'>" + tag + "<span class='remove-tags-list'>×</span></span>";
				$('.write-comic-tags-input').before(html);
			}
		});
		
		
		$('.write-comic-tags-input').keydown(function(e) {
			console.log("keydown event = " + e.keyCode);
			var tag = $('.write-comic-tags-input').val().trim();
			if( ((e.keyCode == 32 || e.keyCode == 9) && tag != "")){
				e.preventDefault();
// 				if(tagList.length < 5){
					console.log("keydown event = " + e.keyCode);
					console.log("tag = " + tag);
					var html = "<span class='tags-list'>" + tag + "<span class='remove-tags-list'>×</span></span>";
					$('.write-comic-tags-input').val("");
					$('.write-comic-tags-input').before(html);
					
					tagList.push(tag);
// 				}else{
// 					alert("Tag는 5개까지 등록 가능합니다.")
// 				}
			}
			if(e.keyCode == 8 && tag == ""){
				console.log("delete");
				$(".tags-list:last").remove();
				tagList.pop();
			}
		});
		
		$(document).on("click",".remove-tags-list",function(){ 
			console.log("remove-tags-list test log");
			var removeVal = $(this).parent().text();
			removeVal = removeVal.substring(0, removeVal.length -1);
			
			tagList.splice(tagList.indexOf(removeVal),1); 
			$(this).parent().remove();

		});
		
		$('.write-comic-tags').click(function(e) {
// 			console.log("write-comic-tags-input test log");
			$('.write-comic-tags-input').focus();
		});
		

		
		
	});

		
		</script>

</body>
</html>