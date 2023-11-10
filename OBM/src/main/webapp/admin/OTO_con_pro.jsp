<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="otoDAO" class="obm.dao.OtoDAO"></jsp:useBean>
<%
String root = request.getContextPath();
String comment = request.getParameter("comment");
String otoId = request.getParameter("otoId");

int result = otoDAO.replyOto(comment, Integer.parseInt(otoId));
if (result >0 ){
	out.print("문의에 대한 답변 성공");
	response.sendRedirect(root+"/admin/OTO_con.jsp?msg=otocomS");
} else {
	out.print("문의에 대한 답변 실패");
	response.sendRedirect(root+"/admin/OTO_con.jsp?msg=otocomF");
}

%>