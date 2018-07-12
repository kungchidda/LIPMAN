<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<body>


 <!--profile-->
    <div class="mypage-profile">
        <div class="mypage-profile-image">
        	<div class="uploadedList">
            	<img src="/displayFile?fileName=${userVO.profileFullName}">
            </div>
        </div>
        <div class="mypage-profile-name">
            <h3>${userVO.uname}</h3>
        </div>
        <div class="mypage-profile-subscribe">
          	<a href="/mypage/subscriber" class="subscribedCount" id="btn-subscribedCount"></a>
        </div>
    </div>



<script>

$(document).ready(function() {
	
	var subscribed = '${login.uid}';
	
	$.ajax({
		type : 'post',
		url : '/subscribes/count',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST" },
		dataType : 'text',
		data : JSON.stringify({subscribed:subscribed}),
		success:function(result){
			var html = result + " Subscriber";
			console.log("html:" + html);
			$(".subscribedCount").append(html);
			
		}
		});
		
	});

</script>
   

	


</body>
</html>