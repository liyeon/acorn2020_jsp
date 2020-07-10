<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//세션을 초기화해서 로그아웃 처리를 한다.
    	session.invalidate();
    	String cPath = request.getContextPath();
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
	<script>
	alert("로그아웃되었습니다.");
	
		location.href = "${pageContext.request.contextPath }/index.jsp";
	</script>
</body>
</html>