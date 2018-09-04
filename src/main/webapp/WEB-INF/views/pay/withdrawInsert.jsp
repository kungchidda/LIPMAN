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
	
		
		
	<c:if test="${empty withdrawVO}">
	
 	<div id="tab_example">
 		<div class="firstwithdraw">
 			<p class="firstwithdraw-1">출금 신청시 개인 및 사업자 등록을 해야합니다.</p>
 			<p class="firstwithdraw-2">수집한 정보는 부가가치세법에 따라 세금계산서 발급 및 국세청 매출자료 제출 목적으로 사용됩니다.</p>
 		</div>
 		
 		<hr>
 		
        <ul class="tab"> 
            <li class="tab1"><a href="#t1"><p>개인</p></a></li>
            <li class="tab2"><a href="#t2"><p>사업자</p></a></li>
        </ul>
        
        
		<form class="registerForm" method="post" action="/pay/withdrawInsert">
			<div id="t1" class="tab1-content">
				<input type="hidden" name="uid" value='${login.uid}' required>
				<input type="hidden" name="type" value="1" required>
				<input type="number" name="registedNo" placeholder="주민등록번호를 입력해주세요.(숫자만)" class="number" required>
				<input type="text" placeholder="이름을 입력해주세요." class="name" name="ceoName" required>
				
				<div class="img-div1">신분증을 첨부해주세요.(정보가 가려지거나 편집되면 안됩니다.)</div>
				<input type="file" class="img-file1" style="display: none" required>
				<script>
					$(function(){
					    $(".img-div1").click(function(event){
					        event.preventDefault();
					        $(".img-file1").click();
					    });
					});
				</script>
				<input type="number" name="accountNo" placeholder="계좌번호를 입력해주세요." class="account" required>
				<input type="text" name="accountHolder" placeholder="예금주명을 입력해주세요." class="account-name" required>
				<select class="bank" name="bankName" required>
				    <option value="#"> 은행을 선택해주세요. </option>
				    <option value="kb"> 국민은행 </option>
				    <option value="woori"> 우리은행 </option>
				    <option value="hana"> 하나은행 </option>
				    <option value="kakao"> 카카오뱅크 </option>
				    <option value="newtown"> 새마을금고 </option>
				</select>
				<button type="submit" class="submit">Submit</button>
			</div>
		</form>

		
		<form class="registerForm" method="post" action="/pay/withdrawInsert">
		        <div id="t2" class="tab2-content">
		        	<input type="hidden" name="uid" value='${login.uid}' required>
		            <select name="type" class="select-company" required>
		                <option> 사업형태를 선택해주세요. </option>
		                <option value="2"> 개인사업자 </option>
		                <option value="3"> 법인사업자 </option>
		            </select>    
		            <input type="number" name="registedNo" placeholder="사업자등록번호를 입력해주세요.(숫자만)" class="number" required>
		            <input type="text" name="companyName" placeholder="사업자명을 입력해주세요." class="name" required>
		            <input type="text" name="ceoName" placeholder="대표자명을 입력해주세요." class="leader" required>
		            <select name="taxType" class="taxation">
		                <option value=""> 과세 형태를 선택해주세요. </option>
		                <option value="1"> 간이과세자 </option>
		                <option value="2"> 일반과세자 </option>
		            </select>
		            <div class="img-div2">사업자 등록증 사본을 업로드 해주세요.</div>
		            <input type="file" class="img-file2" style="display: none" required>
		            <script>
		                $(function(){
		                    $(".img-div2").click(function(event){
		                        event.preventDefault();
		                        $(".img-file2").click();
		                    });
		                });
		            </script> 
		            <select name="bankName" class="bank" required>
		                <option> 은행을 선택해주세요. </option>
						<option value="kb"> 국민은행 </option>
		                <option value="woori"> 우리은행 </option>
		                <option value="hana"> 하나은행 </option>
		                <option value="kakao"> 카카오뱅크 </option>
		                <option value="newtown"> 새마을금고 </option>
		            </select>               
		            <input type="number" name="accountNo" placeholder="계좌번호를 입력해주세요." class="account" required>
		            <input type="text" name="accountHolder" placeholder="예금주명을 입력해주세요." class="account-name" required>
		            <div class="account-div2">통장 사본을 업로드 해주세요.</div>
		            <input type="file" class="account-file2" style="display: none" required>
		            <script>
		                $(function(){
		                    $(".account-div2").click(function(event){
		                        event.preventDefault();
		                        $(".account-file2").click();
		                    });
		                });
		            </script>
		            <button type="submit" class="submit">Submit</button>
		        </div>
		</form>
    </div>
    </c:if>

<script>

var arr = [];
var deleteArr = [];
var checkUnload = true;

$(window).on("beforeunload", function(){
	if(checkUnload){

		console.log("arr.length = " + arr.length);
// 		console.log("listArr.length = " + listArr.length);
		
// 		deleteArr = arr.concat(arr);
		
		for(i=0; i<arr.length; i++){
			console.log("arr["+i+"] = " + arr[i]);
		}
		
		if(arr.length > 0){
			
			$.ajax({
				  type: 'POST',
				  url: "/deleteAllFiles",
				  data: {files:arr},
				  dataType : "text",
				  async:false,
				  success : function(result){
					}
				});
		}
		
		console.log("beforeunload event");
	}
	
});

// $(".img-file1, .img-file2, .account-file2").on("change", function(event) {
$("input[type='file']").on("change", function(event) {
	event.preventDefault();
	var target = $(this).prev();
	var files = event.target.files
	for(i=0; i<files.length; i++){
    	var file = event.target.files[i]
		uploadFile(file, target);
    }
});


function uploadFile(file, target){
	var formData = new FormData();
	
	formData.append("file", file);
	$.ajax({
		url : '/uploadAjax',
		data : formData,
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		success : function(data) {
			console.log("data = " + data);
			var fileInfo = getFileInfo(data);
			
// 			var html = template(fileInfo);

			arr.push(data);
				
			$(target).empty();
			var html = "<span class='uploadedList' data-src='"+fileInfo.fullName+"'>"+fileInfo.fileName+"</span>"
			$(target).append(html);
		}
	});
}

$(".registerForm").submit(function(event){
	event.preventDefault();
	checkUnload = false;
	
	
// 	arr.pop();
	console.log("arr.length = " + arr.length);
	
	
	var html ="";
	$(".uploadedList").each(function(index){
		console.log("index = " + index);
		
		if($(this).attr("data-src") != null){
			console.log("$(this).attr('data-src) = " + $(this).attr("data-src"));
			arr.splice(arr.indexOf($(this).attr("data-src")), 1);
			html += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src") +"'> ";
		}
		
	});
	
	for(i=0; i<arr.length; i++){
		console.log("arr["+i+"] = "+ arr[i]);
	}
	
	 if(arr.length > 0){
			$.ajax({
				  type: 'POST',
				  url: "/deleteAllFiles",
				  data: {files:arr},
				  dataType : "text",
				  async:false,
				  success : function(result){
					}
			});
	}
	

	$(this).append(html);
	$(this).get(0).submit();
});

$(".tab1").on("click", function(event) {
// 	$(".img-div1").empty().append("신분증을 첨부해주세요.(정보가 가려지거나 편집되면 안됩니다.)");
	$(".img-div2").empty().append("사업자 등록증 사본을 업로드 해주세요.");
	$(".account-div2").empty().append("통장 사본을 업로드 해주세요.");
});

$(".tab2").on("click", function(event) {
	$(".img-div1").empty().append("신분증을 첨부해주세요.(정보가 가려지거나 편집되면 안됩니다.)");
	/* $(".img-div2").empty().append("사업자 등록증 사본을 업로드 해주세요.");
	$(".account-div2").empty().append("통장 사본을 업로드 해주세요."); */
});


 

</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>