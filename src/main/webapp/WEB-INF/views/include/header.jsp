<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIPMAN</title>
    <!--    google web font link-->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
	
	


    <!--   style sheet-->
    <link href="/resources/css/main.css" rel="stylesheet">
    <link href="/resources/css/header.css" rel="stylesheet">
    <link href="/resources/css/mypage-main.css" rel="stylesheet">
    <link href="/resources/css/mypage-home.css" rel="stylesheet">
    <link href="/resources/css/mypage-subscribe.css" rel="stylesheet">
    <link href="/resources/css/mypage-subscribed.css" rel="stylesheet">        
    <link href="/resources/css/mypage-setting.css" rel="stylesheet">
    
    <style id="style-1-cropbar-clipper">
        /* Copyright 2014 Evernote Corporation. All rights reserved. */

        .en-markup-crop-options {
            top: 18px !important;
            left: 50% !important;
            margin-left: -100px !important;
            width: 200px !important;
            border: 2px rgba(255, 255, 255, .38) solid !important;
            border-radius: 4px !important;
        }

        .en-markup-crop-options div div:first-of-type {
            margin-left: 0px !important;
        }
    </style>

</head>

<body>
     <!--header-->
    <div class="header dropdown">
        <div class="brand">
            <a href="/sboard/list">LIPMAN</a>
        </div>
        <div class="search">
            <a href="#"><span><img class="dropbtn" onclick="searchFunction()" src="/resources/png/search.png"></span></a>
        </div>
        <div class="notice">
            <a href="#"><span><img class="dropbtn" onclick="noticeFunction()" src="/resources/png/notice-1.png"></span></a>
        </div>
        <div class="account">
        	<c:if test="${empty login}">
            <a href="#"><span><img class="dropbtn" onclick="myPageFunction()" src="/resources/png/account.png"></span></a>
            </c:if>
			<c:if test="${not empty login}">
				<a href="/mypage/home"><span><img class="dropbtn" src="/resources/png/account.png"></span></a>
			</c:if>
        </div>
    </div>

    <!--dropdown content-->
    <div id="searchBar" class="dropdown-content dropdown-btn">
        <div class="dropdown-contents dropdown-btn">
            <input type="text" class="searchBar dropdown-btn" placeholder='Search Webtoons'>
            <button type="submit" class="searchBar-button dropdown-btn"><img src="/resources/png/search.png"></button>
        </div>
    </div>

    <div id="noticeBar" class="dropdown-content dropdown-btn">
        <div class="dropdown-notice dropdown-btn">
            <div class="img-01 cursor dropdown-btn" onclick="window.location='#';">
                <img src="/resources/images/overwatch.jpg">
            </div>
            <div class="text-01 cursor dropdown-btn" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum placeat nesciunt ndus amet, voluptas, fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente?
            </div>
            <div class="time-01 dropdown-btn">
                1 hours ago
            </div>

            <div class="img-02 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-01.jpg">
            </div>
            <div class="text-02 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eumm quia culpa sapiente?
            </div>
            <div class="time-02">
                2 hours ago
            </div>

            <div class="img-03 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-02.jpg">
            </div>
            <div class="text-03 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur advitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente.
            </div>
            <div class="time-03">
                3 hours ago
            </div>

            <div class="img-04 cursor" onclick="window.location='#';">
                <img src="/resources/images/overwatch.jpg">
            </div>
            <div class="text-04 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente!
            </div>
            <div class="time-04">
                4 hours ago
            </div>

            <div class="img-05 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-03.jpg">
            </div>
            <div class="text-05 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum placeat nesciunt ndus amet, voluptas, fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente?
            </div>
            <div class="time-05">
                1 days ago
            </div>

            <div class="img-06 cursor" onclick="window.location='#';">
                <img src="/resources/images/test-04.jpg">
            </div>
            <div class="text-06 cursor" onclick="window.location='#';">
                Lorem ipsum dolor sit amet, consecteturvoluptas, fuga vitae accusantium delectus laborum, alias sit quisquam quia culpa sapiente?
            </div>
            <div class="time-06">
                2 hours ago
            </div>
        </div>
    </div>

    <div id="myPageBar" class="dropdown-content dropdown-btn">
	        <form class="dropdown-mypage dropdown-btn" action="/user/loginPost" method="post">
	            <input type="email" name="uid" class="login-id dropdown-btn" placeholder='ID' required>
	            <div class="remember">
	                <span><input type="checkbox" name="useCookie"></span>
	                <span>Remember your ID</span>
	            </div>
	            <input type="password" name="upw" class="login-pw dropdown-btn" placeholder='Password' required>
	            <button type="submit" class="login-button dropdown-btn">Log-In</button>
	            <button type="submit" class="signup-button dropdown-btn" onclick="window.location.href='/user/join'">Sign-Up</button>
	        </form>
    </div>
    
    <!-- <script>
    function dropDownSearchBar(){
    	console.log("click dropDownSearchBar");
    	$(".header-grid").after("<div>click dropDownSearchBar</div>");
    };
    </script> -->
    <script>
        /* When the user clicks on the button, 
                            toggle between hiding and showing the dropdown content */
        function searchFunction() {
            /* document.getElementById("searchBar").classList.toggle("search"); */
        	document.getElementById("searchBar").classList.add("search");
        	document.getElementById("noticeBar").classList.remove("notice");
        	document.getElementById("myPageBar").classList.remove("mypage");
        }

        function noticeFunction() {
            /* document.getElementById("noticeBar").classList.toggle("notice"); */
        	document.getElementById("searchBar").classList.remove("search");
        	document.getElementById("noticeBar").classList.add("notice");
        	document.getElementById("myPageBar").classList.remove("mypage");
        }
 
        function myPageFunction() {
            /* document.getElementById("myPageBar").classList.toggle("mypage"); */
        	document.getElementById("searchBar").classList.remove("search");
        	document.getElementById("noticeBar").classList.remove("notice");
        	document.getElementById("myPageBar").classList.add("mypage");
        }

        // Close the dropdown menu if the user clicks outside of it
        window.onclick = function(event) {
            console.log("event.target.className = " + event.target.className);
            console.log("event.target.id = " + event.target.id);

            if (!event.target.matches('.dropbtn') && !event.target.matches('.searchBar') && !event.target.matches('.dropdown-content') && !event.target.matches('.dropdown-btn')) {

                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('search') || openDropdown.classList.contains('notice') || openDropdown.classList.contains('mypage')) {
                        openDropdown.classList.remove('search');
                        openDropdown.classList.remove('notice');
                        openDropdown.classList.remove('mypage');
                    }
                }
            }
        }
    </script>

</body>
</html>