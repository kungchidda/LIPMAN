<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIPMAN</title>
    <%@ include file="/WEB-INF/views/include/header.jsp"%>

    <style>
        .authentication {
            display: grid;
            grid-template-columns: 300px;
            grid-template-rows: 160px 20px 20px;
            grid-template-areas: 
                "a"
                "b"
                "c";
            justify-content: center;
            grid-row-gap: 10px;
            align-items: center;
            justify-items: center;
            padding-top: 50px;
        }
        
        .authentication .authentication-img {
            grid-area: a;
        }
        
        .authentication img {
            width: 150px;
        }
        
        .authentication .authentication-text1 {
            grid-area: b;
            font-size: 15px;
        }
        
        .authentication .authentication-text2 {
            grid-area: c;
            font-size: 15px;
        }
        
    </style>
</head>

<body>

    <!-- authentication page -->
    <div class="authentication">
        <img src="/resources/png/authentication.png" class="authentication-img">
        <p class="authentication-text1">이메일 인증 중 오류가 발생하였습니다.</p><br>
        <p class="authentication-text2">다시 진행해주시기 바랍니다.</p>
    </div>


</body>

</html>
