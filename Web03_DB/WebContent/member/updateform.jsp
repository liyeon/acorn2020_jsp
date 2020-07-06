<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	     request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	//1. get방식 파라미터로 전달되는 수정할 회원의 번호를 읽어온다.
		String reqNum = request.getParameter("num");
		int num = Integer.parseInt(reqNum);
	//2. db에서 해당 회원 한명의 정보를 읽어온다.
		MemberDao dao= MemberDao.getInstance();
		MemberDto dto = dao.getData(num);
	//3. 읽어온 회원 한명의 정보를 form에 출력해서 응답한다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateform</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
<div class="navbar navbar-expand-sm navbar-dark bg-info mb-4">

				<a href="${pageContext.request.contextPath }/" class="navbar-brand">Acorn</a>
				<ul class="navbar-nav">
					<li class="nav-item active"><a href="${pageContext.request.contextPath }/member/list.jsp"
						class="nav-link">MEMBER</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/todo/list.jsp" class="nav-link">TODOList</a></li>
				</ul>

		</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="../index.jsp">HOME</a></li>
		<li class="breadcrumb-item"><a href="list.jsp">회원목록</a></li>
		<li class="breadcrumb-item active"><a>수정 양식</a></li>
	</ol>

	<div class="container">
		<h1>회원정보 수정 폼 입니다.</h1>
		<form action="update.jsp" method="post">
		<%-- 주석!! JSP 페이지에서만 사용 가능한 주석  클라이언트에서도 출력 불가
			form을 제출 했을 때 회원의 번호가 전송 되도록 input type="hidden"에 회원 번호를 출력해놓는다.
			jps
		--%>
		
		<div class="form-group">
		<label for="num">번호</label>
			<!-- 눈에 보이지는 않지만 submit, 서버에 전송 했을 시 번호도 같이 전송이된다. -->
			<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
			<input type="text" id="num" class="form-control" value="<%=dto.getNum() %>" disabled />
			<!-- disabled 속성이 추가된 input 요소는 수정이 불가하고 form을 제출 했을 때 전송도 되지 않는다. 
			웹브라우저가 무시하는 주석
			-->
		</div>
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" name="name" id="name" class="form-control" value="<%=dto.getName() %>" />
		</div>
		<div class="form-group">
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr" class="form-control" value="<%=dto.getAddr() %>" />
		</div>
			
			
			
			
			
			
			<button class="btn btn-outline-primary btn-sm" type="submit">수정</button>
			<button class="btn btn-outline-warning btn-sm" type="reset">취소</button>
		</form>
	</div>
</body>
</html>