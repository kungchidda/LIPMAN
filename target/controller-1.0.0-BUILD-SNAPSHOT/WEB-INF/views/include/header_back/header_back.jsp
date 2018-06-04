<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MANIFUL</title>

<!-- Bootstrap core CSS -->
<!-- <link href="/resources/bootstrap/4-col-portfolio/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->

<!-- Custom styles for this template -->
<!-- <link href="/resources/bootstrap/4-col-portfolio/css/4-col-portfolio.css" rel="stylesheet"> -->
	
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <script src="/resources/js/jQuery/jquery-3.3.1.min.js"></script>
    
    <link href="/resources/css/nav.css" rel="stylesheet">
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/sboard/list">LIPMAN</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="/sboard/list">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/mypage/home">My Page</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
					<c:if test="${not empty login}">
						<li class="nav-item"><a class="nav-link" href="/user/logout">LOG OUT</a></li>
					</c:if>
					<c:if test="${empty login}">
						<li class="nav-item"><a class="nav-link" href="/user/login">LOG IN</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

<!-- <div class="navbar">
  <a href="#home">Home</a>
  <a href="#news">News</a>
  <div class="dropdown">
    <button class="dropbtn">Dropdown 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </div> 
</div> -->



</body>

</html>
