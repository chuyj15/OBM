<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="orderDAO" class="obm.dao.OrderDAO"></jsp:useBean>

<%

	String root = request.getContextPath();

	int result = orderDAO.isCancel(Integer.parseInt(request.getParameter("orderId")));

	if(result>0){
		response.sendRedirect(root+"/admin/order_con.jsp?msg=success");
	}else{
		response.sendRedirect(root+"/admin/order_con.jsp?msg=failed");
	}

%>
    