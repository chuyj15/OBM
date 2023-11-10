<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="userDAO" class="obm.dao.UserDAO"></jsp:useBean>

<%
//경로 루트를 설정합니다.
 String root = request.getContextPath();

 
 //유저 아이디를 이용해 삭제를 진행하고 결과 건수를 반환받습니다.
 int result = userDAO.delUser(request.getParameter("userId"));
 
 //성공 시, msg = delS라는 요청으로 index.jsp으로 돌아갑니다.
 //실패 시, msg = delF라는 요청으로 userUpdate.jsp으로 돌아갑니다.
 if(result>0){
	 session.invalidate();
	 response.sendRedirect(root+"/index.jsp?msg=delS");
 }else{
	 response.sendRedirect(root+"/user/userUpdate.jsp?msg=delF");
 }
 
 

%>