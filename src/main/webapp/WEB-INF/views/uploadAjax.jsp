<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.fileDrop {
	width : 100%;
	height : 200px;
	border : 1px dotted blue;
}

</style>
</head>
<body>

	<h3>Ajax File Upload</h3>
	<div class='fileDrop'></div>
	
	<div class='uploadedList'></div>
	
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			
			var file = files[0];
			
			//console.log(file);
			var formData = new FormData();
			
			formData.append("file",file);
			
			$.ajax({
				url : '/uploadAjax',
				data : formData,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data){
					
					var str = "";
					
					console.log(data);
					console.log(checkImageType(data));
					
					if(checkImageType(data)){
						str = "<div>"
							+ "<a href=displayFile?fileName="+getImageLink(data)+">"
							+ "<img src='displayFile?fileName="+data+"'/>"
							+ "</a><small data-src="+data+">X</small></div>";
					} else {
						str = "<div><a href='displayFile?fileName="+data+"'>"
							+ getOriginalName(data)+"</a></div>"
							+ "<small data-src="+data+">X</small></div>";
					}
					//alert(data);
					$(".uploadedList").append(str);
				}
			});
			
		});
		
		function checkImageType(fileName){
			var pattern = /jpg|gif|png|jpeg/i;
			
			return fileName.match(pattern);
		}
		
		function getOriginalName(fileName){
			if(checkImageType(fileName)){
				return;
			}
			var idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}
		
		function getImageLink(fileName){
			if(!checkImageType(fileName)){
				return;
			}
			var front = fileName.substr(0,12);
			var end = fileName.substr(14);
			
			return front + end;
		}
		
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
						that.parent("div").remove();
					}
				}
			});
		});
	</script>

</body>
</html>