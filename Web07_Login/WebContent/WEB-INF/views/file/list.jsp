<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/file/list</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
<div class="container mt-4">
<h1>파일 목록 불러오기</h1>
	<table class="table table-dark">
	 <tr>
		<th>번호</th>
		<th>이름</th>
		<th>제목</th>
		<th>파일 이름</th>
		<th>파일크기</th>
		<th>날짜</th>
	</tr>

		<c:forEach var="tmp" items="${list }">
		<tr>
			<td>${tmp.num }</td>
			<td>${tmp.writer }</td>
			<td>${tmp.title }</td>
			<td>${tmp.orgFileName }</td>
			<td>${tmp.fileSize }</td>
			<td>${tmp.regdate }</td>
		</tr>
		</c:forEach>
		</table>
</div>
</body>
</html>