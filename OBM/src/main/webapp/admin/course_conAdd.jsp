<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>course_conAdd</title>
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/course_conAdd.css">
</head>
<body>
<jsp:include page="${root}/layout/header.jsp" />
	<div class="container">
		<div class="coursebox">
			<h2>새 코스 등록</h2>
			<form action="<%=root %>/admin/course_conAdd_pro.jsp" method="post" onsubmit="return checkCourseAdd()"
				enctype="multipart/form-data">
				<div class="mb-3">
					<label for="courseName" class="form-label">코스 이름</label> <input
						type="text" name="courseName" class="form-control" id="courseName"
						placeholder="코스 이름">
				</div>
				<div class="mb-3">
					<label for="courseDes" class="form-label">코스 설명</label> <input
						type="text" name="courseDes" class="form-control" id="courseDes"
						placeholder="코스 설명">
				</div>
				<div class="mb-3">
					<label for="coursePrice" class="form-label">코스 가격</label> <input
						type="text" name="coursePrice" class="form-control"
						id="coursePrice" placeholder="코스 가격(원)">
				</div>
				<div class="mb-3">
					<label for="coursePopul" class="form-label">코스 인기도</label> <input
						type="text" name="coursePopul" class="form-control"
						id="coursePopul" placeholder="코스 인기도(1~5)">
				</div>
				<div class="mb-3">
					<label for="courseDur" class="form-label">코스 시간</label> <input
						type="text" name="courseDur" class="form-control" id="courseDur"
						placeholder="코스 시간(시간단위)">
				</div>
				<div class="mb-3">
					<label for="courseFile" class="form-label">코스이미지 등록</label> <input
						class="form-control" type="file" id="courseFile" name="courseFile">
				</div>
				<div class="coursebtn">
					<%-- <a href="<%=root %>/admin/course_conAdd.jsp" class="btn-3d yellow">코스 등록</a> --%>
					<input type="submit"  class="btn-3d yellow">코스 등록</input>
				</div>
			</form>
		</div>
	</div>
	<script src="<%= root %>/static/scripts/validation.js"></script>
	
</body>
</html>