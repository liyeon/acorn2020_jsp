package test.servlet;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import test.file.dao.FileDao;
import test.file.dto.FileDto;

@WebServlet("/file_list")
public class FileListServlet extends HttpServlet {
	@Override
	protected void service(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp)
			throws javax.servlet.ServletException, java.io.IOException {
		//1. 파일 목록을 얻어오는 비즈니스 로직 수행
		FileDto dto = new FileDto();
		dto.setStartRowNum(1);
		dto.setEndRowNum(10);
		List<FileDto> list = FileDao.getInstance().getList(dto);
		//2. 비즈니스 수행 결과 데이터(모델)을 request영역에 담기
		req.setAttribute("list", list);
		//3. view 페이지로 forward 이동해서 응답하기
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/file/list.jsp");
		rd.forward(req, resp);
	};
}//
