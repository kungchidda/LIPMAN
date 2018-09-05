<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIPMAN</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
        .complete {
            display: grid;
            grid-template-columns: 150px 150px;
            grid-template-rows: 160px 50px;
            grid-template-areas: 
                "a a"
                "b b"
                "c d";
            justify-content: center;
            grid-row-gap: 10px;
            align-items: center;
            justify-items: center;
            padding-top: 50px;
        }
        
        .complete .complete-img {grid-area: a;}
        .complete .backBtn {grid-area: c;}
        .complete .homeBtn {grid-area: d;}
        
        .complete img {
            width: 150px;
        }
        
        .complete .complete-text {
            grid-area: b;
            font-size: 15px;
            text-align: center;
        }
        
        .complete-text img {
            width: 20px;
            vertical-align: -25%;
        }
        
        .backBtn, .homeBtn {
            width: 130px;
            padding: 10px;
            background-color: white;
            border: 1px solid black;
            color: black;
            border-radius: 5px;
            font-size: 15px;
        }
    </style>
</head>
<body>


<!-- 결제가 성공적으로 완료되었습니다. -->

 <div class="complete">
        <img src="/resources/png/complete-payment.png" class="complete-img">
        <p class="complete-text">
            <img src="/resources/png/point.png"> ${point}가 충전되었습니다.<br>
            감사합니다.
        </p>
        <button class="backBtn" onclick="location='/pay/charge'">
            Back
        </button>
        <button class="homeBtn" onclick="location='/sboard/list'">
            Home
        </button>
    </div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>