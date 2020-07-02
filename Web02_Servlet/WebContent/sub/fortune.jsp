<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/sub/fortune.jsp  오늘의 운세</title>
</head>
<body>
	<%
	//sample 운세 5개 미리 배열에 준비하기
	String[] fortunes = new String[5];
	fortunes[0] = "길가다 똥밟을거에요";
	fortunes[1] = "로또 사세요";
	fortunes[2] = "하늘을 조심하세요";
	fortunes[3] = "귀인을 만날겁니다.";
	fortunes[4] = "물을 조심하세요";
	//Random 객체
	Random ran = new Random();
	//0~4사이의 랜덤한 정수얻어내기
	int ranNum = ran.nextInt(5);
	int ranNum2 = ran.nextInt(5) + 1;
	%>
<h1>오늘의 운세! :<%=fortunes[ranNum]%></h1>
<img src="../images/puff<%=ranNum2%>.png" alt="" />
</body>
</html>