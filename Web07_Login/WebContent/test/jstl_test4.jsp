<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//test를 위해 sample data를 request 영역에 담기
	request.setAttribute("jumsu", 85);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/jstl_test4.jsp</title>
</head>
<body>
	<c:if test="${10%2 eq 0 }"> <%-- test안에가 true면 출력됨. 단일 if문만 존재한다. --%>
		<p>10은 짝수입니다.</p>
	</c:if>
	
	<c:if test="${10%2 eq 0 }"> <%-- test안에가 true면 출력됨. --%>
		<p>11은 짝수입니다.</p>
	</c:if>
	<%--session 영역에 id라는 키값으로 저장된 값이 비어있지 않는다면 (저장된 값이 있다면) (로그인된 상태라면) --%>
	<c:if test="${not empty sessionScope.id }">
		<p><strong>${id }</strong>님이 로그인 중입니다.!</p>
	</c:if>
	
	<p>획득한 점수 <strong>${jumsu }</strong>입니다. </p>
	<p>
		학점은
		<c:choose><%--다중 if --%>
			<c:when test="${jumsu ge 90 }">A</c:when><%-- if --%>
			<c:when test="${jumsu ge 80 }">B</c:when>
			<c:when test="${jumsu ge 70 }">C</c:when>
			<c:when test="${jumsu ge 60 }">D</c:when><%-- else if --%>
			<c:otherwise>E</c:otherwise> <%-- else --%>
		</c:choose>
	</p>
	
	<p>
		<strong>${jumsu }</strong>
		<c:choose>
			<c:when test="${jumsu%2 eq 0 }">
				<strong>짝수</strong>
			</c:when>
			<c:otherwise>
				<strong>홀수</strong>
			</c:otherwise>
		</c:choose>
		입니다.
	</p>
	<a href="jstl_test5.jsp">다음예제</a>
</body>
</html>