<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	
    	//폼 전송되는 가입할 회원의 정보를 읽어온다.
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	String email = request.getParameter("email");
    	//UsersDto객체에 회원정보를 담고
    	UsersDto dto = new UsersDto();
    	dto.setId(id);
    	dto.setPwd(pwd);
    	dto.setEmail(email);
    	//UsersDao 객체를 이용해서 DB에 저장한다
    	boolean isSuccess = UsersDao.getInstance().insert(dto);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/siginup.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p><strong><%=id %></strong>회원님이 가입되었습니다.</p>
		<a href="loginform.jsp">로그인하러가기</a>
	<%}else{ %>
		<p>가입이 실패하였습니다. <a href="signup_form.jsp">다시 가입하러가기</a></p>
	<%} %>
</body>
</html>