package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/todo/list")
public class TodoListServlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//db에서 읽어온 할일 목록이라고 가정하다.
	List<String> list = new ArrayList<>();
	list.add("html 공부하기");
	list.add("css 공부하기");
	list.add("javascript 공부하기");
	
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
			pw.println("<title>할 일 목록 페이지</title>");
			pw.println("</head>");
			pw.println("<body>");
			pw.println("<h1>오늘의 할 일</h1>");
			pw.println("<ul>");
				for(int i=0; i<list.size(); i++) {
					pw.println("<li>"+list.get(i)+"</li>");
				}
				//확장 for문
				for(String tmp:list) {
					pw.println("<li>"+tmp+"</li>");
				}
			pw.println("</ul>");
	        Random ran = new Random(); 
	        int ranNum = ran.nextInt(5)+1; 
	        pw.println("<img src = '/Web02_Servlet/images/puff"+ranNum+".png'/>");
			pw.println("</body>");
			pw.println("</html>");
			pw.close();
	
}//service()
	
	
}//todolist
