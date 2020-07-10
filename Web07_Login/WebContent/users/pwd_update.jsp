<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   	 	String pwd= request.getParameter("pwd");
    	String pwd2=(String)session.getAttribute("pwd");
    	String newPwd = request.getParameter("newPwd");
    	String newPwd2 = request.getParameter("newPwd2");
    	
    	if(pwd == pwd2){
    		
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/pwd_update.jsp]</title>
</head>
<body>

</body>
</html>