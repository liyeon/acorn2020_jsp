<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/delete.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	// 할 일을 삭제해야 하는데 몇번 글을 삭제하는지
	
	//GET 방식 파라미터로 전달되는 삭제할 글 번호를 읽어와서 숫자로 바꿔준다.
	//getParameter는 무조건 String 으로 전달되기 때문에 Integer로 바꿔준다
	// delete.jsp?num=xx;
	String reqNum = request.getParameter("num");
	int num = Integer.parseInt(reqNum);
	//DB에서 실제로 삭제한다.
	TodoDao.getInstance().delete(num);
	//응답한다.
	
%>
<script>
	alert("삭제했습니다.");
	//javascript를 이용해서 클라이언트에게 특정 경로로 요청을 다시 하도록 강요하기
	location.href="${pageContext.request.contextPath }/todo/list.jsp"; // 이 경로로 요청을 다시 한다.
	//클라이언트의 웹브라우저 이동을 강요한다.
</script>
</body>
</html>