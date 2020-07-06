<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//GET 방식 파라미터로 전달되는 자세히 보여줄 글의 번호 읽어오기 ?num=xxx
    	int num = Integer.parseInt(request.getParameter("num"));
    	
    	//BoardDao 객체를 이용해서 해당 글의 정보를 얻어온다.
    	BoardDto dto = BoardDao.getInstance().getData(num);
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/detail.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />

<style>
@font-face { font-family: 'MaplestoryOTFBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff') format('woff'); font-weight: normal; font-style: normal; }
	h1,pre {
		font-family: 'MaplestoryOTFBold';
	}
</style>
</head>
<body>
	<div class="container mt-4">
		<h1>글 자세히 보기  페이지 입니다.</h1>
		<table class="table table-hover ">
		
		<colgroup>
			<col width="10%" />
			<col width="" />
		</colgroup>
			<tr class="thead-dark">
				<th>글번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr class="thead-dark">
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr class="thead-dark">
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr class="thead-dark">
				<th>내용</th>
				<td><pre class="font-weight-bold h6"><%=dto.getContent() %></pre></td>
			</tr>
			<tr>
				<td colspan="2">
					<a class="btn btn-info" href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
					<a class="btn btn-warning" href="javascript:deleteConfirm(<%=dto.getNum()%>)">삭제</a>
				</td>
			</tr>
			
		</table>
		
		
		

	</div>
	
	
	<script>
		function deleteConfirm(num){
			var isDelete=confirm(num+" 번 글을 삭제하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}
			
		}
	</script>
</body>
</html>