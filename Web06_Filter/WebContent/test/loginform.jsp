<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/loginform.jsp</title>
</head>
<body>
	<h3>로그인폼</h3>
	<form action="login.jsp" method="post">
		<input type="text" name="id" placeholder="아이디를 입력해주세요!" /> <input
			type="password" name="pwd" placeholder="비밀번호를 입력해주세요!" />
		<button type="submit">로그인</button>
	</form>
</body>
</html>