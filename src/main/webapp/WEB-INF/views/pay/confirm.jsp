<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body>


유료컨텐츠입니다.
${boardVO.point} 포인트를 사용하여 감상하시겠습니까?

<button class="yesBtn do-not-close">YES</button>
<button onclick="location='javascript:history.back()'" class="backBtn">NO</button>


<script>
$(".yesBtn").on("click",function(event){
	
	if('${login.uid}' == ""){
		
		
		alert("로그인이 필요합니다");
//			location.href="/user/login";
//			$(window).scrollTop();
		$("body").animate({ // top값에 맞게 스크롤이 움직인다.
			"scrollTop": 0
		},300);
		$("#myPageBar").slideDown(300);
		
		event.preventDefault();
	}else{
		location.href='/sboard/readPage?bno=${boardVO.bno}'
	}
});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>