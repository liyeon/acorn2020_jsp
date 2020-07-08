<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%--
    		include 디렉티브를 이용해서 jsp 페이지를 include하면
    		해당 페이지에 include 된 jsp 페이지가 합처져서 jsp 페이지가 만들어진다.
    		결국 실행 시점에 사용되는 jsp페이지는 1개만 사용된다. = 서블릿이 하나만 만들어짐 따로 작성했다는 의미만 가짐
    		
    	--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/main.jsp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>main.jsp 페이지 입니다.</h1>
	<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus facilis sequi ratione, quidem minima nobis. Maiores ut, iusto expedita quibusdam assumenda harum magni nam dolorem perferendis sit at itaque reprehenderit.</p>
	<a href="other.jsp">다른 페이지</a>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>