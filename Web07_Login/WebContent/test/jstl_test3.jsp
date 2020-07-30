<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//Servlet 단에서 담은 sample 데이터라고 가정하자
	List<FileDto> list = new ArrayList<>();
	FileDto dto1 = new FileDto();
	dto1.setNum(1);
	dto1.setWriter("김구라");
	dto1.setTitle("제목");
	FileDto dto2 = new FileDto();
	dto2.setNum(2);
	dto2.setWriter("해골");
	dto2.setTitle("제목2");
	FileDto dto3 = new FileDto();
	dto3.setNum(3);
	dto3.setWriter("원숭잉");
	dto3.setTitle("제목3");
	
	list.add(dto1);
	list.add(dto2);
	list.add(dto3);
	
	//EL로 추출할수있도록 request 영역에 담는다.
	request.setAttribute("list", list);
	
	//어떤 키값으로 어떤 타입을 담았는지 기억을 해서 작업을 하는 것
	
	//DB칼럼에 저장된 문자열이라고 가정하자
	String hobby = "piano/game/reading";
	request.setAttribute("hobby", hobby);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/jstl_test3.jsp</title>
</head>
<body>
<h1>List에 들어있는 Dto 활용</h1>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
		</tr>
	</thead>
	<tbody>
		
		<c:forEach var ="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>${tmp.title }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<h1>취미입니다.</h1>
	<ul>
		<c:forTokens var="tmp" items="${hobby }" delims="/"><%--delims 구분자 --%>
			<li>${tmp }</li>
		</c:forTokens>
	</ul>
	
	<a href="jstl_test4.jsp">다음예제</a>
</body>
</html>