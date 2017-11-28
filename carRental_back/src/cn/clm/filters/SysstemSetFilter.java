package cn.clm.filters;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import cn.clm.services.SystemService;

public class SysstemSetFilter implements Filter {
	public void destroy() {
		System.out.println("SysstemSetFilter destroy");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		SystemService ss = new SystemService();
		Map<String,Object> map = ss.getSystemSet();
		
		String strIndex = ss.getIndex();
		
		ServletContext application = request.getServletContext();
		application.setAttribute("SystemSet", map);
		application.setAttribute("strIndex", strIndex);
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("SysstemSetFilter init");
	}

}
