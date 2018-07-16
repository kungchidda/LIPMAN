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
        	<div class="uploadedList">
            	<img src="/displayFile?fileName=${userVO.profileFullName}">
            </div>
        </div>
        <div class="mypage-profile-name">
            <h3>${userVO.uname}</h3>
        </div>
        <div class="mypage-profile-subscribe">
        	<button type="submit" class="subscribedCount subscribe subscribeBtn"></button>
			<button type="submit" class="subscribedCount subscribed unsubscribeBtn"></button>
<!--           	<a href="/mypage/subscriber" class="subscribedCount" id="btn-subscribedCount"></a> -->
			<div class="mypage-profile-icon-subscribed">
<!-- 			<a href="/user/subscriberList"> -->
<%-- 			<form action="/mypage/user/subscriberList" method="GET">
				<input type="hidden" name="uid" value='${cri.uid}'>
				<button type="submit" class="subscribedCount default-button-style"></button>
<!-- 			</a> -->
			</form> --%>
		</div>
        </div>
    </div>



<script>

$(document).ready(function() {
	
	var subscribed = '${userVO.uid}';
	
	subscribedList('${userVO.uid}', '${login.uid}');
	
	});
</script>
   

	


</body>
</html>