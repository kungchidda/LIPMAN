<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>

<link href="/resources/css/pay.css" rel="stylesheet">
<link href="/resources/css/mypage.css" rel="stylesheet">
<script src="/resources/js/subscribe-check.js"></script>

<link href="/resources/css/userList.css" rel="stylesheet">
    <script>
    $(document).ready(function() {
            $("#tab_example").tabs();
        });
    </script>
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
				<input type="hidden" name="uid" value='${cri.uid}'>
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
					<img src="/resources/png/charge-g.png" id="charge">
				</a>
			</div>
			<div class="mypage-withdraw">
				<a href="/pay/withdraw">
					<img src="/resources/png/exchange.png" id="withdraw">
				</a>
			</div>
	</div>
	
	<script>
		        	$(document).ready(function() {
		        		$(".select-company").val('${withdrawVO.type}');
		        		$(".taxation").val('${withdrawVO.taxType}');
		        		$(".bank").val('${withdrawVO.bankName}');
		        	});
		        	</script>
		        	
	<c:if test="${withdrawVO.status == '0'}">
		<div class="withdraw">
        <img src="/resources/png/exchange.png" class="withdraw-img">
        <p class="withdraw-text">
            신청해주셔서 감사합니다.<br>
            검토 후 이메일로 결과를 전달드리겠습니다.
        </p>
    </div>
	</c:if>
	<c:if test="${withdrawVO.status == '1'}">
	<c:if test="${withdrawVO.type == '1'}">
		<form class="registerForm" method="post" action="/pay/withdrawInsert">
			<div id="t1" class="tab1-content tab1-withdraw">
				<input type="hidden" name="uid" value='${login.uid}' required>
				<input type="hidden" name="type" value="1" required>
				<input type="number" name="registedNo" placeholder="주민등록번호를 입력해주세요.(숫자만)" class="number hide" value="${withdrawVO.registedNo}" required readonly>
				<input type="text" name="ceoName" placeholder="이름을 입력해주세요." class="name hide" value="${withdrawVO.ceoName}" required readonly>
				
				<!-- <div class="img-div1">신분증을 첨부해주세요.(정보가 가려지거나 편집되면 안됩니다.)</div>
				<input type="file" class="img-file1" style="display: none" required>
				<script>
					$(function(){
					    $(".img-div1").click(function(event){
					        event.preventDefault();
					        $(".img-file1").click();
					    });
					});
				</script> -->
				<p class="withdraw-accounttext">계좌번호</p>
				<input type="number" name="accountNo" placeholder="계좌번호를 입력해주세요." class="account withdraw-account" value="${withdrawVO.registedNo}" required readonly>
				<p class="withdraw-nametext">예금주명</p>
				<input type="text" name="accountHolder" placeholder="예금주명을 입력해주세요." class="account-name withdraw-name" value="${withdrawVO.accountHolder}" required readonly>
				<p class="withdraw-banktext">은행</p>
				<select class="bank withdraw-bank" name="bankName" required disabled>
				    <option value="#"> 은행을 선택해주세요. </option>
				    <option value="kb"> 국민은행 </option>
				    <option value="woori"> 우리은행 </option>
				    <option value="hana"> 하나은행 </option>
				    <option value="kakao"> 카카오뱅크 </option>
				    <option value="newtown"> 새마을금고 </option>
				</select>
				<a href="/pay/withdrawModify" class="modify">
					<div>출금 정보 수정</div>				
				</a>
			</div>
		</form>
		<hr>
			<div class="withdraw">
				<div class="had-pointtext">
					보유 포인트
				</div>
				<div class="had-point">
					<img class="dropbtn searchFunction" src="/resources/png/point.png">
	        		<a href="/pay/history">
		        		<span class="totalPoint-span"></span>
		        	</a>
				</div>
				<div class="withdraw-pointtext">
					출금 포인트
				</div>
				<input type="number" class="withdraw-point" placeholder="100포인트가 최소입니다.">
				<div class="withdraw-moneytext">
					출금액 
				</div>
				<input type="text" class="withdraw-money">
				<a href="/pay/withdrawModify" class="apply">
					<div>출금 신청</div>
				</a>
			</div>
	</c:if>
		<c:if test="${withdrawVO.type != '1'}">
			<form class="registerForm" method="post" action="/pay/withdrawInsert">
		        <div id="t1" class="tab2-content tab2-withdraw">
		        	<input type="hidden" name="uid" value='${login.uid}' required readonly>
		            <p class="withdraw-componytext">사업형태</p>
		            <select name="type" class="select-company withdraw-compony" required disabled>
		                <option> 사업형태를 선택해주세요. </option>
		                <option value="2"> 개인사업자 </option>
		                <option value="3"> 법인사업자 </option>
		            </select>
		            <p class="withdraw-componynumbertext">사업자등록번호</p>    
		            <input type="number" name="registedNo" placeholder="사업자등록번호를 입력해주세요.(숫자만)" class="number withdraw-componynumber" value="${withdrawVO.registedNo}" required readonly>
		            <p class="withdraw-componynametext">사업자명</p>  
		            <input type="text" name="companyName" placeholder="사업자명을 입력해주세요." class="name withdraw-componyname" value="${withdrawVO.companyName}" required readonly>
		            <p class="withdraw-leadertext">대표자명</p>
		            <input type="text" name="ceoName" placeholder="대표자명을 입력해주세요." class="leader withdraw-leader" value="${withdrawVO.ceoName}" required readonly>
		            <p class="withdraw-taxationtext">과세형태</p>
		            <select name="taxType" class="taxation withdraw-taxation" required disabled>
		                <option value=""> 과세형태를 선택해주세요. </option>
		                <option value="1"> 간이과세자 </option>
		                <option value="2"> 일반과세자 </option>
		            </select>
 		           <!--  <div class="img-div2">사업자 등록증 사본을 업로드 해주세요.</div>
		            <input type="file" class="img-file2" style="display: none" required>
		            <script>
		                $(function(){
		                    $(".img-div2").click(function(event){
		                        event.preventDefault();
		                        $(".img-file2").click();
		                    });
		                });
		            </script> --> 
		            <p class="withdraw-banktext">은행</p>
		            <select name="bankName" class="bank withdraw-bank" required disabled>
		                <option> 은행을 선택해주세요. </option>
						<option value="kb"> 국민은행 </option>
		                <option value="woori"> 우리은행 </option>
		                <option value="hana"> 하나은행 </option>
		                <option value="kakao"> 카카오뱅크 </option>
		                <option value="newtown"> 새마을금고 </option>
		            </select>    
		            <p class="withdraw-accountext">은행계좌번호</p>           
		            <input type="number" name="accountNo" placeholder="계좌번호를 입력해주세요." class="account withdraw-account" value="${withdrawVO.accountNo}" required readonly>
		            <p class="withdraw-nametext">예금주명</p>
		            <input type="text" name="accountHolder" placeholder="예금주명을 입력해주세요." class="account-name withdraw-name" value="${withdrawVO.accountHolder}" required readonly>
<!-- 		            <div class="account-div2">통장 사본을 업로드 해주세요.</div> -->
		            <!-- <input type="file" class="account-file2" style="display: none" required>
		            <script>
		                $(function(){
		                    $(".account-div2").click(function(event){
		                        event.preventDefault();
		                        $(".account-file2").click();
		                    });
		                });
		            </script> -->
					<a href="/pay/withdrawModify" class="modify">
						<div>출금 정보 수정</div>				
					</a>
		        </div>
		</form>
<<<<<<< HEAD
		<hr>
			<div class="withdraw">
				<div class="had-pointtext">
					보유 포인트
				</div>
				<div class="had-point">
					<img class="dropbtn searchFunction" src="/resources/png/point.png">
	        		<a href="/pay/history">
		        		<span class="totalPoint-span"></span>
		        	</a>
				</div>
				<div class="withdraw-pointtext">
					출금 포인트
				</div>
				<input type="number" class="withdraw-point" placeholder="100포인트가 최소입니다.">
				<div class="withdraw-moneytext">
					출금액 
				</div>
				<input type="text" class="withdraw-money">
				<a href="/pay/withdrawModify" class="apply">
					<div>출금 신청</div>
				</a>
			</div>
=======
		<form class="registerForm" method="post" action="/pay/withdrawExecute">
		<div><span class="withdraw-totalPoint"> Point</span></div>
		<div><input type="number" name='point' class="withdraw-point" placeholder="Point" min="100"></div>
		<div><span class="withdraw-won"></span></div>
		<div><button type="submit" class="submit">Submit</button></div>
		</form>
>>>>>>> HONG
		</c:if>
	</c:if>
	
	<script>
	var result = '${msg}';

	if (result == 'ERROR') {
		alert("처리 중 에러가 발생하였습니다.");
	}
	
	var uid = '${login.uid}';
	$.ajax({
		type : 'post',
		url : "/pay/totalPoint/",
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST" },
		dataType : 'JSON',
		data : JSON.stringify({uid:uid}),
		async: false,
		success:function(result){
				$(".withdraw-totalPoint").before(result);
				$(".withdraw-point").attr("max",result);
		}
	});
	
	$(".withdraw-point").on("change", function(event) {
		var point = $(".withdraw-point").val();
		var won = point * 100 * 0.7;
		won = won + "원";
		$(".withdraw-won").empty();
		$(".withdraw-won").append(won);
	});

	</script>
	
		
		

<script>
	 if('${login.uid}' != ""){
		 console.log("login.uid != null");
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
	    	
	    	var uid = '${login.uid}';
	    	$.ajax({
	    		type : 'post',
	    		url : "/pay/totalPoint/",
	    		headers : {
	    			"Content-Type" : "application/json",
	    			"X-HTTP-Method-Override" : "POST" },
	    		dataType : 'JSON',
	    		data : JSON.stringify({uid:uid}),
	    		async: false,
	    		success:function(result){
	    				$(".totalPoint-span").before(result);
	    		}
	    	});
	    }
	</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>