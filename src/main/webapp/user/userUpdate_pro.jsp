<%@page import="obm.dto.User"%>
<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="obm.dao.UserDAO"></jsp:useBean>

<%
	
	String root = request.getContextPath();

	User user = new User();

	user.setName(request.getParameter("userName"));
	user.setPassword(request.getParameter("userPw"));
	user.setEmail(request.getParameter("userEmail"));
	user.setPhone(request.getParameter("userPhone"));
	user.setUserId((String)session.getAttribute("user_id"));
	
	int result = userDAO.update(user,(String)session.getAttribute("user_id"));

	if(result>0){
		response.sendRedirect(root+"/user/mypage.jsp");
	}else{
		response.sendRedirect(root+"/user/userUpdate.jsp?msg=updateF");
		
	}
%>