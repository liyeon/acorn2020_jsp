package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//servlet기준으로 최상위 경로
@WebServlet("/time")
public class TimeServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		// 응답 컨텐트 type 설정
		resp.setContentType("text/html;charset=utf-8");// text/html apllication/json 이런식으로 설정해준다.
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8' />");
		pw.println("<title>현재시간페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>sysdate</h1>");
		//Date 객체를 이용해서(java.util) 현재 날짜 시간을 문자열로 얻어내기
		Date d = new Date(); // db에 저장,혹은 불러오려고 
		String now = d.toString();//oracle DB
		//클라이언트 웹브라우저에 응답하기
		pw.print("<p> 현재 시간 : "+now+"</p>"); // 요청할때마다달라지는 dynamic contents
		//웹브라우저 입장에서는서버에서 날라오는 문자열을 그대로 해석하기 때문에  servlet이나 html인지는 알지 못한다.
		//java 코딩 + markup = jsp java server page , servlet과 jsp 둘 다 씀
		pw.print("<img src = 'images/puff2.png'/>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}// service

}// TimeServlet
