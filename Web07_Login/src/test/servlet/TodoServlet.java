package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/todo")
public class TodoServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 할 일 목록을 얻어오는 비즈니스 로직을 수행한다.
		List<String> todoList = new ArrayList<>();
		todoList.add("html 공부");
		todoList.add("css 공부");
		todoList.add("javascript 공부");
		//2. 비즈니스 수행 결과 데이터(모델)을 request영역에 담기
		//todoList라는 키값으로 List<String> type에 담기
		req.setAttribute("todoList", todoList);
		//3. view 페이지로 forward 이동해서 응답하기.
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/todo/list.jsp");
		rd.forward(req, resp);
	}
}//
