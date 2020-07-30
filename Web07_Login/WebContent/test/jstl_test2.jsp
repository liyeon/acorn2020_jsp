<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%  //테스트를 위해 sample 데이터를 request영역에 담아 놓는다.
	List<String> names=new ArrayList<String>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	request.setAttribute("list", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/jstl_test2.jsp</title>
</head>
<body>
<%
	//request 영역에 "list" 라는 키값으로 담긴 값 얻어오기
	List<String> list = (List<String>)request.getAttribute("list");
	
%>
<h1>친구 목록입니다.</h1>
	<ul>
		<%for(String tmp:list){ %>
			<li><%=tmp %></li>
		<%} %>
	</ul>
<h1>친구 목록입니다.(EL+JSTL 활용)</h1>
	<ul>
	<%--<c:forEach var="tmp" items="${requestScope.list }"> --%>
		<c:forEach var="tmp" items="${list }" varStatus="status"> <%--status는 a,b 암거나 가능  숫자를 나타낼 때 사용한다. index값이 필요 할 때 사용--%>
			<li data-index="${status.index }">${tmp } <strong>${status.index }</strong></li>
			<%--자바스크립트에서 사용할 사용자 정의 속성 (data-index) --%>
		</c:forEach>
	</ul>
	
	
	<h1>친구 목록입니다. 순서표시</h1>
	<ul>
	<%--<c:forEach var="tmp" items="${requestScope.list }"> --%>
		<c:forEach var="tmp" items="${list }" varStatus="status"> <%--status는 a,b 암거나 가능  숫자를 나타낼 때 사용한다. index값이 필요 할 때 사용 count는 숫자가 1부터 시작--%>
			<li data-index="${status.count }">${tmp } <strong>${status.count }</strong></li>
			<%--자바스크립트에서 사용할 사용자 정의 속성 (data-index) --%>
		</c:forEach>
	</ul>
	
	<h1>친구 목록입니다. 첫번째인지여부</h1>
	<ul>
		<c:forEach var="tmp" items="${list }" varStatus="status">
			<li>${tmp } <strong>첫번째 : ${status.first }</strong></li>
		</c:forEach>
	</ul>
	
	<h1>친구 목록입니다. 마지막인지여부</h1>
	<ul>
		<c:forEach var="tmp" items="${list }" varStatus="status">
			<li>${tmp } <strong>마지막 : ${status.last }</strong></li>
		</c:forEach>
	</ul>
	<a href="jstl_test3.jsp">다음예제</a>
	
</body>
</html>