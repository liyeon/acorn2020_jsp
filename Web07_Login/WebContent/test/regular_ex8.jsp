<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regular_ex8</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>

<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>
	//아래의 두 정규표현식은 같다.
	var reg1=/[0-9]/;
	var reg12=/[\d]/;
	
	//아래의 두 정규표현식은 같다. 숫자가 아닌 것
	var reg2=/[^0-9]/;
	var reg22=/[\D]/; //\d와 \D는 반대 개념이다.
	
	//아래의 두 정규표현식은 같다. 특수문자가 아닌 한글자
	var reg3=/[a-zA-Z0-9]/;
	var reg33=/[\w]/; 
	
	//아래의 두 정규표현식은 같다.
	var reg4=/[^a-zA-Z0-9]/;
	var reg44=/[\W]/;
	
	//공백(띄어쓰기, tab, 개행기호)를 찾는 정규 표현식
	var reg5=/[\s]/;
	//공백(띄어쓰기, tab, 개행기호)이 아닌 문자를 찾는 정규 표현식
	var reg6=/[\S]/;
	
	//new 를 이용한 정규표현식 객체 생성
	var reg7=/^[a-z].{4,9}$/;
	var reg77=new RegExp("^[a-z].{4,9}$"); //문자열로 만듬

	//abc문자를 global로 찾는 정규표현식 객체
	var reg8=/abc/g;
	var reg88=new RegExp("abc", "g");
	
	//특수문자가 아닌 한글자를 하나 이상
	var reg9=/^[\w]+$/;
	var reg99=new RegExp("^[\\w]+$");
	
	var str="abcd\"1234";
	//결과"abcd"1234"
	
</script>
</body>
</html>