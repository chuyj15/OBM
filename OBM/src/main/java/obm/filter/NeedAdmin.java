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

public class NeedAdmin implements Filter{

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
	
	HttpSession session = ((HttpServletRequest) request).getSession(false);	//HttpSession객체를 생성하기 위해,
					//1. request를 HttpServletRequest로 다운캐스팅.
					//2.이후 getSession()을 이용해 가져오는데
					//3. ()안이 비어있으면 가져올 세션이 없을 시 새로 생성해버립니다. false를 주면 세션이 없을 시 null을 반환합니다.

	String root = ((HttpServletRequest)request).getContextPath();
	
	if(session.getAttribute("user_id")!=null) {
	
		if(session.getAttribute("user_id").equals(adminId)&&session.getAttribute("user_pw").equals(adminPw)) {
			
			
			
		}else {
			
			((HttpServletResponse)response).sendRedirect(root+"/index/loginandsignup.jsp?msg=needAdmin");
			
		}
	}else {
		
		((HttpServletResponse)response).sendRedirect(root+"/index/loginandsignup.jsp?msg=needLogin");
	}
		
	chain.doFilter(request, response);
	
	}
	
	@Override
	public void destroy() {
	}
}
