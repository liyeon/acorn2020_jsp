<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax/test03.jsp</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
</head>
<body>
	<h1>form에 입력한 내용을 Ajax요청으로 전송하는 예제</h1>
	<form action="insert.jsp" method="post" id="myForm">
		<input type="text" name="email" placeholder="이메일을 입력하세요!" />
		<input type="text" name="phone" placeholder="전화번호를 입력하세요!" />
		<button type="submit">전송</button>
	</form>
	<script>
		$("#myForm").on("submit", function(){
			var action = $(this).attr("action"); //action속성의 value값
			var method = $(this).attr("method"); //method 속성의 value값
			//쿼리스트링은 입력한 내용이 -> 형식으로 바뀐다. email=xxx&phone=xxx 형식의 문자열이 읽어와진다.
			var query=$(this).serialize(); // 폼에 입력한 값을 query String으로 읽어오기
			console.log(query);
			//ajax요청을 통해 폼에 입력한 내용을 전송한다.
			$.ajax({
				method:method,//method:"post"
				url:action, // url:"insert.jsp"
				data:query, //data : "email=xxx&phone=xxx"
				success:function(data){
					console.log(data);
				}
			});
			
			return false; // 폼 전송을 강제로 막아버림
		});
	</script>
</body>
</html>