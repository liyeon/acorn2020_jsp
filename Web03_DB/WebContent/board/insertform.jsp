<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insertform.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>새 글 작성 폼입니다.</h1>

		<form action="insert.jsp" method="post">
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text" name="writer"
					id="writer" class="form-control" />
			</div>

			<div class="form-group">
				<label for="title">제목</label> <input type="text" name="title"
					id="title" class="form-control" />
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea name="content" id="content" class="form-control" rows="20"></textarea>
			</div>

			<div class="form-group">
				<input type="submit" value="등록" class="btn btn-info" />
				<input type="reset" value="취소" class="btn btn-warning" />
			</div>


		</form>

	</div>

</body>
</html>