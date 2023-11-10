<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="UserDAO" class="obm.dao.UserDAO" />
<%
	String userId = request.getParameter("id");
	
	
	int result = UserDAO.delUser(userId);
	
	response.sendRedirect("user_con.jsp");
%>