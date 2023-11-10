<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="courseDAO" class="obm.dao.CourseDAO"></jsp:useBean>


<%
String root = request.getContextPath();
String id = request.getParameter("id");

//데이터베이스에서 코스데이터 삭제
int result = courseDAO.delete(Integer.parseInt(id));
 if (result >0 ){
	response.sendRedirect(root + "/index.jsp?msg=courseDel"); //코스 목록으로 이동시키자~
} else {
	out.println("코스삭제가 안됐습니다..."); 
	response.sendRedirect(root + "/index.jsp?msg=courseNotDel"); 
} 
%>

