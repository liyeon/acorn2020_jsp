<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regular_ex4</title>
<style>
	.error-feedback{
		color:red;
		font-size : 10px;
		display : none;
		}
</style>
</head>
<body>
<h1>regular Expression4 테스트</h1>
<form action="insert.jsp" method="post" id="myForm">
	<label for="id">아이디</label>
	<input type="text" id="id" name="id" placeholder="아이디입력"/>
	<div id="idFeedback" class="error-feedback">영문자 소문자로 시작을 하고 최소 5글자에서 최대 10글자 이내로 작성하세요</div>
	<br />
	
	<label for="phone">휴대폰 번호</label>
	<input type="text" id="phone" name="phone" placeholder="010-1111-2222" />
	<div id="phoneFeedback" class="error-feedback">휴대폰 번호 형식에 맞게 입력해주세요!</div>
	<button type="submit">가입</button>
</form>
<a href="regular_ex5.jsp">다음예제</a>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>
	//아이디를 검증 할 수 있는 정규 표현식 영문 소문자로 시작, 최소 5~10글자
	var reg_id = /^[a-z].{4,9}$/;
	
	var reg_phone = /^010-[0-9]{4}-[0-9]{4}$/;
	//id 유효성
	var isIdValid=false;
	//phone 유효성
	var isPhoneValid=false;
	//form 유효성
	var isFormValid=false;
	
	//form에 submit 이벤트가 일어 났을 때
	$("#myForm").on("submit", function(){
		
		//입력한 아이디를 읽어와서 검증한다.
		var inputId = $("#id").val();
		isIdValid =reg_id.test(inputId); 
		//입력한 전화번호를 읽어와서 검증한다.
		var inputPhone = $("#phone").val();
		isPhoneValid=reg_phone.test(inputPhone);
		
		//폼전체의 유효성 여부
		isFormValid=isIdValid && isPhoneValid;
		
		//만일 입력한 아이디가 아이디검증 정규표현식과 부합되지 않으면
		if(!isIdValid){
			//1. 에러 메세지를 띄우고
			//alert("영문자 소문자로 시작을 하고 최소 5글자에서 최대 10글자 이내로 작성하세요");
			$("#idFeedback").show();
			//2. 잘못 입력한 곳으로 focus 해주고
			$("#id").focus();
			//3. 폼이 전송 되지 않도록 막아준다.
			return false;
		};
		//전화번호가 유효하지 않다면
		if(!isPhoneValid){
			$("#phoneFeedback").show();
			$("#phone").focus();
			return false;
		};
		
		
	});
</script>
</body>
</html>