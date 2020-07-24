<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my_form.jsp</title>
</head>
<body>
	<form action="save.jsp" method="post" id="myForm">
		<label for="name">이름</label>
		<input type="text" name="name" id="name" />
		<br />
		<label for="phone">전화번호</label>
		<input type="text" name="phone" id="phone" />
		<button type="submit">전송</button>
	</form>
	<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
	<script>
	$("#myForm").on("submit", function(){
		var action = $(this).attr("action"); 
		var method = $(this).attr("method");
		var query=$(this).serialize();
		//console.log(query);
		$.ajax({
			method:method,
			url:action, 
			data:query,
			success:function(data){
				console.log(data);
			}
		});
		return false;
	});
</script>
</body>
</html>