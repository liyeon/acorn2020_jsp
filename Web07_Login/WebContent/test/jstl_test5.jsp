<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <%--format 숫자의 형식을 지정 할 수 있다. --%>
<%
//sample 데이터
	request.setAttribute("size", 123456789);
request.setAttribute("price", 2500000);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/jstl_test5.jsp</title>
</head>
<body>
<h1>숫자 포맷을 도와주는 fmt 사용하기</h1>
<p>
	파일의 크기는 <fmt:formatNumber value="123456789" pattern="#,###"/> byte
</p>
<p>
	파일의 크기는 <fmt:formatNumber value="${size }" pattern="#,###" /> byte
</p>
<p>
	가격은 <fmt:formatNumber value="2500000" type="currency"/>입니다. <%--currency 화폐 --%>
</p>
<p>
	가격은 <fmt:formatNumber value="${price }" type="currency"/>입니다. <%--currency 화폐 --%>
</p>

<p>
	가격은 <fmt:formatNumber value="${price }" type="currency" currencySymbol="$"/>입니다. <%--currency 화폐 --%>
</p>
<form action="jstl_test6.jsp" method="post">
	<textarea name="content" id="" cols="30" rows="5"></textarea><br />
	<button type="submit">전송 후 다음 예제로 이동</button>
</form>

</body>
</html>