<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		
		String root = request.getContextPath();
		//msg=regF :1:1문의 작성에 실패했을 경우입니다.
		
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 등록</title>
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/otoRegg.css">
</head>
<body>
<jsp:include page="${root}/layout/header.jsp" />
	
	
	<div class="container">
		<div class="coursebox">
			<h2>1:1문의 등록</h2>
			<form action="<%=root %>/user/otoReg_pro.jsp" name="otoForm" onsubmit="return checkOtoForm()" method="post">
			<div class="category">
				<label>문의 유형 : </label>
				<select name="category">
					<option value="예약 변경">예약 변경</option>
					<option value="예약 취소">예약 취소</option>
					<option value="결제 관련">결제 관련</option>
					<option value="기타 문의">기타 문의</option>
				</select>	
			</div>
			
			
				<div class="mb-3">
					<label for="title" class="form-label">문의 제목</label> <input
						type="text" name="title" placeholder="문의 제목을 입력해주세요." class="form-control" id="title">
				</div>
				
				
				<div class="mb-3">
					<label for="coursePrice" class="form-label">문의 내용</label>
					<textarea name="content" placeholder="문의 내용을 입력해주세요." ></textarea>
				</div>
				
				
				<!-- 버튼 -->
				<div class="butnn">
					<input type="submit"  class="btn-3d yellow" value="접수" />
					<a href="javascript: history.back()" class="btn-3d btn-3d-2 yellow">취소</a>
				</div>
			</form>
		</div>
	</div>
	
	
	
	
	<jsp:include page="${root}/layout/footer.jsp" />
	
	<!-- 부트스트랩 js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
		<!-- 유효성 검사 추가 -->
		<script src="<%= root %>/static/scripts/validation.js"></script>
</body>
</html>