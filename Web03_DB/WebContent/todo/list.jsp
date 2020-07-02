<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
//MemberDao 객체의 참조값얻어오기
TodoDao dao = TodoDao.getInstance();
//회원목록 얻어오기
List<TodoDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
	<div class="container mt-4 col-lg-8 col-md-10 col-sm-11">


		<h1>할 일 목록입니다.</h1>
		<form action="${pageContext.request.contextPath }/todo/insert.jsp" method="post">
			<div class="mb-5">
				<div class="form-group pb-3">
					<label class="control-label" for="work">할 일을 입력하세요</label>
					<div class="col-sm-10">
						<input type="text" name="work" id="work"
							class="form-control w-75 float-left" />
						<button type="submit" class="btn btn-dark float-left ml-1">추가</button>
					</div>
				</div>
			</div>
		</form>

		<table class="table table-hover table-bordered text-center">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (TodoDto tmp : list) {
				%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getWork()%></td>
					<td><%=tmp.getRegdate()%></td>
					<td><a href="delete.jsp?num=<%= tmp.getNum() %>">삭제</a></td>
				</tr>

				<%}%>

			</tbody>


		</table>

	</div>
</body>
</html>