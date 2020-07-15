<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//ajax 전송 파라미터를 읽어온다.(data : "checkId="+checkId)
    	String inputId = request.getParameter("inputId");
    	//UsersDao를 이용해서 해당 아이디가 존재하는지 여부를 리턴받는다.
    	boolean isExist = UsersDao.getInstance().isExist(inputId);
    %>
{"isExist":<%=isExist %>}    


<%--
	위에거가object로바껴서 들어간다.
	success : function(data){
		//data => {isExist:true} or {isExist:false}
		object로 바꿀 때 오류가 나면 들어오지 않는다.
	}
--%>