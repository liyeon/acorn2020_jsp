<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<h1>인덱스 페이지 입니다.</h1>
	<form action="test/insert.jsp" method="post">
		<input type="text" name="msg" placeholder="서버에 할 말을 입력하세요"/>
		<button type="submit">전송</button>
	</form>
	
	<%
		//로그인된 아이디 읽어오기
		String id=(String)session.getAttribute("id");
		
		
	%>
	
	<%if(id==null){ %>
	<a href="test/loginform.jsp">로그인하러가귀</a>
	<%}else{ %>
	<p><strong><%=id %></strong>님이 로그인 되었습니다. <a href="test/logout.jsp">로그아웃</a></p>
	<%} %>
	<ul>
		<li><a href="member/play.jsp">회원전용공간으로가기</a></li>
		<li><a href="member/study.jsp">회원전용공간으로가기2</a></li>
		<li><a href="member/buy.jsp?num=1?amount=10">구입하기</a></li>
	</ul>
</body>
</html>