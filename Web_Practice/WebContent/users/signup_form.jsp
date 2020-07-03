<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<style>
body{
		background-color: #25274d;//s
	}
	.contact{
		padding: 4%;
	}
	.col-md-3{
		background: #ff9b00;
		padding: 4%;
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}

	.contact-info img{
		margin-bottom: 15%;
	}
	
	.contact-info h2{
		font-size : 5rem;
		font-weight : 650;
	}
	.contact-info h1{
		font-size :7rem;
		font-weight : 650;
	}
	.col-md-9{
		background: #fff;
		padding: 3%;
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	.contact-form label, .contact-form legend{
		font-weight:600;
		font-size : 1rem;
	}
	
	.contact-form button{
		background: #25274d;
		color: #fff;
		font-weight: 600;
		width: 25%;
	}
	.contact-form button:last-child{
		background: #E2DCDB;
		color: #fff;
		font-weight: 600;
		width: 25%;
	}
	
	.contact-form button:focus{
		box-shadow:none;
	}
	.contact-form button:hover{
		color : #7277bb;
	}

</style>

</head>
<body>
	<div class="container contact mt-4 mb-3">
		<div class="row">
			<div class="col-md-3">
				<div class="contact-info">
					<h2>Sign</h2>
					<h1>UP</h1>
				</div>
			</div>
			<!-- col-md-3 -->
			<div class="col-md-9">
				<div class="contact-form">
					<form action="${pageContext.request.contextPath }/users/signup.jsp" method="post">
					
						<div class="form-group">
							<label class="control-label col-sm-2" for="id">아이디</label>
							<div class="col-sm-10">
							<input type="text" name="id" id="id" class="form-control"/>
							</div>
							<small id="emailHelp" class="form-text text-muted ml-3">다섯 글자 이상 입력하세요.</small>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">비밀번호</label>
							<div class="col-sm-10">
							<input type="password" name="pwd"id="pwd" class="form-control"/><br />
							</div>
						</div>
						
					
						
						
						<div class="form-group">        
				 		 <div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">가입</button>
						<button type="reset" class="btn btn-default" onclick = "location.href = ${pageContext.request.contextPath }/">취소</button>

						</div>
						</div>

					</form>
				</div>
				<!-- contact-form -->
			</div>
			<!-- col-md-9 -->
		</div>
		<!-- row -->
	</div>
</body>
</html>