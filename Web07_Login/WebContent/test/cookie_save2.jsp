<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //폼 전송 되는 문자열 읽어오기
    String msg = request.getParameter("msg");
	String encodedMsg=URLEncoder.encode(msg, "utf-8");
  //쿠키를 다 서버가 저장 핸 놨다가 클라이언트가 서버에 요청 할 때 쿠키 정보(키,벨류값으로 이루어짐)가 같이 서버에 넘어간다.
  //24시간 동안 요청 안 하기
  //1. 쿠키 객체 생성 new Cookie ("key", value);
  Cookie cook = new Cookie("savedMsg", encodedMsg);
  //2.쿠키 유지 시간 (초단위)
  cook.setMaxAge(60); //60초 테스트
  //3. HttpServletResponse 객체에 담는다.
  response.addCookie(cook);
  //4.응답할때쿠키가 자동으로 응답되고 클라이언트의 웹브라우저에 저장된다.
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/cookie_save_jsp</title>
</head>
<body>
<p>웹브라우저에 savedMsg라는 키값으로 "<%=msg %>를 저장했습니다.</p>
<a href="cookie_read2.jsp">저장된 문자열 확인해보기</a>
</body>
</html>