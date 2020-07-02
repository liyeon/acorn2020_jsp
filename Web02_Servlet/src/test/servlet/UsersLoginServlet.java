package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/user/login")
public class UsersLoginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//id = gura , pwd = 1234;
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		//폼 전송 되는 아이디와 비밀번호 읽어내기
		String id = req.getParameter("id"); //name = "id"
		String pwd = req.getParameter("pwd"); //name = "pwd"
	
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8' />");
		pw.println("<title>회원 목록 페이지</title>");
		pw.println("<link rel='stylesheet' href='/Web02_Servlet/css/bootstrap.css'/>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div class='container'>");
		

		if(id.equals("gura")&&pwd.equals("1234")) {
			pw.println("<p class ='alert alert-success'>"+id + "님이 로그인 되었습니다."
					+ "<a classs='alert-link' href='../index.html'>확인</a></p>");
			
		}else {
			pw.println("<p class ='alert alert-danger'>아이디나 비밀번호를 다시 확인해보세요</p>");
		}

		
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		
		pw.close();

	}
}
