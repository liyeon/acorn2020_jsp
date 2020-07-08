<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test6/study.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
<jsp:include page="../include/navbar3.jsp">
		<jsp:param value="study" name="thisPage"/>
	</jsp:include>
	
	
	<div class="container">
	<h1><strong>studt.jsp입니다.</strong></h1>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>