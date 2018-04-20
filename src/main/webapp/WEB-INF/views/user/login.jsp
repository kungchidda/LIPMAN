<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.html"%>
<link href="/resources/css/signin.css" rel="stylesheet">
</head>
<body>
	<form class="form-signin" action="/user/loginPost" method="post">
	
		<div class="form-group has-feedback">
			<input type="text" name="uid" class="form-control" placeholder="USER ID" required autofocus />
			<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		</div>
		
		<div class="form-group has-feedback">
			<input type="password" name="upw" class="form-control" placeholder="Password" required/>
			<span class="glyphicon glyphicon-lock form-control-feddback"></span>
		</div>
		
			<div class="checkbox">
				<label>
					<input type="checkbox" name="useCookie"> Remember me
				</label>
			</div><!-- /.col -->
	
		<div class="col-xs-4">
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</div><!-- /.col -->
		
			
	</form>

</body>
<%@ include file="/WEB-INF/views/include/footer.html"%>
</html>