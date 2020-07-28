<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/popup_page2.jsp</title>
<style>
	body{background : yellow;}
</style>
</head>
<body>
<h3>팝업된 페이지입니다.</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam repudiandae provident ipsa eligendi consectetur mollitia explicabo adipisci labore at magnam iste sequi ducimus vero sapiente quis optio odit. Illum libero.</p>
	<form action="popup_save.jsp" method="post">
	<label for="">
		<input type="checkbox" name="canPopup" value="no" />
		1분동안 팝업띄우지 않기
	</label>
	<button type="submit">닫기</button>
	</form>
	
</body>
</html>