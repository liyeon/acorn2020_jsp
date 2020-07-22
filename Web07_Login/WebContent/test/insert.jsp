<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/insert.jsp</title>
<style>
	#content{
		width : 100%;
		height : auto;
		box-shadow : 0px 0px 10px 2px #cccccc8c;
		padding : 30px;
	}
	#content img{
		max-width : 100%;
		height : auto;
	}
	
	
</style>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
	
	<div class="container mt-4 pt-4">
	<%
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(content);
				
	%>
		<h1 class="mb-4 pb-4"><%=title %></h1>
		<div id="content" class="mb-4"><%=content %></div>
		
	
	</div>
	</body>
</html>