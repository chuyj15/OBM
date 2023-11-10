package obm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import obm.service.UserManagement;

public class NeedLogin implements Filter{
	

	private String adminId;
	private String adminPw;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		adminId = filterConfig.getInitParameter("adminId");
		adminPw = filterConfig.getInitParameter("adminPw");
		
		
	}

	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		UserManagement um = new UserManagement();
		
		um.autoDone();
		
		String root = ((HttpServletRequest)request).getContextPath();
		
		HttpSession session = ((HttpServletRequest)request).getSession(false);
		String user_id = (String) session.getAttribute("user_id");
		String user_pw = (String) session.getAttribute("user_pw");
		
		if(user_id!=null) {
				
		}else {
			((HttpServletResponse)response).sendRedirect(root+"/index/loginandsignup.jsp?msg=needLogin");
		}
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		
	}


}
