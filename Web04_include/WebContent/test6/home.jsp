<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test6/home.jsp</title>
<%--include 된 페이지에 필요한 css도 여기서 로딩을 해야한다. --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
</head>
<body>
	<%--include 될 jsp페이지는 반드시 상대 경로로 찾아가야한다. --%>
	<%-- thisPage라는 파라미터 명으로 home이라는 문자열 전달하기 --%>
	<jsp:include page="../include/navbar3.jsp">
		<jsp:param value="home" name="thisPage"/>
	</jsp:include>
	<div class="container">
	<h1><strong>home.jsp입니다.</strong></h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam reprehenderit unde ratione ipsa fugiat voluptatem pariatur cumque iste eum doloremque aperiam aut quibusdam delectus error provident cum dolorem culpa illum.</p>
	
	</div>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>