package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 오늘의 운세를 얻어오는 비즈니스 로직을 수행한다.
		String fortuneToday = "동쪽으로 가면 귀인을 만나요";
		
		//비즈니스 로직의 수행결과 data를 HttpServletRequest 객체에 담는다.
		//"request 영역(scope)에 담는다." 라고도 한다
		
		//"fortuneToday" 라는 키값으로 String type의 참조값 담기
		req.setAttribute("fortuneToday", fortuneToday); //request scope(영역)에 담았다.
		
		//jsp페이지로 응답을 위임한다. (forward이동)
		//요청 전달자 객체 = RequestDispatcher
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		rd.forward(req, resp);//forward라는 메소드를 이용해서 응답을 위임
		//최초 전달 받았던 request객체와 response객체를 forward 안에 넣어준다.
	}

}//
