<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%--                 <%@ include file="/WEB-INF/views/mypage/profile.jsp"%> --%>
<%@ include file="/WEB-INF/views/mypage/user/profile.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/resources/css/mypage.css" rel="stylesheet">
</head>

<body>



	<script>
		$(document).ready(function() {
			$('.mypage-profile-icon-setting').addClass('active');


			var genreStr = "${userVO.genre}";
			var genreArr = genreStr.split(',');
			var genreLen = genreArr.length;

			for (var i = 0; i < genreLen; i++) {
				console.log("genreArr[" + i + "] = " + genreArr[i]);
				$(".genre-" + genreArr[i]).prop("checked", true);
				$(".genre-" + genreArr[i]).next().toggleClass("false");
				$(".genre-" + genreArr[i]).next().toggleClass("true");
			}
		});
		
		/**************************************************************************************/
		/**************************************************************************************/
		/*                               subscribeBtn start                                   */
		/**************************************************************************************/
		/**************************************************************************************/
		
		$(".subscribeBtn").on("click",function(){
			 subscribeBtnClick('${cri.uid}', '${login.uid}');
		});
		
		$(".unsubscribeBtn").on("click",function(){
			unsubscribeBtnClick('${cri.uid}', '${login.uid}');
		});
	</script>

	<%@ include file="/WEB-INF/views/mypage/user/userIcon.jsp"%>


		<div class="mypage-setting-id">
			<div class="mypage-setting-loginid-title">Log-in ID</div>
			<div class="mypage-setting-loginid-text">
				<span>${userVO.uid}</span>
			</div>
		</div>

		<hr>

<!-- 		<div class="mypage-setting-pw">
			<div class="mypage-setting-password-title">Password</div>
			<div class="mypage-setting-password-title-button">
				<input type="password" name="upw" class="input-text" id="password-input">
			</div>
		</div>

		<hr> -->

		<div class="mypage-setting-nick">
			<div class="mypage-setting-nickname-title">Nick Name</div>
			<div class="mypage-setting-nickname">
<%-- 				<input name="uname" class="input-text" value="${userVO.uname}" id="uname-input"> --%>
				<span>${userVO.uname}</span>
			</div>

			<div class="mypage-setting-nickname-button">
				<input type="hidden" name="uno" value="${userVO.uno}" readonly>
				<input type="hidden" name="uid" value="${userVO.uid}" readonly>


			</div>
		</div>

		<hr>

		<!-- <div class="mypage-setting-img">
			<div class="mypage-setting-profileimage-title">
				<p>Profile image</p>
			</div>
			<div class="mypage-setting-profileimage-button">
				<button type="button" id="edit-profile">change</button>

				<input type="file" style="display: none;" id="profile">

				<script>
					$(function() {
						$('#edit-profile').click(function(e) {
							e.preventDefault();
							$('#profile').click();

						});
					});
				</script>
			</div>
		</div>

		<hr> -->


		<div class="mypage-setting-subscribe">
			<div class="mypage-setting-subscribe-title">Subscribe</div>
			<p class="mypage-setting-subscribe-close">Close</p>
			<label class="mypage-setting-subscribe-switch">
				<input type="checkbox" checked>
				<span class="slider round"></span>
			</label>
			<p class="mypage-setting-subscribe-open">Open</p>
		</div>

		<hr>

		<div class="mypage-setting-subscriber">
			<div class="mypage-setting-subscriber-title">Subscriber</div>
			<p class="mypage-setting-subscriber-close">Close</p>
			<label class="mypage-setting-subscriber-switch">
				<input type="checkbox" checked>
				<span class="slider round"></span>
			</label>
			<p class="mypage-setting-subscriber-open">Open</p>
		</div>

		<hr>

		<div class="mypage-setting-genre">
			<div class="mypage-setting-genre-list">
				<div class="mypage-setting-genre-left">Genre</div>

				<div class="title-genre-checkbox mypage-setting-genre-right">
					<div class="genre-1 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-1" value='1'> <span
							class="do-not-close false">SF</span>
					</div>
					<div class="genre-2 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-2" value='2'> <span
							class="do-not-close false">Mystery</span>
					</div>
					<div class="genre-3 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-3" value='3'> <span
							class="do-not-close false">PureLove</span>
					</div>
					<div class="genre-4 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-4" value='4'> <span
							class="do-not-close false">Romance</span>
					</div>
					<div class="genre-5 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-5" value='5'> <span
							class="do-not-close false">Comic</span>
					</div>
					<div class="genre-6 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-6" value='6'> <span
							class="do-not-close false">Reasoning</span>
					</div>
					<div class="genre-7 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-7" value='7'> <span
							class="do-not-close false">SchoolLife</span>
					</div>
					<div class="genre-8 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-8" value='8'> <span
							class="do-not-close false">Sports</span>
					</div>
					<div class="genre-9 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-9" value='9'> <span
							class="do-not-close false">Fantasy</span>
					</div>
					<div class="genre-10 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-10" value='10'> <span
							class="do-not-close false">Medicine</span>
					</div>
					<div class="genre-11 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-11" value='11'> <span
							class="do-not-close false">Food</span>
					</div>
					<div class="genre-12 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-12" value='12'> <span
							class="do-not-close false">Education</span>
					</div>
					<div class="genre-13 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-13" value='13'> <span
							class="do-not-close false">Battle</span>
					</div>
					<div class="genre-14 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-14" value='14'> <span
							class="do-not-close false">Mecanic</span>
					</div>
					<div class="genre-15 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-15" value='15'> <span
							class="do-not-close false">Daily</span>
					</div>
					<div class="genre-16 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-16" value='16'> <span
							class="do-not-close false">Age</span>
					</div>
					<div class="genre-17 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-17" value='17'> <span
							class="do-not-close false">GraphicNovel</span>
					</div>
					<div class="genre-18 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-18" value='18'> <span
							class="do-not-close false">Thriller</span>
					</div>
					<div class="genre-19 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-19" value='19'> <span
							class="do-not-close false">Drama</span>
					</div>
					<div class="genre-20 do-not-close">
						<input type="checkbox" name='genreArr'
							class="do-not-close hide genre-20" value='20'> <span
							class="do-not-close false">Adventure</span>
					</div>
					<p class="mypage-setting-genre-close">Close</p>
					<label class="mypage-setting-genre-switch"> <input
						type="checkbox" checked> <span class="slider round"></span>
					</label>
					<p class="mypage-setting-genre-open">Open</p>
				</div>
			</div>
		</div>




	<div class="compony">
		<div class="compony-infor">Copyright © 2018 LIPMAN. 모든 권리 보유.</div>
	</div>






</body>

</html>