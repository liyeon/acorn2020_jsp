<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>time.jsp</title>
</head>
<body>
	<%//서비스 메소드 안 쪽
	//jsp 기본 객체
	
	Date d= new Date();
	String now = d.toString();
	//여기 있는 내용응 html에서 해석된 결과만 나옴
	%>
	<p>현재 시간 : <% out.print(now); %></p>
	<p>현재 시간 : <%= now%></p>
</body>
</html>