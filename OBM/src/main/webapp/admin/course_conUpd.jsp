<%@page import="obm.dto.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>course_conUpd</title>
<jsp:useBean id="courseDAO" class="obm.dao.CourseDAO"></jsp:useBean>
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/course_conUpd.css">
</head>
<body>
<jsp:include page="${root}/layout/header.jsp" />
<% 
String id = request.getParameter("id");
Course mycourse = courseDAO.choice(Integer.parseInt(id));
%>
	<div class="container">
		<div class="coursebox">
			<h2>코스 수정</h2>
			<form   onsubmit="return checkCourseUpd()" action="<%=root %>/admin/course_conUpd_pro.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="courseId" class="form-control" id="courseId" value="<%= id %>">
				<div class="mb-3">
					<label for="courseName" class="form-label">코스 이름</label> <input
						type="text" name="courseName" class="form-control" id="courseName"
						value="<%= mycourse.getCourseName() %>">
				</div>
				<div class="mb-3">
					<label for="courseDes" class="form-label">코스 설명</label> <input
						type="text" name="courseDes" class="form-control" id="courseDes"
						value="<%= mycourse.getDescription() %>">
				</div>
				<div class="mb-3">
					<label for="coursePrice" class="form-label">코스 가격</label> <input
						type="text" name="coursePrice" class="form-control"
						id="coursePrice" value="<%= mycourse.getPrice() %>">
				</div>
				<div class="mb-3">
					<label for="coursePopul" class="form-label">코스 인기도</label> <input
						type="text" name="coursePopul" class="form-control"
						id="coursePopul" value="<%= mycourse.getPopularity() %>">
				</div>
				<div class="mb-3">
					<label for="courseDur" class="form-label">코스 시간</label> <input
						type="text" name="courseDur" class="form-control" id="courseDur"
						 value="<%= mycourse.getDuration() %>">
				</div>
				<div class="mb-3">
					<label for="courseFile" class="form-label">코스이미지 등록</label> <input
						class="form-control" type="file" id="courseFile" name="courseFile">
				</div>
				<div class="coursebtn">
					<input type="submit"  class="btn-3d yellow">코스 수정</input>
				</div>
			</form>
		</div>
	</div>
	
	<script src="<%= root %>/static/scripts/validation.js"></script>
</body>
</html>