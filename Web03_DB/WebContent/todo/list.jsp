<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
//MemberDao 객체의 참조값얻어오기
TodoDao dao = TodoDao.getInstance();
//DB에서 할 일 목록을 얻어온다.
List<TodoDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<style>
 table tr:nth-child(2n){
 	background : #5f5f5f;
 }
</style>
<body>
	<div class="container mt-4 col-lg-8 col-md-10 col-sm-11">
	<div class="navbar navbar-expand-sm navbar-dark bg-warning">

				<a href="${pageContext.request.contextPath }/" class="navbar-brand">Acorn</a>
				<ul class="navbar-nav">
					<li class="nav-item"><a href="${pageContext.request.contextPath }/member/list.jsp"
						class="nav-link">MEMBER</a></li>
					<li class="nav-item active"><a href="${pageContext.request.contextPath }/todo/list.jsp" class="nav-link">TODOList</a></li>
				</ul>

		</div>

		<h1>할 일 목록입니다.</h1>
		<form action="${pageContext.request.contextPath }/todo/insert.jsp" method="post">
			<div class="mb-5">
				<div class="form-group pb-3">
					<label class="control-label pl-3" for="work">할 일을 입력하세요</label>
					<div class="col-sm-10">
						<input type="text" name="work" id="work"
							class="form-control w-75 float-left" />
						<button type="submit" class="btn btn-dark float-left ml-1">추가</button>
					</div>
				</div>
			</div>
		</form>

		<table class="table table-dark table-hover table-bordered text-center table-sm">
		<colgroup>
			<col width="10%"/>
			<col width=""/>
			<col width="20%"/>
			<col width="10%"/>
		</colgroup>
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for (TodoDto tmp : list) {%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getWork()%></td>
					<td><%=tmp.getRegdate()%></td>
					<td><a href="delete.jsp?num=<%= tmp.getNum() %>" class="btn btn-warning font-weight-bolder">삭제</a></td>
				</tr>

				<%}%>

			</tbody>


		</table>

	</div>


</body>
</html>