package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * "/hello" 요청에 대해서 응답할 무언가(Servlet)을 만들 클래스 설계하기
 * 1. HttpServlet 클래스를 상속받는다.
 * 2. service()메소드를 오버라이드 한다.
 * 3. service() 메소드에 전달되는 HttpServletResponse 객체를 활용해서 응답하는 코드를 작성한다.
 * 4. "/hello"요청이 왔을 때 실제 동작하도록 맵핑한다.
 */
@WebServlet("/hello")//4 어떤 요청이 들어왔을  때 동작을 할지 결정
public class HelloServlet extends HttpServlet{//1 // 객체 생성
	@Override
	//호출만 하는게 아닌 참조값도 넣어준다. 톰캣서버가 호출 인자를 준다는 과정하에서 코딩을 함
	//응답, 요청 객체
	/*2*/protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		//code 작성하기
		//3
		
		//요청해온클라이언트에게 출력 할 수 있는 객체의 참조값얻어오기
		PrintWriter pw = resp.getWriter();//printWriter type syso 타입은 같지만  콘솔이 아닌 클라이언트의 웹브라우정저에 연결된 객체
		
		pw.println("merong");
	}
}
