package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/*
 * [요청을 가로채서 중간에 원하는 작업을 할 수 있는 필터 만들기]
 * 1. javax.servlet.Filter 인터페이스를 구현하다.
 * 2. web.xml 문서에 필터를 정의 하고 맵핑한다.
 * 3. doFilter() 메소드 안에서 원하는 작업을 한다.
 */
public class EncodingFilter implements Filter {
	//인코딩 정보를 저장할 필드 선언
	private String encoding;//web.xml에 어디엔가 선언,명시한 내용을 encoding이라는 필드로 읽어올것

	@Override
	public void destroy() {}

	// 필터가 동작해야 할 때 호출되는 메소드
	/*
	 * 작업해야할필요한  3개의객체의 메소드
	 * servletReaust는 httpServletRequest의 부모타입
	 * httpServletRequest의 참조값이 부모타입인 servletReaust으로 받아진다.
	 * 클라이언트와 서버 사이에 필터가 가로 채서 흐름을 이어간다.
	 * 필터에서 리다이렉트도 가능하다.
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1.요청 인코딩이 설정되지 않았다면
		if(request.getCharacterEncoding()==null) {
			//인코딩 설정하기
			request.setCharacterEncoding(encoding);
		}
		
		//요청의 흐름 계속 이어가기
		chain.doFilter(request, response);
		
	}
	
	//필터가 최초 사용 될 때 1번 호출되는 메소드
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//web.xml 문서에 있는 내용을 읽어서 필드에 저장한다.
		encoding = filterConfig.getInitParameter("encoding");
	}

}// EncodingFilter
