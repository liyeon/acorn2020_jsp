<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /include/navbar2.jsp --%>
<%
	//파라미터로 전달되는 thisPage의 value값 읽어내기
	String thisPage = request.getParameter("thisPage");
%>
	<%if(thisPage.equals("home")){%>
		<div class="navbar navbar-expand-sm navbar-dark bg-warning mb-4">
	<div class="container">
		<a href="${pageContext.request.contextPath }/" class="navbar-brand">Acorn</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a
				href="${pageContext.request.contextPath }/test6/home.jsp"
				class="nav-link active">HOME</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath }/test6/game.jsp"
				class="nav-link">GAME</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath }/test6/study.jsp"
				class="nav-link">STUDY</a></li>
		</ul>
	</div>
</div>
		
	<%}else if(thisPage.equals("game")){%>
		<div class="navbar navbar-expand-sm navbar-dark bg-warning mb-4">
	<div class="container">
		<a href="${pageContext.request.contextPath }/" class="navbar-brand">Acorn</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a
				href="${pageContext.request.contextPath }/test6/home.jsp"
				class="nav-link">HOME</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath }/test6/game.jsp"
				class="nav-link active">GAME</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath }/test6/study.jsp"
				class="nav-link">STUDY</a></li>
		</ul>
	</div>
</div>
	<%}else if(thisPage.equals("study")){%>
		<div class="navbar navbar-expand-sm navbar-dark bg-warning mb-4">
	<div class="container">
		<a href="${pageContext.request.contextPath }/" class="navbar-brand">Acorn</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a
				href="${pageContext.request.contextPath }/test6/home.jsp"
				class="nav-link">HOME</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath }/test6/game.jsp"
				class="nav-link">GAME</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath }/test6/study.jsp"
				class="nav-link active">STUDY</a></li>
		</ul>
	</div>
</div>
	<%}%>

