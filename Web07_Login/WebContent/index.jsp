<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	//id라는 키값으로 세션에 저장된 문자열이 있는지 읽어와 본다.
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	
<div class="container">
<%if(id!=null){%>
		<p>
			<a href="users/private/info.jsp"><%=id %></a><strong>님이 로그인중입니다.</strong>
			
			<a href="users/logout.jsp">로그아웃</a>
		</p>

	<%} %>
	<%--jstl 사용 --%>
<c:if test="${not empty id }">
	<p>
		<a href="users/private/info.jsp">${id }</a><strong>님이 로그인중입니다.</strong>
			
		<a href="users/logout.jsp">로그아웃</a>
	</p>
</c:if>
	<h1>인덱스페이지입니다.</h1>
	<ul>
		<li><a href="users/signup_form.jsp">회원가입</a></li>
		<li><a href="users/loginform.jsp">로그인</a></li>
		<li><a href="test/buy.jsp?code=111">1번 상품 구입 테스트</a></li>
		<li><a href="ajax/test01.jsp">Ajax테스트</a></li>
		<li><a href="ajax/test02.jsp">Ajax테스트2</a></li>
		<li><a href="ajax/test03.jsp">Ajax테스트3</a></li>
		<li><a href="file/list.jsp">자료실 목록 보기</a></li>
		<li><a href="gallery/test.jsp">이미지 업로드 테스트</a></li>
		<li><a href="gallery/test2.jsp">ajax이미지 업로드 테스트</a></li>	
		<li><a href="gallery/list.jsp">이미지 갤러리</a></li>	
		<li><a href="text/editer.jsp">스마트에디터테스트</a></li>
		<li><a href="cafe/list.jsp">카페 글 목록 보기</a></li>
		<li><a href="test/scroll.jsp">scroll테스트</a></li>
		<li><a href="test/cookie_form.jsp">cookie테스트01</a></li>
		<li><a href="test/cookie_form2.jsp">cookie테스트02</a></li>
		<li><a href="test/cookie_form3.jsp">cookie테스트03</a></li>
		<li><a href="test/popup.jsp">팝업 test01</a></li>
		<li><a href="test/popup2.jsp">팝업 test02</a></li>
		<li><a href="test/el_test.jsp">EL 테스트01</a></li>
		<li><a href="test/jstl_test.jsp">JSTL 테스트01</a></li>
	</ul>
</div>

</body>
</html>