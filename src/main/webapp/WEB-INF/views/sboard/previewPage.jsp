<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>${boardVO.title}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/header.css" rel="stylesheet">
  	<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>

<link href="/resources/css/contents.css" rel="stylesheet">
<script src="/resources/js/subscribe-check.js"></script>
<script src="/resources/js/subtitlePrint.js"></script>
<script src="/resources/js/expander.js"></script>


</head>
<body>
<section>

	<!--contents-->
    <div class="contents" id="comic-contents">
        <p class="comic">
            ${boardVO.fileList}
        </p>
    </div>
    
    <!--thumb-->
    <div class="evaluate ">
        <div class="evaluate-pencil">
            <img src="/resources/png/pencil-g.png" id='likeAddBtn'>
        </div>
        <div class="evaluate-no-1 likesDiv">
        </div>
        <div class="evaluate-eraser"  >
            <img src="/resources/png/eraser-g.png" id='dislikeAddBtn'>
        </div>
        <div class="evaluate-no-2 dislikesDiv">
        </div>
    </div>
    
</section>
    
	

	
<!-- <hr>  -->   
    
    
    
    <!--comic-infor-->
   <div class="comic-infor">
       <div class="comic-thumbnail">
           <img src="/displayFile?fileName=${boardVO.boardFullName}">
       </div>
       <div class="comic-title">
           <span>${boardVO.subtitle}</span>
       </div>
       
       <div class="comic-time">
           <span><img src="/resources/png/comic.png">
           방금
           </span> 
       </div>
       <div class="comic-view">
			<span><img src="/resources/png/view.png"></span>${boardVO.viewcnt}
       </div>
       <div class="comic-link">
           <a href="#"><span><img src="/resources/png/copy-link.png"></span>copy link</a>
       </div>
       <div class="writer-subscribe">
			<span>
           		<button type="submit" class="subscribedCount subscribe subscribeBtn">SUBSCRIBE</button>
			</span>
       </div>
   </div>
   
   <!--comic-comment-->
   <!-- <div class="strapline">
      	<h4>Author Comment</h4>
    </div> -->
      <div class="comic-infor-comment">
      	<div class="comic-comment">
      		${boardVO.content}
      	</div>
       </div>


				
				
					
	
	<hr>
	
	
	<script>
		
		$(document).ready(function() {
			
			$('img').each(function() {
			    if((typeof this.naturalWidth != "undefined" && this.naturalWidth == 0 ) || this.readyState == 'uninitialized' ) {
			    	$(this).hide();
			    }
			});
			
			
			
	</script>
	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="/resources/ThumbnailGridExpandingPreview/js/grid.js"></script>
		<script>
			$(function() {
				Grid.init();
			});
		</script> -->
	
	
	
	
	
</body>
</html>