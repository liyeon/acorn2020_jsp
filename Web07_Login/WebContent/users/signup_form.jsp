<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup_form.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
	<div class="container">
	<h1>회원가입폼입니다.</h1>
		<form action="signup.jsp" method="post" class="">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" name="email" id="email" class="form-control" />
			</div>
			<button type="submit" class="btn btn-info">가입</button>
		</form>
	</div>
</body>
</html>