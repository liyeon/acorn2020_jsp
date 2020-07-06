<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	//1. form 전송 되는 수정할 회원의 정보를 읽어온다.
   	//한글 깨지지 않도록
   	request.setCharacterEncoding("utf-8");
    // 폼 전송되는 수정할 글의 정보를 읽어온다.
   	int num = Integer.parseInt(request.getParameter("num"));
   	String writer = request.getParameter("writer");
   	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
   	//BoardDto 객체에 수정할 글의 정보를 담는다.
   	//BoardDto dto = new BoardDto(num, writer, title, content, regdate);
   	BoardDto dto = new BoardDto();
   	dto.setNum(num);
   	dto.setWriter(writer);
   	dto.setTitle(title);
   	dto.setContent(content);
   	//BoardDao 객체를 이용해서 DB에 수정 반영하고 성공 여부를 리턴 받는다.
   	boolean isSuccess = BoardDao.getInstance().update(dto);

   	
   	//3. 응답한다.

   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("<%=dto.getNum() %> 번의 글을 수정했습니다." );
			location.href="detail.jsp?num=<%=num %>";
		</script>
	
	<%}else{ %>
		<script>
			alert("수정 실패!");
			location.href="updateform.jsp?num=<%=dto.getNum() %>";
		</script>
	
	<%}%>
</body>