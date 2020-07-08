<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/member.jsp</title>
</head>
<body>
	<%
	//request 영역에 "dto"라는 키값으로 담긴 MemberDto 객체의 참조값 얻어내기
		MemberDto dto = (MemberDto)request.getAttribute("dto");
	int num = dto.getNum();
	String name = dto.getName();
	String addr = dto.getAddr();
%>
	<p>번호 : <%= num%>, 이름 : <%= name%>, 주소 : <%= addr%></p>
</body>
</html>