<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<title>LIPMAN</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/resources/header/css/fontello.css">

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<script src="/resources/header/bootstrap.min.js"></script>



<link rel="stylesheet" href="/resources/header/bootstrap.min.css">

<style>
body {
	font-family: '';
}

/*search bar*/
#custom-search-input {
	padding: 3px;
	border: solid 1px #E4E4E4;
	border-radius: 6px;
	background-color: #fff;
}

#custom-search-input input {
	border: 0;
	box-shadow: none;
}

#custom-search-input button {
	margin: 2px 0 0 0;
	background: none;
	box-shadow: none;
	border: 0;
	color: #666666;
	padding: 0 8px 0 10px;
	border-left: solid 1px #ccc;
}

#custom-search-input button:hover {
	border: 0;
	box-shadow: none;
	border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search {
	font-size: 23px;
}

/*login-form*/
.login-form {
	width: 340px;
	margin: 30px auto;
}

.login-form form {
	margin-bottom: 15px;
	background: #f7f7f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}

.login-form .hint-text {
	color: #777;
	padding-bottom: 15px;
	text-align: center;
}

.btn {
	min-height: 38px;
	border-radius: 2px;
}

.login-btn {
	font-size: 15px;
	font-weight: bold;
}

.or-seperator {
	margin: 20px 0 10px;
	text-align: center;
	border-top: 1px solid #ccc;
}

.or-seperator i {
	padding: 0 10px;
	background: #f7f7f7;
	position: relative;
	top: -11px;
	z-index: 1;
}

.social-btn .btn {
	margin: 10px 0;
	font-size: 15px;
	text-align: left;
	line-height: 24px;
}

.social-btn .btn i {
	float: left;
	margin: 4px 15px 0 5px;
	min-width: 15px;
}

.input-group-addon .fa {
	font-size: 18px;
}
</style>
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse"> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<a href="/sboard/list/" class="navbar-brand">LIPMAN</a>
			</div>
			<div class="navbar-collapse collapse navbar-right">
				<ul class="nav navbar-nav">

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-search"></i>
					</a>
						<ul class="dropdown-menu">
							<div class="container">
								<div id="custom-search-input">
									<div class="input-group">
										<input type="text" class="form-control input-lg" placeholder="Search Webtoon" /> <span
											class="input-group-btn">
											<button class="btn btn-info btn-lg" type="button">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
						</ul>
					</li>

						<li class="dropdown">
						<c:if test="${empty login}">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-user"></i></a>
						</c:if>
						<c:if test="${not empty login}">
							<a href="/mypage/home">${login.uname}</a>
						</c:if>
						<ul class="dropdown-menu">
							<c:if test="${empty login}">
								<div class="login-form">
									<form action="/user/loginPost" method="post">
										<h2 class="text-center">Sign in</h2>
										<div class="text-center social-btn">
											<a href="#" class="btn btn-primary btn-block"><i
												class="fa fa-facebook"></i> Sign in with <b>Facebook</b></a> <a
												href="#" class="btn btn-info btn-block"><i
												class="fa fa-twitter"></i> Sign in with <b>Twitter</b></a> <a
												href="#" class="btn btn-danger btn-block"><i
												class="fa fa-google"></i> Sign in with <b>Google</b></a>
										</div>
										<div class="or-seperator">
											<i>or</i>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user"></i></span>
												<input type="email" name="uid" class="form-control"
													placeholder="User ID" required="required" autofocus>
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-lock"></i></span>
												<input type="password" name="upw" class="form-control"
													placeholder="Password" required="required">
											</div>
										</div>
										<div class="form-group">
											<button type="submit"
												class="btn btn-success btn-block login-btn">Sign in</button>
										</div>
										<div class="clearfix">
											<label class="pull-left checkbox-inline"><input
												type="checkbox" name="useCookie"> Remember me</label> <a
												href="#" class="pull-right text-success">Forgot
												Password?</a>
										</div>

									</form>
									<div class="hint-text small">
										Don't have an account? <a href="#" class="text-success"
											id="joinPageBtn" onclick="window.location.href='/user/join'">Register
											Now!</a>
									</div>
								</div>
							</c:if>
							<%-- <c:if test="${not empty login}">
								<div class="form-group">
									<div class="input-group">
										<a class="btn btn-success btn-block login-btn"
											href="/user/logout">LOG OUT</a>
									</div>
								</div>
							</c:if> --%>
						</ul>
					</li>
				</ul>
			</div>

		</div>
	</div>

	<!--    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>-->
	<!--    <script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
	<!--        <script src="src/jquery.responsive-collapse.js"></script> -->

	<!--     <script type="text/javascript">
        $(window).load(function() {
            $('ul.navbar-nav').responsiveCollapse();
        });

    </script> -->
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>


</body>

</html>
