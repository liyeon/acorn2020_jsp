<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 //MemberDao 객체의 참조값얻어오기
 	MemberDao dao = MemberDao.getInstance();
 //회원목록 얻어오기
 	List<MemberDto> list = dao.getList();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
	<div class="container mt-4 col-lg-8 col-md-10 col-sm-11">
	<h1>회원목록입니다.</h1>
	<table class="table table-hover table-bordered text-center">
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp:list){%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getAddr() %></td>
			</tr>
			
			
			<%}%>
		</tbody>
		
		
	</table>
	
	</div>
</body>
</html>