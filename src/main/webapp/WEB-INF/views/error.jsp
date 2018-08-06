<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
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
                "d e";
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
            justify-self: end;
        }
        
        .error .backBtn {
            grid-area: e;
            justify-self: start;
        }
        
        .homeBtn {
            width: 130px;
            padding: 10px;
            background-color: #489ad8;
            border: 1px solid #489ad8;
            color: white;
            border-radius: 5px;
            font-size: 15px;
            align: center;
        }
        
        .backBtn {
            width: 130px;
            padding: 10px;
            background-color: white;
            border: 1px solid #d3d3d3;
            color: gray;
            border-radius: 5px;
            font-size: 15px;
        }
        
    </style>
</head>


<body>
    
    
    
	<!-- error page -->
    <div class="error">
        <img src="/resources/png/error.png" class="error-img">
        <p class="error-text-1">서비스 에러가 발생했습니다.</p>
        <p class="error-text-2">서비스 이용에 불편을 드려 죄송합니다.</p>
        <!-- 		<button onclick="location='http://127.0.0.1:8080/sboard/list'" class="homeBtn">Home</button> -->
        <button onclick="location='https://lipman.app/sboard/list'" class="homeBtn">Home</button>
        <button onclick="location='javascript:history.back()'" class="backBtn">Back</button>
    </div>

	

</body>
</html>