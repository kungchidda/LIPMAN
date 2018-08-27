<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=0"/>
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>LIPMAN</title>

    <!--    google web font link-->
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Quicksand|Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">

    <!--   style sheet-->
    <link href="/resources/css/header.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">

    <!-- <script src="/resources/js/dropdown-contents.js"></script> -->
    <script src="/resources/js/genre-check.js"></script>
    

    <!--expander style sheet-->
    <link rel="stylesheet" type="text/css" href="/resources/css/component.css" />

    <!--expander script-->

	<!--<script src="/resources/js/expander.js"></script> -->
	<script src="/resources/js/handlebars.js"></script>
	<link rel="shortcut icon" href="/resources/favicon.ico">
	<link rel="apple-touch-icon" sizes="120x120" href="/resources/apple-touch-icon-120x120.png?v=asdf">
</head>


<body>
    
        <!--header-->
    <div class="header dropdown">
        <div class="brand">
            <a href="/"><img src="/resources/png/logo.png"></a>
        </div>
        <c:if test="${not empty login}">
	        <div class="noticeBtn ">
	            <img class="dropbtn noticeFunction important-img" src="/resources/png/notice-1.png">
	        </div>
        </c:if>
        <div class="searchBtn ">
            <img class="dropbtn searchFunction" src="/resources/png/search.png">
        </div>
        <!-- <div class="genreBtn ">
            <img class="dropbtn" onclick="genreFunction()" src="/resources/png/genre.png">
        </div> -->
        
        <div class="accountBtn ">
            <c:if test="${empty login}">
            	<img class="dropbtn myPageFunction" src="/resources/images/accountgray.jpg">
            </c:if>
            <!-- <a href="#"><span><img class="dropbtn" onclick="myPageFunction()" src="/resources/png/account.png"></span></a> -->
			<c:if test="${not empty login}">
				<form id="titleListForm" role="form" action="/mypage/titleList" method="GET">
	 				<input type="hidden" name="uid" class="loginUid" value='${login.uid}'>
	 				<button type="submit" class="accountBtn-login profile-img-button"><img src="/displayFile?fileName=${login.profileFullName}" id="header-profile-img"></button>
	 				
	 			</form>
<%-- 				<a href="/mypage/titleList"><span><img class="dropbtn accountBtn-login" src="/displayFile?fileName=${login.profileFullName}"></span></a> --%>
			</c:if>
        </div>
<!--
        <div class="signupBtn">
            <img class="dropbtn" onclick="signupFunction()" src="png/account.png">
        </div>
-->
    </div>

    <!--dropdown content-->
    
    
    <div id="searchBar" class="do-not-close dropdown-contents search hide">        
        <div class="dropdown-searchBar-01 do-not-close">
            <div class="dropdown-genre-01 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput1" value='1'><span class="do-not-close genreInput1 false">SF</span>
            </div>
            <div class="dropdown-genre-02 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput2" value='2'><span class="do-not-close genreInput2 false">Mystery</span>
            </div>
            <div class="dropdown-genre-03 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput3" value='3'><span class="do-not-close genreInput3 false">Pure Love</span>
            </div>
            <div class="dropdown-genre-04 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput4" value='4'><span class="do-not-close genreInput4 false">Romance</span>
            </div>
            <div class="dropdown-genre-05 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput5" value='5'><span class="do-not-close genreInput5 false">Comic</span>
            </div>
            <div class="dropdown-genre-06 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput6" value='6'><span class="do-not-close genreInput6 false">Reasoning</span>
            </div>
            <div class="dropdown-genre-07 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput7" value='7'><span class="do-not-close genreInput7 false">School Life</span>
            </div>
            <div class="dropdown-genre-08 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput8" value='8'><span class="do-not-close genreInput8 false">Sports</span>
            </div>
            <div class="dropdown-genre-09 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput9" value='9'><span class="do-not-close genreInput9 false">Fantasy</span>
            </div>
            <div class="dropdown-genre-10 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput10" value='10'><span class="do-not-close genreInput10 false">Medicine</span>
            </div>
            <div class="dropdown-genre-11 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput11" value='11'><span class="do-not-close genreInput11 false">Food</span>
            </div>
            <div class="dropdown-genre-12 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput12" value='12'><span class="do-not-close genreInput12 false">Education</span>
            </div>
            <div class="dropdown-genre-13 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput13" value='13'><span class="do-not-close genreInput13 false">Battle</span>
            </div>
            <div class="dropdown-genre-14 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput14" value='14'><span class="do-not-close genreInput14 false">Mecanic</span>
            </div>
            <div class="dropdown-genre-15 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput15" value='15'><span class="do-not-close genreInput15 false">Daily</span>
            </div>
            <div class="dropdown-genre-16 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput16" value='16'><span class="do-not-close genreInput16 false">Age</span>
            </div>
            <div class="dropdown-genre-17 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput17" value='17'><span class="do-not-close genreInput17 false">Graphic Novel</span>
            </div>
            <div class="dropdown-genre-18 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput18" value='18'><span class="do-not-close genreInput18 false">Thriller</span>
            </div>
            <div class="dropdown-genre-19 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput19" value='19'><span class="do-not-close genreInput19 false">Drama</span>
            </div>
            <div class="dropdown-genre-20 do-not-close">
                <input type="checkbox" name='genre' class="do-not-close hide" id="genreInput20" value='20'><span class="do-not-close genreInput20 false">Adventure</span>
            </div>
        </div>
        
        <div class="dropdown-searchBar-02 do-not-close">
            <input type="text" name='keyword' id="keywordInput" value='' class="searchBar do-not-close" placeholder='Search Webtoons'>
            <button type="submit" id="searchBar-button" class="searchBar-button do-not-close"><img class="do-not-close searchBar-button-img" src="/resources/png/search.png"></button>
        </div>
    </div>

    <div id="noticeBar" class="do-not-close dropdown-contents notice hide">
    	<ul id="notifyList">
	    </ul>
    </div>
	<!-- 20180702 before -->
	<c:if test="${empty login}">
    <div id="myPageBar" class="do-not-close dropdown-contents mypage hide">
<!--         <form class="dropdown-mypage do-not-close" action="/user/loginPost" method="POST"> -->
        <form class="dropdown-mypage do-not-close" id="loginForm" action="/user/loginPost" method="POST">
        
            <input type="email" name="uid" class="login-id do-not-close" placeholder='E-mail' required>
            <div class="remember do-not-close">
<!--             	<span><input type="checkbox" class="do-not-close" name="useCookie" value="true"></span> -->
            	<span><input type="checkbox" class="do-not-close" name="useCookie"></span>
            	<span class="do-not-close">Remember your E-mail</span>
            </div>
            <input type="password" name="upw" class="login-pw do-not-close" placeholder='Password' required>
            <button type="submit" class="login-button do-not-close">Log-In</button>
            <div class="signupBtn do-not-close">
	            <div class="signup-button dropbtn do-not-close signupFunction">
	                Sign-Up
	            </div>
            </div>
            <div class="forgotBtn do-not-close">
	            <div class="forgot-button dropbtn do-not-close forgotFunction">
	                Forgot Password
	            </div>
            </div>
            <h1 class="signup-or"><span>Log-In with</span></h1>
            <div class="signup-facebook do-not-close">Facebook</div>
            <div class="signup-google do-not-close">Google</div>
        </form>
    </div>


<!-- forgot password -->
    <div id="forgotBar" class="do-not-close dropdown-contents forgot hide">
        <form class="dropdown-forgot do-not-close" role="forgotPasswordForm" action="/user/forgotPassword" method="get">
<!--             <input type="email" name='uid' class="signup-email do-not-close" placeholder='E-mail' required> -->
            <input type="email" name='uid' class="forgot-pw do-not-close" placeholder='E-mail' required>
         	<button type="submit" class="send-email do-not-close">Send</button>
            <button type="button" class="cancel-btn dropbtn do-not-close myPageFunction">
                Cancel
            </button>
        </form>
    </div>


<!-- sign-up password -->
    <div id="signupBar" class="do-not-close dropdown-contents signup hide">
        <form class="dropdown-signup do-not-close" role="form" action="/user/join" method="post">
            <input type="email" name='uid' class="signup-email do-not-close" placeholder='E-mail' required>
            <input type="password" name="upw" class="signup-pw do-not-close" placeholder='Password' required>
            <input type="password" class="signup-repw do-not-close" placeholder='Retype Password' required>
            <input type="text" name="uname" class="signup-nickname do-not-close" placeholder='Nick Name' required>
<!--            	<div id="signup-submit" class="signup-button do-not-close">Sign-Up</div> -->
			<button type="button" id="signup-submit" class="signup-button do-not-close">Sign-Up</button>
            <div class="hadaccount-button dropbtn myPageFunction">
                Had Account
            </div>
            <div class="forgotBtn do-not-close">
	            <div class="forgot-button dropbtn forgotFunction">
	                Forgot Password
	            </div>
            </div>
            <h1 class="signup-or"><span>Sign-Up with</span></h1>
            <div class="signup-facebook do-not-close">Facebook</div>
            <div class="signup-google do-not-close">Google</div>
        </form>
    </div>
    </c:if>
   
		

   <script id="notifies-template" type="text/x-handlebars-template">

		{{#each .}}
			<li class="notifyLi expander do-not-close" >
				<a href="{{url}}" name="{{type_num}}" class="notifyUrl do-not-close" id="{{nno}}">
					<div class="notify-list-read do-not-close">{{ifCond readNotify}}</div>

					<div class="img cursor do-not-close">
                		<img class="do-not-close notifyThumbnail" src="/displayFile?fileName={{notifyThumbnail}}">
            		</div>
            	
					<div class="text cursor do-not-close">
	        	        {{contents}}
        	    	</div>

    	        	<div class="time do-not-close">
	                	{{prettifyDate regdate}}
            		</div>
					<div class="notifyDelete do-not-close">
	                	×
            		</div>
				</a>
			</li>
		{{/each}}
		<!-- <ul id="notifyPage" class="pagination do-not-close comic-list-pagi"></ul> -->
	</script>
	
	<script id="no-notifies-template" type="text/x-handlebars-template">
			<div class="no-notifyLi expander do-not-close hide">
				<img class="no-notifyLi-img" src="/resources/images/check2.jpg">
				<div class="no-notifyLi-text" >알림이 없습니다.</div>
			</div>
			
	</script>

	<script>
	 if('${login.uid}' != null){
	    	var receiver = '${login.uid}';		
	    	$.ajax({
	    		type : 'post',
	    		url : "/notify/checkNewNotify/",
	    		headers : {
	    			"Content-Type" : "application/json",
	    			"X-HTTP-Method-Override" : "POST" },
	    		dataType : 'JSON',
	    		data : JSON.stringify({receiver:receiver}),
	    		async: false,
	    		success:function(result){
	    			if(result > 0){
	    				$(".noticeFunction").attr("src","/resources/images/notify.jpg");
	    			}
	    		}
	    	});
	    }
	</script>
	
	
    <script>
    $(document).ready(function () {
    var page = 1;
    
    
    Handlebars.registerHelper("prettifyDate", function(timeValue){
		console.log("timeValue = " + timeValue);
		var regdate = new Date(timeValue);
		var regdateTime = new Date(timeValue).getTime();
		regdateTime = regdateTime / 1000;
		console.log("regdateTime = " + regdateTime);
		
		var current = new Date();
		var currentTime = new Date().getTime();
		currentTime = currentTime / 1000;
		console.log("currentTime = " + currentTime);
		
		var diff = currentTime - regdateTime;
		console.log("diff = " + diff);
		var year = regdate.getFullYear();
		var month = regdate.getMonth() + 1;
		var date = regdate.getDate();
		
		var prettifyDate;
		    if(diff < 60) {
		    	prettifyDate = "방금";
		    } else if(diff >= 60 && diff < 3600) {
		    	prettifyDate = Math.floor(diff/60) + "분 전";
		    } else if(diff >= 3600 && diff < 86400) {
		    	prettifyDate = Math.floor(diff/3600) + "시간 전";
		    } else if(diff >= 86400 && diff < 2419200) {
		    	prettifyDate = Math.floor(diff/86400) + "일 전";
		    } else {
		    	prettifyDate = year+"-"+month+"-"+date;
		    }
		     
		    return prettifyDate;
		});
    
    Handlebars.registerHelper('ifCond', function(readNotify) {
		  if(readNotify == 0) {
		    return '●';
		  }
		  /* if(readNotify == 1) {
			    return '◑';
		  } */
		  if(readNotify == 1) {
			    return '';
		  }
		  return '';
	});
	
    
	
	var printNotify = function (notifyArr, target, templateObject){
		
		$(".no-notifyLi").remove();
		
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(notifyArr);
		
		console.log("notifyArr = " + notifyArr);
		
//  		$(".notifyLi").remove(); //무한 스크롤
		target.append(html);
		
	}
	
	 function getNotify(page){
	    	console.log("page = " +page);
	    	var receiver = '${login.uid}';
	    	$.ajax({
				type : 'post',
				url : "/notify/notifyList/"+ page,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST" },
				dataType : 'JSON',
				data : JSON.stringify({receiver:receiver}),
				async: false,
				success:function(result){
// 					console.log("result:" + result);
// 					console.log("result.notifyList = " + result.notifyList);
// 					console.log("result.pageMaker.totalCount = " + result.pageMaker.totalCount);
					if(result.pageMaker.totalCount != 0 && page == 1 ){
						$("#notifyList").append("<div class='notifyDeleteAll do-not-close'>Delete All</div>");
					}
					if(result.pageMaker.totalCount == 0 && page == 1 ){
						printNotify(result.notifyList, $("#notifyList"), $('#no-notifies-template'));
						$(".no-notifyLi").removeClass("hide").slideDown(300);
						$(".noticeFunction").attr("src","/resources/png/notice-1.png")
						
					}else{
						printNotify(result.notifyList, $("#notifyList"), $('#notifies-template'));
					}
					
					var count = result.pageMaker.totalCount;
					if(count > 4){
						$("#noticeBar").addClass("notice-height");
					}
					$(".notifyLi").on("click",function(event) {
			 			var nno = $(this).children().attr("id");
			 			console.log("nno = " + nno);
			 			
			 			$.ajax({
							type : 'post',
							url : "/notify/readNotify/",
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST" },
							dataType : 'JSON',
							data : JSON.stringify({nno:nno}),
							async: false,
							success:function(result){
				    				
							}
								
						});
			 			
					});
					
					$(".notifyDelete").on("click",function(event) {
						event.preventDefault();
			 			var nno = $(this).parent().attr("id");
			 			console.log("nno = " + nno);
			 			
			 			$.ajax({
							type : 'post',
							url : "/notify/deleteNotify/",
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST" },
							dataType : 'JSON',
							data : JSON.stringify({nno:nno}),
							async: false,
							success:function(result){
								
							}
						});
			 			count--;
			 			if(count <= 4){
							$("#noticeBar").removeClass("notice-height");
						}
						$(this).parent().parent().slideUp(300);
			 			if(count<=0){
			 				$(".notifyDeleteAll").slideUp(300);
			 				
			 				printNotify(result.notifyList, $("#notifyList"), $('#no-notifies-template'));
			 				$(".no-notifyLi").removeClass("hide").slideDown(300);
			 				$(".noticeFunction").attr("src","/resources/png/notice-1.png")
			 			}
			 			
					});
					
					$(".notifyDeleteAll").on("click",function(event) {
						event.preventDefault();
			 			var receiver = '${login.uid}';
			 			console.log("receiver = " + receiver);
			 			
			 			$.ajax({
							type : 'post',
							url : "/notify/deleteAllNotify/",
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST" },
							dataType : 'JSON',
							data : JSON.stringify({receiver:receiver}),
							async: false,
							success:function(result){
								
							}
						});
// 						$(this).parent().parent().slideUp(300);
						$(".notifyLi").slideUp(300);
						$(".notifyDeleteAll").slideUp(300);
						printNotify(result.notifyList, $("#notifyList"), $('#no-notifies-template'));
						$(".no-notifyLi").removeClass("hide").slideDown(300);
						$(".noticeFunction").attr("src","/resources/png/notice-1.png")
					});
					
				}
					
			});
	    	
	    	
	    }
	 
        /* When the user clicks on the button, 
                            toggle between hiding and showing the dropdown content */
        $(".searchFunction").on("click",function() {
        	$(".login-id, .login-pw, .forgot-pw, .signup-email, .signup-pw, .signup-repw, .signup-nickname").val("");
        	if($('.search').is(":visible")){
        		$("#searchBar").slideUp(300);
        	}else{
        		$("#searchBar").slideDown(300);
        	}
			
// 			$("#searchBar").slideUp(300);
        	$("#noticeBar").slideUp(300);
        	$("#myPageBar").slideUp(300);
        	$("#forgotBar").slideUp(300);
        	$("#signupBar").slideUp(300);
        });

        $(".noticeFunction").on("click",function() {
        	$(".login-id, .login-pw, .forgot-pw, .signup-email, .signup-pw, .signup-repw, .signup-nickname").val("");
        	if($('.notice').is(":visible")){
        		$("#noticeBar").slideUp(300);
        	}else{
        		$("#notifyList").empty();
        		if("${login.uid}"){
        			page = 1;
					getNotify(page);
        		}else{
        			$("#notifyList").append("로그인이 필요합니다.");
        		}
        		
        		
        		$("#noticeBar").slideDown(300);
        	}

        	$("#searchBar").slideUp(300);
//         	$("#noticeBar").slideUp(300);
        	$("#myPageBar").slideUp(300);
        	$("#forgotBar").slideUp(300);
        	$("#signupBar").slideUp(300);
        	
        });
 
        $(".myPageFunction").on("click",function() {
        	
        	$(".login-id, .login-pw, .forgot-pw, .signup-email, .signup-pw, .signup-repw, .signup-nickname").val("");
        	if($('.mypage').is(":visible")){
        		$("#myPageBar").slideUp(300);
        	}else{
        		$("#myPageBar").slideDown(300);
        	}

        	$("#searchBar").slideUp(300);
        	$("#noticeBar").slideUp(300);
//         	$("#myPageBar").slideUp(300);
        	$("#forgotBar").slideUp(300);
        	$("#signupBar").slideUp(300);
        	
        });
        
//         function forgotFunction() {
        $(".forgotFunction").on("click",function() {
        	$(".login-id, .login-pw, .forgot-pw, .signup-email, .signup-pw, .signup-repw, .signup-nickname").val("");
        	if($('.forgot').is(":visible")){
        		$("#forgotBar").slideUp(300);
        	}else{
        		$("#forgotBar").slideDown(300);
        	}
        	
        	$("#searchBar").slideUp(300);
        	$("#noticeBar").slideUp(300);
        	$("#myPageBar").slideUp(300);
//         	$("#forgotBar").slideUp(300);
        	$("#signupBar").slideUp(300);
        	
        });
        
// 		function signupFunction() {
		$(".signupFunction").on("click",function() {
			$(".login-id, .login-pw, .forgot-pw, .signup-email, .signup-pw, .signup-repw, .signup-nickname").val("");
			if($('.signup').is(":visible")){
				$("#signupBar").slideUp(300);
        	}else{
        		$("#signupBar").slideDown(300);
        	}
			
			$("#searchBar").slideUp(300);
        	$("#noticeBar").slideUp(300);
        	$("#myPageBar").slideUp(300);
        	$("#forgotBar").slideUp(300);
//         	$("#signupBar").slideUp(300);
			
		});
		

        // Close the dropdown menu if the user clicks outside of it
        window.onclick = function(event) {
            console.log("event.target.className = " + event.target.className);
            console.log("event.target.id = " + event.target.id);
            

            if (!event.target.matches('.dropbtn') && !event.target.matches('.do-not-close') ) {

                var dropdowns = document.getElementsByClassName("do-not-close");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('search') || openDropdown.classList.contains('genre') || openDropdown.classList.contains('notice') || openDropdown.classList.contains('mypage') || openDropdown.classList.contains('forgot') || openDropdown.classList.contains('signup')) {
						
                    		$("#searchBar").slideUp(300);
                    		$("#noticeBar").slideUp(300);
                    		$("#myPageBar").slideUp(300);
                    		$("#forgotBar").slideUp(300);
                    		$("#signupBar").slideUp(300);
//							openDropdown.classList.remove('search');
//							openDropdown.classList.remove('notice');
//							openDropdown.classList.remove('mypage');
//							openDropdown.classList.remove('forgot');
//							openDropdown.classList.remove('signup');
                    }
                }
            }
        }
        
         
        /* $(".login-button").on("click",function(event){
        	event.preventDefault();
        	var useCookie = $("input[name='useCookie']").is(":checked");
        	
// 			console.log("useCookie = " + useCookie);
        	alert("useCookie = " + useCookie);
        	
        	var formObj = $("#loginForm");
        	formObj.submit();
        	
        }); */
        
        
         
        $('#searchBar-button').on("click",function(event){
            //  $("#searchForm").submit(function(event){
              	event.preventDefault();
              	
              	var checkArr = [];     // 배열 초기화
                
              	$("input[name='genre']:checked").each(function(i) {
                    checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
                });
              	
              	console.log("checkArr = " + checkArr);
				var location = "/sboard/list" + '${pageMaker.makeQuery(1)}';
				if($('#keywordInput').val() != null){
					location += "&searchType="
						+ "tcw"
						+ "&keyword=" + $('#keywordInput').val();
				}
				if(checkArr.length != 0){
					location += "&genre=" + checkArr;
				}
				
				self.location = location
						
						//$(this).get(0).submit();
        });
            
		       
              
//              var genreStr = "${MyPageVO.genre}";
				var genreStr = '${cri.genre}';
				console.log("genreStr = " + genreStr);
				var genreArr = genreStr.split(',');
				var genreLen = genreArr.length;
              	
				for(var i = 0; i <genreLen; i++){
					console.log("genreArr[" + i + "] = " + genreArr[i]);
					$("#genreInput"+genreArr[i]).prop( "checked", true );
					$("#genreInput"+genreArr[i]).next().toggleClass("false");
					$("#genreInput"+genreArr[i]).next().toggleClass("true");
					$(".genre-search-"+genreArr[i]).removeClass("hide");
				}
				
				var keyword = '${cri.keyword}';
				console.log("keyword = " + keyword);
				$('#keywordInput').val(keyword);
				
				$('.search-keyword').append(keyword);
				
				
				 if(genreStr || keyword){
						$(".search-genre-keyword").removeClass("hide");
			      	}
				
				var formObj = $("form[role='form']");
                console.log(formObj);
       
				$("#signup-submit").on("click", function () {
					if($(".signup-email").hasClass("check-please") === true){
						alert("Email exist");		
					}
					
					if($(".signup-pw").hasClass("check-please") === true){
						alert("Please Check Your Password");	
					}
					
					if( $(".signup-email").hasClass("check-ok") && $(".signup-pw").hasClass("check-ok")){
						console.log("check-ok true");						
	                    formObj.submit();
					}
					
                });
				
				$(".signup-email").on("change", function(event) {
					console.log("signup-email change");
					$(".signup-email").removeClass("check-please");
					$(".signup-email").removeClass("check-ok");
					var uid = $(".signup-email").val();
					$.ajax({
			            type : 'post',
			            url : '/user/existAccount',
			            headers : {
			                "Content-Type": "application/json"
			                },
			            dataType:'json',
			            data : JSON.stringify({uid:uid}),
			            success:function(result){
			                
// 			            	console.log("getLikeList result.length : " + result.length);

			                if(result != 0){
			                   $(".signup-email").addClass("check-please");
			                   
			                }
			                if(result == 0){
			                	$(".signup-email").addClass("check-ok");
				            }
			            }
			        });
				});
				
				$(".signup-repw").on("change", function(event) {
					
					var signupPw = $(".signup-pw").val();
					var signupRepw = $(".signup-repw").val();
					
					$(".signup-pw").removeClass("check-please");
					$(".signup-repw").removeClass("check-please");
					$(".signup-pw").removeClass("check-ok");
					$(".signup-repw").removeClass("check-ok");
					
					if(signupPw != signupRepw){
// 						alert("check your password");
						$(".signup-pw").addClass("check-please");
						$(".signup-repw").addClass("check-please");
					}
					
					if(signupPw == signupRepw){
// 						alert("check your password");
						$(".signup-pw").addClass("check-ok");
						$(".signup-repw").addClass("check-ok");
					}
					
				});
				
				$(".signup-pw").on("change", function(event) {
					
					var signupPw = $(".signup-pw").val();
					var signupRepw = $(".signup-repw").val();
					
					$(".signup-pw").removeClass("check-please");
					$(".signup-repw").removeClass("check-please");
					$(".signup-pw").removeClass("check-ok");
					$(".signup-repw").removeClass("check-ok");
					
					if(signupPw != signupRepw){
// 						alert("check your password");
						$(".signup-pw").addClass("check-please");
						$(".signup-repw").addClass("check-please");
					}
					
					if(signupPw == signupRepw){
// 						alert("check your password");
						$(".signup-pw").addClass("check-ok");
						$(".signup-repw").addClass("check-ok");
					}
					
				});
				
				var useCookie = $("input[name='useCookie']").is(":checked");
				console.log("useCookie = " + useCookie);
			    $("#noticeBar").scroll(function() {
			    	var elem = $("#noticeBar");

// 			    	console.log("elem[0].scrollHeight = " + elem[0].scrollHeight);
// 					console.log("elem.scrollTop() = " + elem.scrollTop());
// 					console.log("elem.outerHeight() = " + elem.outerHeight());
			    	
			    	
				    if ( elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight()){
					    page++;
				    	console.log("page = " + page);
				    	getNotify(page);
					}

					});
			});
    </script>

</body>
</html>