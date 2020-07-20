<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gallery/list.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
<style>
	.wrapper{margin : 20px;width : 300px; height : 300px;border : 1px solid #d0d0d0;text-align : center;display : inline-block; float : left;}
	.img-wrapper{margin-top : 7px;width : 95%; height :220px; display : inline-block;}
	.img-wrapper img{width : 100%; height : 100%; object-fit : cover;}
</style>
</head>
<body>
<%
	List<GalleryDto> list=GalleryDao.getInstance().getList();
%>
<div class="container">
<a href="private/upload_form.jsp">업로드하러가기</a>
	<h1>갤러리 목록입니다.</h1>
	<%for(GalleryDto tmp:list){ %>
		<div class="wrapper">
		<div class="img-wrapper">
			<img src="${pageContext.request.contextPath }<%=tmp.getImagePath() %>" alt="" />
			</div>
			<p><%=tmp.getCaption() %></p>
			<p>
				<strong><%=tmp.getWriter() %></strong>
				<i><%=tmp.getRegdate() %></i>
			</p>
		</div>
	
	<%} %>
	
	
</div>
</body>
</html>