<%@page import="obm.dto.Oto"%>
<jsp:useBean id="otoDAO" class="obm.dao.OtoDAO"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 조회</title>

<%
String root = request.getContextPath();
%>
<link rel="stylesheet" href="<%=root%>/static/css/otoReadOne.css">
<jsp:include page="${root}/static/links/links.jsp" />

</head>
<body>

<jsp:include page="${root}/layout/header.jsp" />
<%
	Oto oto = otoDAO.choiceOto(Integer.parseInt(request.getParameter("otoId")));
%>
	<div class="container">
	
		<h1>1:1 문의 조회</h1>
		<div class="ototable">
			<table class="table table-dark">
				<tr>
					<td>제목</td>
					<td>카테고리</td>
					<td>내용</td>
					<td>답변</td>
					<td>등록일자</td>
				</tr>
				<tr>
					<td><%=oto.getTitle() %></td>
					<td><%=oto.getCategory() %></td>
					<td><%=oto.getContent() %></td>
					<td><%=oto.getReply() %></td>
					<td><%=oto.getRegDate() %></td>
				</tr>
		
			</table>
		</div>
	
	
		<!-- 버튼 영역 -->
		<div class="buttonnn">
			<button class="abutton"><a href="javascript: history.back()">뒤로가기</a></button>
		</div>
	</div>
<jsp:include page="${root}/layout/footer.jsp" />
</body>
</html>