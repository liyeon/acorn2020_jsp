<%@page import="test.board.dao.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	BoardDao dao = BoardDao.getInstance();
	List<BoardDto> list = dao.getList();
	
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<div class="navbar navbar-expand-sm navbar-dark bg-dark mb-4">
		<div class="container">
			<a href="${pageContext.request.contextPath }/" class="navbar-brand">Acorn_liyeon</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a
					href="${pageContext.request.contextPath }/users/signup_form.jsp"
					class="nav-link">LOGIN</a></li>
				<li class="nav-item active"><a
					href="${pageContext.request.contextPath }/board/list.jsp"
					class="nav-link">BOARD</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<h1>게시판</h1>
		<a href="insert.jsp">입력하기</a>


		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			
			<%for(BoardDto tmp:list){%>
			<tr>
			<td><%=tmp.getNum() %></td>
			<td><%=tmp.getTitle() %></td>
			<td><%=tmp.getName() %></td>
			<td><%=tmp.getRegdate() %></td>
			<td><a href="updateform.jsp?num=<%= tmp.getNum() %>" class="btn btn-info font-weight-bolder">수정</a></td>
			<td><a href="delete.jsp?num=<%= tmp.getNum() %>" class="btn btn-dark">삭제</a></td>
			</tr>
			<%}%>


		</table>


	</div>



</body>
</html>