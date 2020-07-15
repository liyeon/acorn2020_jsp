<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax/test01.jsp</title>
</head>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<body>

<button id="getBtn">요청하기</button>
<button id="getBtn2">요청하기2</button>
<button id="getBtn3">요청하기3</button>
<script>
	//id가 getBtn인 곳에 "click"이벤트가 일어 났을 때 호출되는 함수 등록
	$("#getBtn").on("click", function(){
		//jquery의 기능을 이용해서 ajax요청하기
		$.ajax({
			method:"GET", //get방식인지 post방식 요청인지
			url:"${pageContext.request.contextPath }/ajax/getmsg.jsp",
			//plain test,html,json,xml 네가지 형식 중 하나가 응답된다.
			//보통 json으로 응답된다. 자바스크립트에서 사용할 문자열이니까
			data:"num=1&name=kimgura", //요청 파라미터
			success:function(responseData){
				console.log(responseData)
			}//reponseData 결과를 받아올 함수 서버가 응답하는 문자열이 responseData라는 변수명으로 들어온다.
		});
		//({}) 안에는 어떤 방식으로 어디에 요청을 할 것이고 파라미터를 받아 올 것인지
		//$는 오브젝트로 볼 수 있다. $() = function(){} {key:value,key:}
	}); 
	
	
	//서버에서 html형식으로 응답할거야하고 json으로 응답한것
	$("#getBtn2").on("click", function(){
		$.ajax({
			method:"get",//소문자로 작성해도됨
			url : "getmsg.jsp",//상대경로도 가능하다
			data:{num:2, name:"해골"},//요청 파라미터를 object로 전달해도 된다.
			success:function(data){//함수에 전달 받는 변수명은 마음대로 작성 가능하다.
				//data는 json 형식을 가지고 있는 String type이다.
				console.log(data);
			//javascript에서 사용하려면 object로 바꿔서 사용해야한다.
			var obj=JSON.parse(data);
			console.log(obj);
			//object로 바꿨기 때문에 쉽게 사용 할 수 있다.
			alert(obj.msg);
			}
		});
	});
	$("#getBtn3").on("click", function(){
		$.ajax({
			method:"get",
			url:"getgreet.jsp", //요청 파라미터가 없으면 전달 안해도 된다.
			success:function(data){
				/*
					getgreet.jsp 페이지에서 contentType 을 application/json
					이라고 정확히 명시 했기때문에 jquery 가 응답된 문자열을 
					object 로 바꿔서 전달을 해준다. 
				*/
				console.log(data);
				alert(data.greet);
			}
		});
	});
	

	
</script>
</body>
</html>