<%@page import="obm.dto.Oto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="otoDAO" class="obm.dao.OtoDAO"></jsp:useBean>
		<%
	String root = request.getContextPath();
	String user_id = (String) session.getAttribute("user_id");
	List<Oto> otoList = otoDAO.readListByUser(user_id);
	%>
	
<jsp:useBean id="OtoDAO" class="obm.dao.OtoDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 내역</title>
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root %>/static/css/otoRead.css">
</head>
<body>

	<jsp:include page="${root}/layout/header.jsp" />
	
	
	<div class="container">
	<h2>1:1 QUESTION</h2>
	
	
		<div class="tablecon">
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th>제목</th>
							<th>카테고리</th>
							<th>문의일자</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody>


						<%
						
						if (otoList ==null || otoList.isEmpty() ){
							%>
							<tr>
							<td>등록된 후기가 없습니다.</td>
						</tr>
							<%
						} else { 
			for (int i = 0; i < otoList.size(); i++) {
				Oto oto = otoList.get(i);
			%>
						<tr
							onclick="location.href='<%=root%>/user/otoReadOne.jsp?otoId=<%=oto.getOtoId()%>'">
							<!--  primary  key -->
							<td><%=oto.getTitle()%></td>
							<td><%=oto.getCategory()%></td>
							<td><%=oto.getRegDate()%></td>
							<td><%=oto.getReply() == null ? "등록된 답변이 없습니다" : oto.getReply()%></td>
						</tr>
						<%
						}}
						%>
					</tbody>
				</table>
				<!--윤주 수정-버튼 추가  -->
				<div class="butnn">
				<!-- 버튼 영역 -->
	<a href="<%=root%>/index.jsp"  class="btn-3d  btn-3d-2 yellow">메인으로</a>
	<a href="<%=root%>/user/otoReg.jsp"  class="btn-3d yellow">문의하기</a>
					<!-- <input type="submit" value="유저 삭제" class="btn-3d yellow"> -->
				</div>
		</div>
	</div>


	<jsp:include page="${root}/layout/footer.jsp" />

</body>
</html>