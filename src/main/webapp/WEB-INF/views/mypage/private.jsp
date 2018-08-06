<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIPMAN</title>

    <style>
        .secret {
            display: grid;
            grid-template-columns: 300px;
            grid-template-rows: 160px 40px;
            grid-template-areas: 
                "a"
                "b";
            justify-content: center;
            grid-row-gap: 10px;
            align-items: center;
            justify-items: center;
            padding-top: 50px;
        }
        
        .secret .error-img {
            grid-area: a;
        }
        
        .secret img {
            width: 150px;
        }
        
        .secret .secret-text {
            grid-area: b;
            font-size: 15px;
        }
        
        
    </style>


</head>
<body>
<div class="secret">
        <img src="/resources/png/secret.png" class="error-img">
		<p>사용자가 비공개로 설정하였습니다.</p>
</div>
</body>
</html>