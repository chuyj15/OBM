<%@page import="obm.dto.Oto"%>
<%@page import="java.util.Date"%>
<%@page import="obm.dto.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<jsp:useBean id="otoDAO" class="obm.dao.OtoDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<!-- 기본 링크들 -->
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/OTO_conRead.css">
</head>
<body>
	<jsp:include page="${root}/layout/header.jsp" />
	<%
	String otoId = request.getParameter("otoId");
	Oto oto = otoDAO.choiceOto(Integer.parseInt(otoId));
	
	%>

	<!-- 전체 div -->
	<div class="container">
	<form action="<%=root%>/admin/OTO_con_pro.jsp?otoId=<%=otoId%>" method="post">
		<h1 class="mypageh1">1:1 문의 내용</h1>
		
		
		
		<!-- 자기 회원정보 -->
		<h2>Write Comment</h2>
		<!-- 반복문을 통해서 리스트를 출력할 때, 후기 작성버튼을 통해 넘기는 값은 고유PK아닌 order.getCourseName을 넘겨주면 원할할듯 합니다! -->
		<div class="tablecon">
		
			<table class="table table-dark table-striped">
				<colgroup>
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th>문의아이디</th>
						<td><%=oto.getOtoId()%></td>
					</tr>
					<tr>
						<th>유저아이디</th>
						<td><%=oto.getUserId()%></td>
					</tr>
					<tr>
						<th>문의제목</th>
						<td><%=oto.getTitle()%></td>
					</tr>
					<tr>
						<th>문의내용</th>
						<td><%=oto.getContent()%></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><%=oto.getCategory()%></td>
					</tr>
					<tr>
						<th>등록일자</th>
						<td><%=oto.getRegDate()%></td>
					</tr>
					<% 
					//만약 이미 답변한게 없다면,,,
					
					if ( oto.getReply() == null ||oto.getReply() =="" ){
						
						%>
					<tr>
						<th>답변작성</th>
						
						<td><textarea name="comment" placeholder="답변을 입력해주세요." ></textarea></td>
					</tr>
					<%  } else {%>
						<tr>
						<th>답변</th>
						
						<td><%=oto.getReply()%></td>
					</tr>
					<% }
					%>
				</tbody>
			</table>
		</div>

		<!-- 버튼 -->
		<div class="butnn">
		<%
		if ( oto.getReply() == null ||oto.getReply() =="" ){
			
		%>
		<!-- 답변이 없으면 보여야할 버튼 -->
		<input type="submit" class="btn-3d btn-3d-2 yellow" value="답변등록">
		<% } %>
		<a href="<%=root %>/admin/OTO_con.jsp" class="btn-3d yellow">문의목록</a>
		</div>
</form>
	</div>
<script>
$('a').click(function(event){
    event.preventDefault(); 
  });
</script>
	<jsp:include page="${root}/layout/footer.jsp" />
</body>
</html>