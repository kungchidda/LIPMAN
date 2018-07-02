<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<body>


 <!--profile-->
    <div class="profile">
        <div class="profile-image">
        	<div class="uploadedList">
            	<img src="/displayFile?fileName=${userVO.fullName}">
            </div>
        </div>
        <div class="profile-infor">
            <h3>${userVO.uname}</h3>
            <span>
            	<a href="/mypage/subscriber" class="subscribedCount" id="btn-subscribedCount"></a>
            </span>
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