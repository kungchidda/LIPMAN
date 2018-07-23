<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resources/css/userList.css" rel="stylesheet">
</head>
<body>
<!--icon-->
	<div class="mypage-profile-icon">
		<div class="mypage-profile-icon-home">
			<form action="/mypage/titleList" method="GET">
				<input type="hidden" name="uid" value='${cri.uid}'>
				<button type="submit"><img src="/resources/png/comic.png" id="profile-img-home"></button>
			</form>
<!-- 			<a href="/mypage/home" class="active"> -->
<!-- 			</a> -->
		</div>
		<div class="mypage-profile-icon-subscribe">
<!-- 			<a href="/user/subscribedList"> -->
			<form action="/mypage/subscribedList" method="GET">
				<input type="hidden" name="uid" value='${cri.uid}'>
				<button type="submit"><img src="/resources/png/subscribe.png" id="profile-img-subscribed"></button>
			</form>
<!-- 			</a> -->
		</div>
		<div class="mypage-profile-icon-subscribed">
<!-- 			<a href="/user/subscriberList"> -->
			<form action="/mypage/subscriberList" method="GET">
				<input type="hidden" name="uid" value='${cri.uid}'>
				<button type="submit"><img src="/resources/png/subscribed.png" id="profile-img-subscriber"></button>
<!-- 			</a> -->
			</form>
		</div>
		<div class="mypage-profile-icon-setting">
<!-- 			<a href="/user/setting"> -->
			<form action="/mypage/setting" method="GET">
				<input type="hidden" name="uid" value='${cri.uid}'>
				<button type="submit"><img src="/resources/png/setting.png" id="profile-img-setting"></button>
<!-- 			</a> -->
			</form>
		</div>
	</div>
</body>
</html>