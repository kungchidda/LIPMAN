<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIPMAN</title>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

    <style>
        .error {
            display: grid;
            grid-template-columns: 300px 300px;
            grid-template-rows: 180px 40px 30px 50px;
            grid-template-areas: 
                "a a"
                "b b"
                "c c"
                "d d";
            justify-content: center;
            grid-row-gap: 10px;
            grid-column-gap: 10px;
            align-items: center;
            justify-items: center;
            padding-top: 50px;
        }
        
        .error .error-img {
            grid-area: a;
        }
        
        .error img {
            width: 150px;
        }
        
        .error .error-text-1 {
            grid-area: b;
            font-size: 30px;
        }
        
        .error .error-text-2 {
            grid-area: c;
            font-size: 15px;
        }
        
        .error .homeBtn {
            grid-area: d;
        }
        
        .homeBtn {
            width: 130px;
            padding: 10px;
            background-color: #489ad8;
            border: 1px solid #489ad8;
            color: white;
            border-radius: 5px;
            font-size: 15px;
        }
        
        
    </style>
</head>

<body>

    <!-- error page -->
    <div class="error">
        <img src="/resources/png/send.png" class="error-img">
        <p class="error-text-1">이메일로 임시 비밀번호를 발송하였습니다.</p>
        <p class="error-text-2">임시 비밀번호로 로그인을 하여 주시기 바랍니다.</p>
        <!-- 		<button onclick="location='http://127.0.0.1:8080/sboard/list'" class="homeBtn">Home</button> -->
        <button onclick="location='https://lipman.app/sboard/list'" class="homeBtn">Home</button>
    </div>
    


    


</body>

</html>
