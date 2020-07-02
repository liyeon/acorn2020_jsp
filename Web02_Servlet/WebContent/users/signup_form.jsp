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
	.contact-info{
		margin-top:30%;
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
	
	input[type = radio] {
	margin-right : 10px;
	}
	input[type = checkbox] {
	margin-right : 10px;
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
						
						<fieldset class="form-group">
							<legend class="control-label col-sm-3">성별 선택
							</legend>
							
							<div class="form-check">
							<label class="ml-3 form-check-label">
							<input class="form-check-input" type="radio" name="gender" value="woman" checked/> 	여
							</label>
							</div>
							
							<div class="form-check">
							<label class="ml-3 form-check-label">
							 <input class="form-check-input" type="radio" name="gender" value="man" />남
							</label>
							</div>
							
						</fieldset>
						
						<div class="form-group">
						<label class="control-label col-sm-2"  for="job">직업 선택</label><br />
						<div></div>
						<select name="job" id="job" class="form-control col-sm-5 ml-3">
							<option value="">선택</option>
							<option value="doctor">의사</option>
							<option value="programmer">프로그래머</option>
							<option value="etc">기타</option>
						</select>
						</div>
						
						<fieldset class="form-group">
						<legend class="control-label col-sm-3">관심사 체크</legend>
						
						<div class="form-check form-check-inline">
						<label class="ml-3 form-check-label">
							<input class="form-check-input" type="checkbox" name="like" value="java" checked/>자바
						</label>
						</div>
						
						<div class="form-check form-check-inline">
						<label class="ml-3 form-check-label">
							<input class="form-check-input" type="checkbox" name="like" value="javascript"/>자바스크립트
						</label>
						</div>
						
						<div class="form-check form-check-inline">
						<label class="ml-3 form-check-label">
							<input class="form-check-input" type="checkbox" name="like" value="css" />스타일
								시트
						</label>
						</div>
						</fieldset>
						
						
						<div class="form-group">
						<label class="control-label col-sm-5" for="comment">하고싶은말</label><br />
						<textarea name="comment" id="comment" class="form-control col-sm-10 ml-3" rows="10"></textarea>
						</div>
						
						
						<div class="form-group">        
				 		 <div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">가입</button>
						<button type="reset" class="btn btn-default">취소</button>

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