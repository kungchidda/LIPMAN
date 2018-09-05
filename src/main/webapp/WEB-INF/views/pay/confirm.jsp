<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
        * {
            margin: 0;
        }
        
        .check {
            display: grid;
            grid-template-columns: 180px 180px;
            grid-template-rows: 200px 50px 30px 30px 20px; 50px;
            grid-template-areas: 
                "a a"
                "b b"
                "c c"
                "d d"
                ". ."
                "e f";
            justify-content: center;
            justify-items: center;
            align-items: center;
            padding-top: 50px;
        }
        
        .check .subimg {
            grid-area: a;
            width: 200px;
/*             border: 1px solid #d3d3d3; */
            border-radius: 5px;
        }
        
        .check .subtitle {grid-area: b;}
        .check .text-1 {grid-area: c;}
        .check .text-2 {grid-area: d;}
        .check .cancel {grid-area: e;}
        .check .payment {grid-area: f;}
        
        .check .pointimg {
            width: 20px;
            vertical-align: -25%;
        }
        
        .check .cancel, .payment {
            width: 170px;
            height: 43px;
            border: 1px solid black;
            border-radius: 5px;
            padding: 10px;            
            font-size: 15px;
            background-color: white;
        }
        
        
    </style>
</head>
<body>


<%-- 유료컨텐츠입니다.
${boardVO.point} 포인트를 사용하여 감상하시겠습니까?

<button class="yesBtn do-not-close">YES</button>
<button onclick="location='javascript:history.back()'" class="backBtn">NO</button> --%>



<div class="check">
        <img src="/resources/png/point.png" class="subimg">
        <p class="subtitle">${boardVO.subtitle}</p>
        <p class="text-1">유료컨텐츠입니다.</p>
        <p class="text-2">
            <img src="/resources/png/point.png" class="pointimg"> ${boardVO.point}를 사용하여 감상하시겠습니까?
        </p>
        <button onclick="location='javascript:history.back()'" class="cancel backBtn">Cancel</button>
        <button class="payment yesBtn do-not-close">
            <img src="/resources/png/point.png" class="pointimg"> ${boardVO.point} 사용
        </button>
    </div>



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