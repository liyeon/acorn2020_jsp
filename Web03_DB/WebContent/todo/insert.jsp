<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//1. 폼 전송 되는 할 일을 읽어온다.
    	request.setCharacterEncoding("utf-8");
    	String work = request.getParameter("work");
    	//2. db에 저장한다.
    	TodoDao dao = TodoDao.getInstance();
    	TodoDto dto = new TodoDto();
		dao.insert(work);
    	//3. 클라이언트 웹브라우저에 응답한다.
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<p>할 일을 추가했습니다. <a href="list.jsp">확인하러가기</a></p>
</body>
</html>