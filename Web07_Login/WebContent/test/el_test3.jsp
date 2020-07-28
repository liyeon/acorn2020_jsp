<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test3</title>
</head>
<body>
	<h1>EL을 이용해서 GET방식 파라미터 or POST방식 파라미터도 추출 할 수 있다. param.생략 불가</h1>
	<p>번호 : <strong>${param.num }</strong></p>
	<p>이름 : <strong>${param.name }</strong></p>
	<%--EL을 사용하지 않는다면 아래의 작업과 같다. --%>
	<%
		String num = request.getParameter("num");
		String name = request.getParameter("name");
		
	%>
	<p>번호 : <strong><%=num %></strong></p>
	<p>이름 : <strong><%=name %></strong></p>
	
	<h1>el을 이용해서 쿠키 value도 추출할수있다.</h1>
	<p>쿠키에 sendMsg라는 키값으로 저장되어있는지 여부 : <strong>${not empty cookie.savedMsg }</strong></p>
	<p>savedMsg 라는 키값으로 저장 된 값 : ${cookie.savedMsg.value }</p>
</body>
</html>