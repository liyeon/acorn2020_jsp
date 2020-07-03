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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/TTTogetherA.woff" />
<style>

*, a, td, h1{
	font-family: 'TTTogether'!important;
	font-weight: normal;
	font-style: normal;
}
</style>
</head>
<body>
	<div class="container mt-4 col-lg-8 col-md-10 col-sm-11">
	<div class="navbar navbar-expand-sm navbar-dark bg-warning mb-4">

				<a href="${pageContext.request.contextPath }/" class="navbar-brand">Acorn</a>
				<ul class="navbar-nav">
					<li class="nav-item active"><a href="${pageContext.request.contextPath }/member/list.jsp"
						class="nav-link">MEMBER</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/todo/list.jsp" class="nav-link">TODOList</a></li>
				</ul>

		</div>
	<h1>회원목록입니다.</h1>
	<table class="table table-hover table-bordered text-center">
	<colgroup>
		<col width="10%"/>
		<col width="20%"/>
		<col width=""/>
		<col width="15%"/>
		<col width="15%"/>
	</colgroup>
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp:list){%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getAddr() %></td>
				<td><a href="updateform.jsp?num=<%= tmp.getNum() %>" class="btn btn-info font-weight-bolder">수정</a></td>
				<td><a href="delete.jsp?num=<%= tmp.getNum() %>" class="btn btn-dark">삭제</a></td>
			</tr>
			
			
			<%}%>
		</tbody>
		
		
	</table>
	<a href="insertform.jsp">회원 추가하러가기</a>
	</div>
</body>
</html>