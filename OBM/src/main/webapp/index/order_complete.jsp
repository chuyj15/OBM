<%@page import="obm.dto.Order"%>
<%@page import="obm.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 페이지</title>

<%
String root = request.getContextPath();
%>
<link rel="stylesheet" href="<%=root%>/static/css/order_complete.css">
<jsp:include page="${root}/static/links/links.jsp" />

</head>
<body>
<jsp:include page="${root}/layout/header.jsp" />
	
	<%
		OrderDAO orderDAO = new OrderDAO();
		Order ro = orderDAO.getRecentInfo(request.getParameter("order"));
		
	%>
	
	
<div class="container">
	<h1>예약 확인</h1>
	
	<br>
	
	<h3>예약 정보</h3>
	
	<br>
	
	<div class="reservation_info">

		<table>
			<tr>
				<td>선택 테마 : </td>
				<td><%=ro.getCourseName() %></td>
			</tr>
			<tr>
				<td>선택 날짜 : </td>
				<td><%=ro.getResDate() %> </td>
			</tr>
			<tr>
				<td>선택 시간 : </td>
				<td><%=ro.getResTime() %>시</td>
			</tr>			
		</table>
	</div>
	
	<br>
	
	<div class="order_check">
		<table class="table table-dark table-hover">
			<tr>
				<td>예약자명</td>
				<td>연락처</td>
				<td>인원</td>
				<td>가격</td>
			</tr>
			<tr>
				<td><%= ro.getResName()%></td>
				<td><%= ro.getPhone() %></td>
				<td><%=ro.getHc() %></td>
				<td><%=ro.getPrice() %></td>
			</tr>
		</table>
	</div>
	<!-- 버튼 영역 -->
	<div class="buttonnn">
		<button class="abutton"><a href="<%= root %>/index.jsp">메인으로</a></button>
	</div>
</div>	
<jsp:include page="${root}/layout/footer.jsp" />
</body>
</html>