<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>MANIFUL</title>
<link href="/resources/css/signin.css" rel="stylesheet">

</head>
<body>

	<form class="form-signin" id="registerForm" role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">E-mail</label>
				<input type="email" name='uid' class="form-control" placeholder="Enter E-mail">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Password</label>
				<Input type="password" name="upw" class="form-control" placeholder="Enter Password">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">User name</label>
				<Input type="text" name="uname" class="form-control" placeholder="Enter User name">
			</div>
			
		</div>
		<!-- /.box-body -->

		<div class="col-xs-4">
			<button type="submit" class="btn btn-primary btn-block">Submit</button>
		</div>
	</form>

	
	<%@ include file="/WEB-INF/views/include/footer.html"%>

</body>
</html>