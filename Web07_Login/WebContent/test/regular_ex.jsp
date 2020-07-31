
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regular_ex</title>
</head>
<body>
<h1>regular Expression 테스트</h1>
<input type="text" id="id" placeholder="아이디를 입력해주세요!" />
<button id="checkBtn">가입</button>
<p>영문자 소문자로 시작하고 5~10글자 이내, 특수문자를 하나 이상 입력하세요? </p>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>
	//영문자 소문자로 시작하는지 여부를 알아 낼 수 있는 정규 표현식 객체
	var reg1=/^[a-z]/;
	//최소 5글자 최대 10글자 인지 여부를 검증 할 수 있는 정규 표현식 객체
	var reg2=/^.{5,10}$/; //최소 5개 10개 이하
	//매칭 되는 문자열의 앞과 뒤는 겹치는게 없어야해서 시작과 끝을 꼭 명시해줘야한다.
	//매칭되는게 존재 할 뿐더러 그거 외에 다른게 없어야 돼서 명시 해줘라ㅡㅡ 그러래ㅡㅡ
	
	//특수문자가 포함되어 있는지 여부를 검증 할 수 있는 정규 표현식 객체
	var reg3=/[^a-zA-Z0-9]/; //특수문자인 한글자
	
	//영문자 소문자 시작 + 최소 5글자 최대 10글자인지 여부를 검증 할 수 있는 정규 표현식
	var reg4=/^[a-z].{4,9}$/; //아무거나 한글자가 최소 4, 최대 9
	
	//버튼을 클릭 했을 때 실행할 함수 등록
	$("#checkBtn").on("click", function(){
		//1. 입력한 문자열을 읽어와서
		var str=$("#id").val();
		//2. 검증한다.
		var result1=reg1.test(str);
		if(result1){
			alert("영문자 소문자로 시작했습니다.");
		}
		
		var result2=reg2.test(str);
		if(result2){
			alert("최소 5글자~최대 10글자 입니다!");
		}else{
			alert("최소 5글자~최대 10글자가 아닙니다.");
		}
	});
</script>
</body>
</html>