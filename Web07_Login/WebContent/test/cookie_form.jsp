<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/cookie_from.jsp</title>
</head>
<body>
	<h1>쿠키 테스트</h1>
	<p>
	클라이언트의 웹브라우저에 특정 key값으로 문자열을 저장 할 수 있다.
	저장 할 수 있는 문자열은 Base64 인코딩 형식으로 64가지의 문자열을 저장 할 수 있다.
	</p>
	<form action="cookie_save.jsp" method="post">
		<label for="msg">웹브라우저(클라이언트)에 저장할 문자열</label>
		<input type="text" name="msg" id="msg" />
		<button type="submit">저장</button>
	</form>
</body>
</html>