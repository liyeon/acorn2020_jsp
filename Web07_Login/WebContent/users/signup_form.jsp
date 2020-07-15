<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup_form.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="container">
	<h1>회원가입폼입니다.</h1>
		<form action="signup.jsp" method="post" id="myForm" class="" >
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" class="form-control"/>
				<button id="checkBtn" class="btn btn-warning">중복확인</button>
				<span id="checkResult"></span>
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" name="email" id="email" class="form-control" />
			</div>
			<button type="submit" class="btn btn-info">가입</button>
		</form>
	</div>
	
	<script>
		//아이디 중복 확인을 통과 했는지 여부
		var canUseId = false;
	
		//중복확인 버튼을 눌렀을 때 실행 할 함수 등록
		$("#checkBtn").on("click", function(){
			//입력한 아이디를 읽어온다.
			var inputId=$("#id").val();
			//ajax를이용해서 서버에 보낸 후 결과를 응답 받는다.
			$.ajax({
				method:"GET",
				url:"checkid.jsp",
				data:"inputId="+inputId,
				success:function(data){
					//data => {isExist:true} or {isExist:false}인 object이다
				if(data.isExist){
					//이미 존재하는 아이디임으로 사용 불가
					$("#checkResult").text("사용불가").css("color","red");
					//아이디가 사용 불가하다고 표시한다.
					canUseId = false;
					
				}else{//사용가능
					$("#checkResult").text("사용가능").css("color","blue");
					//아이디가 사용 가능 하다고 표시한다.
					canUseId = true;
				}
				}//success
			});
			//form 안에 있는 일반 버튼을 눌러도 폼이 전송 되기 때문에 폼 전송을 막아준다.
			return false;
				
		});
		//폼발리데이션?
		//폼에 submit 이벤트가 일어 났을 때 호출 될 함수 등록
		
		//실행순서가 false면 항상 여기로 들어온다.
		$("#myForm").on("submit", function(){
			if(!canUseId){//사용 불가능한 아이디면
				alert("아이디 중복을 확인하세요");
			return false;//폼제출막기
				
			}
		});
	</script>
	
</body>
</html>