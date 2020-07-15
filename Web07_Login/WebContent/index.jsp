<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<%
	//id라는 키값으로 세션에 저장된 문자열이 있는지 읽어와 본다.
	String id = (String)session.getAttribute("id");
%>
<div class="container">
	<%if(id!=null){%>
		<p>
			<a href="users/private/info.jsp"><%=id %></a><strong>님이 로그인중입니다.</strong>
			
			<a href="users/logout.jsp">로그아웃</a>
		</p>

	<%} %>
	<h1>인덱스페이지입니다.</h1>
	<ul>
		<li><a href="users/signup_form.jsp">회원가입</a></li>
		<li><a href="users/loginform.jsp">로그인</a></li>
		<li><a href="test/buy.jsp?code=111">1번 상품 구입 테스트</a></li>
		<li><a href="ajax/test01.jsp">Ajax테스트</a></li>
		<li><a href="ajax/test02.jsp">Ajax테스트2</a></li>
		<li><a href="ajax/test03.jsp">Ajax테스트3</a></li>
		<li><a href="file/list.jsp">자료실 목록 보기</a></li>
	</ul>
</div>

</body>
</html>