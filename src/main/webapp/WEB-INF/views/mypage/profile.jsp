<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<script src="/resources/js/subscribe-check.js"></script>
</head>

<body>


 <!--profile-->
    <div class="mypage-profile">
        <div class="mypage-profile-image">
        	<div class="profile-uploadedList">
            	<img src="/displayFile?fileName=${userVO.profileFullName}" class="registed-img">
            </div>
        </div>
        <div class="mypage-profile-name">
            <p>${userVO.uname}</p>
        </div>
        <div class="mypage-profile-subscribe">
			<c:if test="${login.uid == cri.uid}">
			<form action="/mypage/subscriberList" method="GET">
			<input type="hidden" name="uid" value='${cri.uid}'>
				<button type="submit" class="subscribedCount" id="btn-subscribedCount"></button>
				</form>
			</c:if>
        	<c:if test="${login.uid != cri.uid}">
	        	<button type="submit" class="subscribedCount subscribe subscribeBtn do-not-close"></button>
				<button type="submit" class="subscribedCount subscribed unsubscribeBtn do-not-close"></button>
			</c:if>
        </div>
    </div>



<script>

$(document).ready(function() {
	
	var subscribed = '${cri.uid}';
	
	subscribedList('${cri.uid}', '${login.uid}');
	
/* 	$.ajax({
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
		}); */
	
	});
</script>
   

	


</body>
</html>