package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//앞에 슬러시 잊지 말 것!
@WebServlet("/sub/fortune") // 논리적 물리적인 경우를 강제로 만들어 줌
public class FortuneServlet extends HttpServlet {

// 1 // 객체 생성s
	@Override
	/* 2 */protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		// 응답 컨텐트 type 설정
		resp.setContentType("text/html;charset=utf-8");// text/html apllication/json 이런식으로 설정해준다.
		//클라이언트의 웹브라우저에 문자열을 출력 할 수 있는 객체의 참조값 얻어오기
		PrintWriter pw = resp.getWriter(); //프린트라이터의 메소드를 통해 응답 // 요청을 한 클라이언트 웹브라우저에 그대로 출력 된다.//new해서 쓰지마셈
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8' />");
		pw.println("<title>오늘의 운세 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		
		//sample 운세 5개 미리 배열에 준비하기
		String[]  fortunes = new String[5];
		fortunes[0] = "길가다 똥밟을거에요";
		fortunes[1] = "로또 사세요";
		fortunes[2] = "하늘을 조심하세요";
		fortunes[3] = "귀인을 만날겁니다.";
		fortunes[4] = "물을 조심하세요";
		//Random 객체
        Random ran = new Random(); 
        //0~4사이의 랜덤한 정수얻어내기
        int ranNum = ran.nextInt(5);     
        int ranNum2 = ran.nextInt(5)+1; 
        pw.println("<h1>오늘의 운세! :" +fortunes[ranNum]+" </h1>");
        pw.println("<img src = '/Web02_Servlet/images/puff"+ranNum2+".png'/>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
