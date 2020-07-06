<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	//BoardDao객체를 이용해서 글 목록 얻오오기
	 	List<BoardDto> list = BoardDao.getInstance().getList();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<style>
@font-face { font-family: 'netmarbleB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.1/netmarbleB.woff') format('woff'); font-weight: normal; font-style: normal; }
h1, td, a, th{
	font-family: 'netmarbleB';
}

</style>
<body>
<div class="container mt-4">
<h1>글 목록 입니다.</h1>
	<table class="table table-hover table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%for(BoardDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>		
					<td><%=tmp.getWriter() %></td>
					<td><a href="detail.jsp?num=<%=tmp.getNum()%>" class="text-secondary"><%=tmp.getTitle() %></a></td>
					<td><%=tmp.getRegdate() %></td>		
				</tr>
			<%} %>
		</tbody>
	</table>
	
	<a href="insertform.jsp">글 작성하기</a>

</div>
	
	
</body>
</html>