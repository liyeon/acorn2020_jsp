<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
	// 할 일을 삭제해야 하는데 몇번 글을 삭제하는지
	
	//GET 방식 파라미터로 전달되는 삭제할 글 번호를 읽어와서 숫자로 바꿔준다.
	//getParameter는 무조건 String 으로 전달되기 때문에 Integer로 바꿔준다
	// delete.jsp?num=xx;
	
	//1. 삭제할 회원의 번호를 읽어온다.
	String reqNum = request.getParameter("num");
	int num = Integer.parseInt(reqNum);
	//2. MemberDao 객체를 이용해서 DB에서 실제로 삭제한다.
	MemberDao.getInstance().delete(num);
	//3. 응답한다.
	//리다이렉트 이동시키기 위해 context path를 먼저 읽어온다.
	String cPath=request.getContextPath();
	//회원 목록 보기 요청을 강요 하는 응답 (리다이렉트 이동시키기)
	response.sendRedirect(cPath+"/member/list.jsp");
	
%>
