<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//1. 폼전송되는 아이디 비밀번호를 읽어온다.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//2. DB에서 해당 회원정보가 있는지 select를 해본다.
	boolean isValid = false;//유효한 정보인지의 여부
	if (id.equals("gura") && pwd.equals("1234")) {//가상의 유효한 정보라고 가정
	isValid = true;
	//로그인 했다는 의미에서 세션영역에 id라는 키값으로 아이디를 담는다.
	session.setAttribute("id", id);
	}
//3. 회원정보가 맞으면 로그인 처리 후 응답, 틀리면 로그인 실패라고 응답한다.
/*
	똑같은 요청을 하더래도 세션영역에 아이디가 있는지의 여부에 따라 로그인을 했는지 안 했는지를 알 수 있다.
	로그인 한 사람과 안 한 사람의 index페이지 값이 달라질 수 있다.
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/login.jsp</title>
</head>
<body>
	
	<%if(isValid){ %>
		<p><%=id %>님이 로그인 되었습니다. <a href="../index.jsp">확인</a></p>
	<%}else{ %>
		<p>아이디 혹은 비밀번호가 틀려요<a href="loginform.jsp">다시시도</a></p>
	<%} %>
</body>
</html>