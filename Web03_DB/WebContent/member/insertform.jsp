<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
<style>
body {
	background-color: #313131;
	margin: 0 auto;
}

.content {
	background: #3f426fc2;
	width: 500px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 20px rgb(0, 0, 0);
	margin-top: 50px;
}

h1, label {
	color: #fff;
}
button{
	width : 49.5%;
}
</style>
</head>
<body>



	<div class="container mt-4">
		<h1>회원정보추가폼입니다.</h1>
		<div class="content">
			<form action="insert.jsp" method="post">
				<div class="form-group">
					<label class="control-label font-weight-bolder" for="name">이름</label> <input
						type="text" name="name" id="name" class="form-control" /><br />
				</div>
				<div class="form-group">
					<label class="control-label font-weight-bolder" for="addr">주소</label> <input
						type="text" name="addr" id="addr" class="form-control" /><br />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary font-weight-bolder"
						style="background: #6387ad; border-color: #6387ad;">추가</button>
					<button type="reset" onclick = "location.href = '${pageContext.request.contextPath }/member/list.jsp'" class="btn btn-light font-weight-bolder">취소</button>
				</div>
			</form>

		</div>
	</div>
</body>
</html>