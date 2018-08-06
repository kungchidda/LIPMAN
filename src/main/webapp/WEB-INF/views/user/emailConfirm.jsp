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
            grid-template-columns: 200px 200px;
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
        
        .error span {
            color: #f95e3a;
        }
        
    </style>
</head>

<body>

    <!-- error page -->
    <div class="error">
        <img src="/resources/png/welcome.png" class="error-img">
        <p class="error-text-1">진심으로 환영합니다!!!</p>
        <p class="error-text-2"><span>이메일 인증 후</span> 이용해 주시기 바랍니다!</p>
        <button class="homeBtn">Home</button>
    </div>
    

</body>

</html>
