<%@page import="obm.dao.OrderDAO"%>
<%@page import="obm.dto.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String root = request.getContextPath();
		String userId = (String) session.getAttribute("user_id");
		String courseName = request.getParameter("courseName");
	%>
<jsp:useBean id="OrderDAO" class="obm.dao.OrderDAO" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>후기 작성하는 페이지</title>
	<jsp:include page="${root}/static/links/links.jsp" />
	<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root %>/static/css/regReview.css">
</head>
<body>
	<jsp:include page="${root}/layout/header.jsp" />
	
	
    
    <!-- 진짜 -->
    <div class="container">
		<div class="coursebox">
			<h2>후기 작성</h2>
			
			<%
	
		//msg = reviewF : 후기 등록 실패
				
			String msg = request.getParameter("msg");
			msg = msg==null ? "" : msg;
			String text = "";
			String user_id = (String)session.getAttribute("user_id");
			switch(msg){
			case "reviewF" : 
				text = user_id + "님 후기등록에 실패했습니다..." ; break;
			
			default : 
				text = "후기를 작성해주시면 우아미에게 큰 힘이 됩니다!"; break;
			}
			%>
<!-- 메세지를 표현해줄 곳 -->
<div class='typing'><h1 class="msgg"></h1></div>
<script>
const $text = document.querySelector(".typing .msgg");
//글자 모음
const letters = [
"<%= text %>"
];
//글자 입력 속도
const speed = 100;
let i = 0;
//타이핑 효과
const typing = async () => {  
const letter = letters[i].split("");
while (letter.length) {
 await wait(speed);
 $text.innerHTML += letter.shift(); 
}
// 잠시 대기
await wait(800);
}
//딜레이 기능 ( 마이크로초 )
function wait(ms) {
return new Promise(res => setTimeout(res, ms))
}
//초기 실행
setTimeout(typing, 1500);
</script>
			
			<form action="<%=root %>/user/regReview_pro.jsp" name="regReview" onsubmit="return checkRegReview()" method="post">
			<!-- <div class="category">
				<label>후기  </label>
				<select name="category">
					<option value="예약 변경">예약 변경</option>
					<option value="예약 취소">예약 취소</option>
					<option value="결제 관련">결제 관련</option>
					<option value="기타 문의">기타 문의</option>
				</select>	
			</div> -->
			
			
				<div class="mb-3">
					<label for="userId" class="form-label">유저 아이디</label> <input
						type="text" name="userId" value="<%= userId %>" class="form-control" id="userId" readonly >
				</div>
				
				
				<div class="mb-3">
					<label for="courseName" class="form-label">코스 이름</label>
					<input
						type="text" name="courseName" value="<%= courseName %>" class="form-control" id="courseName" readonly="readonly">
				</div>
				<div class="mb-3">
					<label for="title" class="form-label">후기 제목</label>
					<input
						type="text" name="title" placeholder="후기 제목" class="form-control" id="title" >
				</div>
				<div class="mb-3">
					<label for="content" class="form-label">후기내용</label>
					<textarea name="content" placeholder="재미있으셨나요? 후기를 작성해주세요." id="content"></textarea>
				</div>
				
				<!-- 버튼 -->
				<div class="butnn">
					<input type="submit"  class="btn-3d yellow" value="접수" />
					<a href="javascript: history.back()" class="btn-3d btn-3d-2 yellow">취소</a>
				</div>
			</form>
		</div>
	</div>
<script src="<%= root %>/static/scripts/validation.js"></script>
<jsp:include page="${root}/layout/footer.jsp" />
</body>
</html>