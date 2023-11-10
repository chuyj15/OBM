<%@page import="obm.dao.CourseDAO"%>
<%@page import="obm.dto.Course"%>
<%@page import="obm.dto.Review"%>
<%@page import="obm.dto.User"%>
<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="reviewDAO" class="obm.dao.ReviewDAO"></jsp:useBean>

<%

	String root = request.getContextPath();

	Review review = new Review();
	
	review.setUserId(request.getParameter("userId"));
	review.setCourseName(request.getParameter("courseName"));
	review.setTitle(request.getParameter("title"));
	review.setContent(request.getParameter("content"));
	
	int result = reviewDAO.add(review);
	
	if(result>0){
		
		response.sendRedirect(root+"/user/mypage.jsp?msg=reviewS");
		
	}else{

		response.sendRedirect(root+"/user/mypage.jsp?msg=reviewF");
		
	}

%>