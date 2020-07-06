<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//GET 방식 파라미터로 전달되는 수정할 글의 번호를 읽어온다. ?num=xx
    	int num = Integer.parseInt(request.getParameter("num"));
    	
    	//BoardDao 객체를 이용해서 수정할 글의 정보를 얻어온다.
    	BoardDto dto = BoardDao.getInstance().getData(num);
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/updateform.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
<div class="container">
		<h1>글 수정 폼 입니다.</h1>
		<form action="update.jsp" method="post">
		<div class="form-group">
			<label for="num">글 번호</label>
			<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
			<input type="text" name="num" id="num" class="form-control" value="<%=dto.getNum() %>" disabled/>
		</div>
		<div class="form-group">
			<label for="writer">작성자</label>
			<input type="text" name="writer" id="writer" class="form-control" value="<%=dto.getWriter() %>" />
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" name="title" id="title" class="form-control" value="<%=dto.getTitle() %>" />
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea name="content" id="content" class="form-control" rows="20"> <%=dto.getContent() %> </textarea>
		</div>

			<button class="btn btn-primary btn-sm" type="submit">수정확인</button>
			<button class="btn btn-warning btn-sm" type="reset">취소</button>
		</form>
	</div>
	

</body>
</html>