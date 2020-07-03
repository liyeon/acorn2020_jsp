<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<li class="nav-item"><a
					href="${pageContext.request.contextPath }/board/list.jsp"
					class="nav-link">BOARD</a></li>
			</ul>
		</div>
	</div>
	
</body>
</html>