package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//web.xml에 필터 정의와 필터 맵핑을 어노테이션을 이용해서 할 수 있다.

@WebFilter("/member/*")
public class LoginFilter implements Filter{

	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//클라이언트가 로그인 했는지 여부를 확인한다.
		//부모 type을 자식type으로 casting 후 
		HttpServletRequest req = (HttpServletRequest)request;
		//객체의 참조값을 얻어낸다.
		HttpSession session = req.getSession();
		//로그인된 아이디가 있는지 얻어와 본다.
		String id = (String)session.getAttribute("id");
		
		if(id !=null) {//로그인된 상태
			//요청의 흐름을 이어간다.
			chain.doFilter(request, response);
		}else {//로그인 안 된 상태
			//로그인 폼으로 강제 리다이렉트 응답을 준다.
			HttpServletResponse rep = (HttpServletResponse)response;
			String cPath = req.getContextPath();
			rep.sendRedirect(cPath + "/test/loginform.jsp");
		}
		
		
		
	}//doFilter

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		
	}//init

}//LoginFilter
