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

import test.dto.MemberDto;

@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		//db에서 불러온 회원목록이라고 가정하자.
		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1, "김구라", "노량진"));
		list.add(new MemberDto(2, "해골", "행신동"));
		list.add(new MemberDto(3, "원숭이", "상도동"));
		
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
		pw.println("<h1>회원 목록 보기</h1>");
		pw.println("<table class='table table-danger'>");
			pw.println("<tr class=\"thead-dark\">");
			pw.println("<th>번호</th>");
			pw.println("<th>이름</th>");
			pw.println("<th>주소</th>");
			pw.println("</tr>");
			for(int i=0; i<list.size(); i++) {
				MemberDto tmp = list.get(i);
				pw.println("<tr>");
				pw.println("<td>"+tmp.getNum()+"</td>");
				pw.println("<td>"+tmp.getName()+"</td>");
				pw.println("<td>"+tmp.getAddr()+"</td>");
				pw.println("</tr>");
			}
			
			for(MemberDto tmp:list) {
				pw.println("<tr>");
				pw.println("<td>"+tmp.getNum()+"</td>");
				pw.println("<td>"+tmp.getName()+"</td>");
				pw.println("<td>"+tmp.getAddr()+"</td>");
				pw.println("</tr>");
			}
		pw.println("</table>");
		pw.println("</div>");
        Random ran = new Random(); 
        int ranNum = ran.nextInt(5)+1; 
        pw.println("<img src = '/Web02_Servlet/images/puff"+ranNum+".png'/>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
		
	}//

}//
