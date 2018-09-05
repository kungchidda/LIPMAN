<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link href="/resources/css/pay.css" rel="stylesheet">
<link href="/resources/css/mypage.css" rel="stylesheet">
<script src="/resources/js/subscribe-check.js"></script>
<link href="/resources/css/userList.css" rel="stylesheet">
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
			<form action="/mypage/subscriberList" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit" class="subscribedCount" id="btn-subscribedCount"></button>
			</form>
        </div>
    </div>



<script>

$(document).ready(function() {
	
	subscribedList('${login.uid}', '${login.uid}');
	
	});
</script>

<!--icon-->
	<div class="mypage-profile-icon">
		<div class="mypage-profile-icon-home">
			<form action="/mypage/titleList" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit"><img src="/resources/png/comic-g.png" id="profile-img-home"></button>
			</form>
<!-- 			<a href="/mypage/home" class="active"> -->
<!-- 			</a> -->
		</div>
		<div class="mypage-profile-icon-subscribe">
<!-- 			<a href="/user/subscribedList"> -->
			<form action="/mypage/subscribedList" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit"><img src="/resources/png/subscribe-g.png" id="profile-img-subscribed"></button>
			</form>
<!-- 			</a> -->
		</div>
		<div class="mypage-profile-icon-subscribed">
<!-- 			<a href="/user/subscriberList"> -->
			<form action="/mypage/subscriberList" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit"><img src="/resources/png/subscribed-g.png" id="profile-img-subscriber"></button>
<!-- 			</a> -->
			</form>
		</div>
		<div class="mypage-profile-icon-setting">
<!-- 			<a href="/user/setting"> -->
			<form action="/mypage/setting" method="GET">
				<input type="hidden" name="uid" value='${login.uid}'>
				<button type="submit"><img src="/resources/png/setting-g.png" id="profile-img-setting"></button>
<!-- 			</a> -->
			</form>
		</div>
		<div class="mypage-history">
				<a href="/pay/history">
					<img src="/resources/png/trade-g.png" id="history">
				</a>
			</div>
			<div class="mypage-charge">
				<a href="/pay/charge">
					<img src="/resources/png/charge.png" id="charge">
				</a>
			</div>
			<div class="mypage-withdraw">
				<a href="/pay/withdraw">
					<img src="/resources/png/exchange-g.png" id="withdraw">
				</a>
			</div>
	</div>
<%-- 	${status} --%>
	<c:if test="${status == 'NOT_ENOUGH_POINT'}">
		포인트가 부족하여 충전이 필요합니다.
	</c:if>



<!-- 	<form action="/pay/payments" method="post">
<div class="pay">
		<div class="pay-img"><img src="/resources/png/logo.png"></div>
		<div class="pay-option-1" >
			<input type="radio" name="amount" value="5000">5000원 / 50포인트
		</div>
		<div class="pay-option-2" >
			<input type="radio" name="amount" class="pay-option-2" value="10000">10,000원 / 110포인트 (+10%)
		</div>
		<div class="pay-option-3" >
			<input type="radio" name="amount" class="pay-option-3" value="20000">20,000원 / 222포인트 (+11%)
		</div>
		<div class="pay-option-4" >
			<input type="radio" name="amount" class="pay-option-4" value="30000">30,000원 / 336포인트 (+12%)
		</div>
		<div class="pay-option-5" >
			<input type="radio" name="amount" class="pay-option-5" value="50000">50,000원 / 570포인트 (+14%)
		</div>
	<button type="submit" class="homeBtn">Toss 결제</button>
</div>
	</form> -->


<form action="/pay/payments" method="post">
<div class="charge">
        <div class="five">
            <img src="/resources/png/point-5000.png" class="point-img">
            <p><img src="/resources/png/point.png" class="point">50</p>
            <p class="plus">&nbsp;</p>
            <p class="money">￦ 5,000</p>
            <input type="radio" name="amount" class="hide" id="five" value="5000">
        </div>
        
        <div class="ten">
            <img src="/resources/png/point-10000.png"  class="point-img">
            <p><img src="/resources/png/point.png" class="point">110</p>
            <p class="plus">(<img src="/resources/png/point.png" class="point">100 + <img src="/resources/png/point.png" class="point">10)</p>
            <p class="money">￦ 10,000</p>
            <input type="radio" name="amount" class="hide" id="ten" value="10000">
        </div>
        
        <div class="twenty">
            <img src="/resources/png/point-20000.png"  class="point-img">
            <p><img src="/resources/png/point.png" class="point">222</p>
            <p class="plus">(<img src="/resources/png/point.png" class="point">200 + <img src="/resources/png/point.png" class="point">22)</p>
            <p class="money">￦ 20,000</p>
            <input type="radio" name="amount" class="hide" id="twenty" value="20000">
        </div>
        
        <div class="thirty">
            <img src="/resources/png/point-30000.png"  class="point-img">
            <p><img src="/resources/png/point.png" class="point">336</p>
            <p class="plus">(<img src="/resources/png/point.png" class="point">300 + <img src="/resources/png/point.png" class="point">36)</p>
            <p class="money">￦ 30,000</p>
            <input type="radio" name="amount" class="hide" id="thirty" value="30000">
        </div>
        
       <div class="fifty">
            <img src="/resources/png/point-50000.png"  class="point-img">
            <p><img src="/resources/png/point.png" class="point">570</p>
            <p class="plus">(<img src="/resources/png/point.png" class="point">500 + <img src="/resources/png/point.png" class="point">70)</p>
            <p class="money">￦ 50,000</p>
            <input type="radio" name="amount" class="hide" id="fifty" value="50000">
        </div>
        
<!--         <div class="paymentbtn">Toss 결제</div> -->
        <button type="submit" class="paymentbtn">Toss 결제</button>
    </div>
</form>



<script>
	$('.five').on("click", function(event) {
		$("#five").prop("checked", true);
		$(".checked-true").removeClass("checked-true");
		$(this).addClass("checked-true");
	});

	$('.ten').on("click", function(event) {
		$("#ten").prop("checked", true);
		$(".checked-true").removeClass("checked-true");
		$(this).addClass("checked-true");
	});
	
	$('.twenty').on("click", function(event) {
		$("#twenty").prop("checked", true);
		$(".checked-true").removeClass("checked-true");
		$(this).addClass("checked-true");
	});

	$('.thirty').on("click", function(event) {
		$("#thirty").prop("checked", true);
		$(".checked-true").removeClass("checked-true");
		$(this).addClass("checked-true");
	});

	$('.fifty').on("click", function(event) {
		$("#fifty").prop("checked", true);
		$(".checked-true").removeClass("checked-true");
		$(this).addClass("checked-true");
		
	});
</script>






<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>