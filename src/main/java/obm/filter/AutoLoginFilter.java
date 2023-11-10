package obm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import obm.dao.AutoLoginDAO;
import obm.dto.AutoLogin;

public class AutoLoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpSession session = ((HttpServletRequest) request).getSession(false);
		if(session!=null) {
		if(session.getAttribute("al")!=null) {
			AutoLoginDAO alDAO = new AutoLoginDAO();
			AutoLogin al = alDAO.getAlSession((Integer) session.getAttribute("al"));
			
			String userId = al.getUserId();
			String userPw = al.getUserPw();
			
			session.setAttribute("user_id", userId);
			session.setAttribute("user_pw", userPw);
			
			
			
		}else {
			
		}
		}
		chain.doFilter(request, response);
		
	}

}
