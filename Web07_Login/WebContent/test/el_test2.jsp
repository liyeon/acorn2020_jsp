<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String myName = "김구라";
     //page scope에 "myName"이라는 키값으로 myNmae을 담는다.
     //pageScope에 담은 값은 해당 페이지(jsp )내에서만 사용 가능하다/
     pageContext.setAttribute("myName", myName);
     
     String yourName="원숭이";
	/*
		request scope에 "yourName"이라는 키값으로 yourName 담기
		request scope에 담은 값은 응답하기 전까지 사용 할 수 있다.
		(다른 페이지로 forward 이동해도 사용 할 수 있다.)
		(다른페이지로 redirect 이동하면 사용 할 수 없다.)
	*/  
	request.setAttribute("yourName", yourName);
	
	String ourName="해골";
	/*
		session scope에 "ourName" 이라는 키값으로 ourName 담기
		session scope에 담은 값은 세션이 유지되는 동안 사용 할 수 있다.
		(다른 페이지로 forward, redirect 이동해도 사용 할 수 있다.)
		(웹브라우저를 닫거나 세션을 초기화 하기 전까지 사용 할 수 있다.)
	*/
	session.setAttribute("ourName", ourName);

	String companyName="에이콘";
	/*
		application scope에 "companyName" 이라는 키값으로 companyName 담기
		application scope에 담은 내용은 서버를 끄기 전까지 사용 할 수 없다.
		(웹브라우저를 닫아도 지워지지 않는다.)
	*/
	application.setAttribute("companyName", companyName);	
	
	CafeDto dto = new CafeDto();
	dto.setNum(1);
	dto.setTitle("원숭이");
	dto.setContent("원숭이 주제에");
	/*
		request 영역에 "dto"라는 키값으로 CafeDto type인 dto담기
		
	*/
	request.setAttribute("dto", dto);
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/el_test2.jsp</title>
</head>
<body>
	<h1>EL로 page scope에 저장된 값 추출</h1>
	<p>내 이름은 <strong><%=myName %></strong></p>
	<p>내 이름은 <strong>${pageScope.myName }</strong></p>
	<p>내 이름은 <strong>${myName }</strong></p>
	
	<h1>EL로 request scope에 저장된 값 추출</h1>
	<p>너의 이름은 <strong>${requestScope.yourName }</strong></p>
	<p>너의 이름은 <strong>${yourName }</strong></p>
	
	<h1>EL로 session scope에 저장된 값 추출</h1>
	<p>우리 이름은 <strong>${sessionScope.ourName }</strong></p>
	<p>우리 이름은 <strong>${ourName }</strong></p>
	
	
	<h1>EL로 application scope에 저장된 값 추출</h1>
	<p>우리 이름은 <strong>${applicationScope.companyName }</strong></p>
	<p>우리 이름은 <strong>${companyName }</strong></p>
	
	<h1>El request scope에 담긴 dto의 값 추출</h1>
	<p>번호 : ${requestScope.dto.getNum() }</p>
	<p>번호 : ${dto.getNum() }</p>
	<p>번호 : ${dto.num }</p>
	
	<p>제목 : ${requestScope.dto.getTitle() }</p>
	<p>제목 : ${dto.getTitle() }</p>
	<p>제목 : ${dto.title }</p>
	
	<p> 내용: ${requestScope.dto.getContent() }</p>
	<p> 내용 : ${dto.getContent() }</p>
	<p> 내용 : ${dto.content }</p>
	
	<h1>El을 사용하지 않는다면 번거롭다.</h1>
	<%--만일 El을 사용하지 않는다면 아래와 같은 작업이 필요하다. --%>
	<% CafeDto dto2= (CafeDto)request.getAttribute("dto"); %>
	<p>내용 : <%=dto2.getContent() %></p>
	
	<a href="el_test3.jsp?num=1&name=kimgura">다음예제</a>
</body>
</html>