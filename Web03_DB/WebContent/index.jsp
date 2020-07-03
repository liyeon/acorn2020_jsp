<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<style>

	btn:hover{
	}
body {
	font-family: "NEXON Lv2 Gothic Bold!important";
}
</style>
<body>
	<div class="container mt-4">
		<div class="navbar navbar-expand-sm navbar-dark bg-warning mb-4">

				<a href="${pageContext.request.contextPath }/" class="navbar-brand">Acorn</a>
				<ul class="navbar-nav">
					<li class="nav-item"><a href="${pageContext.request.contextPath }/member/list.jsp"
						class="nav-link">MEMBER</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/todo/list.jsp" class="nav-link">TODOList</a></li>
				</ul>

		</div>
		<div class="jumbotron mt-5">
			<h1 class="display-4 font-weight-bolder">Index Page</h1>
			<hr class="my-4">
			<p class="lead">
			<ul class="list-inline">
				<li class="list-inline-item"><a href="${pageContext.request.contextPath }/member/list.jsp"
					class="btn btn-hover btn-dark">회원목록보기</a></li>
				<li class="list-inline-item"><a href="${pageContext.request.contextPath }/todo/list.jsp"
					class="btn btn-hover btn-dark">할 일 목록 보기</a></li>
			</ul>
			</p>
		</div>
	</div>



</body>
</html>