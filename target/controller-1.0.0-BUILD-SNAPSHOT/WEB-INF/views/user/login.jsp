<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>Insert title here</title>
<link href="/resources/css/signin.css" rel="stylesheet">
</head>
<body>
	<form class="form-signin" action="/user/loginPost" method="post">
		<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->

		<div class="form-group has-feedback">
			<input type="email" name="uid" class="form-control"
				placeholder="USER ID" required autofocus /> <span
				class="glyphicon glyphicon-envelope form-control-feedback"></span>
		</div>

		<div class="form-group has-feedback">
			<input type="password" name="upw" class="form-control"
				placeholder="Password" required /> <span
				class="glyphicon glyphicon-lock form-control-feddback"></span>
		</div>

		<div class="checkbox">
			<label> <input type="checkbox" name="useCookie">
				Remember me
			</label>
		</div>
		<!-- /.col -->

		<div class="col-xs-4">
			<button type="submit" class="btn btn-lg btn-primary btn-block">Sign in</button>
		</div>
	</form>
	
	<div class="col-xs-4 form-signin">
		<button type="submit" class="btn btn-lg btn-default btn-block" id="joinPageBtn" onclick="window.location.href='/user/join'">Join in</button>
	</div>
	<!-- /.col -->

</body>
<%@ include file="/WEB-INF/views/include/footer.html"%>
</html>