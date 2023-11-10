<%@page import="obm.dto.User"%>
<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<jsp:useBean id="userDAO" class="obm.dao.UserDAO"></jsp:useBean>>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();

	User user = userDAO.getInfo((String) session.getAttribute("user_id"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userUpdate</title>
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/userUpdatee.css">
</head>
<body>
<jsp:include page="${root}/layout/header.jsp" />

<%

	//msg=delF : 회원 탈퇴 실패
	//msg=updateF : 회원 정보 수정 실패 
			String msg = request.getParameter("msg");
			msg = msg==null ? "" : msg;
			String text = "";
			String user_id = (String)session.getAttribute("user_id");
			switch(msg){
			case "delF" : 
				text = user_id + "님, 회원탈퇴에 실패했습니다..!" ; break;
			case "updateF" : 
				text = user_id + "님! 회원정보 수정에 실피했습니다..!" ; break;
			default : 
				text = "수정할 회원정보를 입력하세요!"; break;
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

%>
<!-- 수정하는 곳 -->
<div class="container">
		<div class="coursebox">
			<h2>회원정보 수정</h2>
			<form action="<%=root%>/user/userUpdate_pro.jsp" method="post"  name="userUpdateForm" onsubmit="return checkUserUpdate()">
			<%-- <input type="hidden" name="courseId" class="form-control" id="courseId" value="<%= id %>"> --%>
				<div class="mb-3">
					<label for="userId" class="form-label">유저 아이디</label> <input
						type="text" name="userId" class="form-control" id="userId"
						value="<%= user.getUserId() %>" disabled>
				</div>
				<div class="mb-3">
					<label for="userName" class="form-label">유저 이름</label> <input
						type="text" name="userName" class="form-control" id="userName"
						value="<%=user.getName()%>">
				</div>
				<div class="mb-3">
					<label for="userPw" class="form-label">비밀번호</label> <input
						type="text" name="userPw" class="form-control" id="userPw"
						value="<%=user.getPassword()%>">
				</div>
				<div class="mb-3">
					<label for="userEmail" class="form-label">이메일</label> <input
						type="text" name="userEmail" class="form-control"
						id="userEmail" value="<%=user.getEmail()%>">
				</div>
				<div class="mb-3">
					<label for="userPhone" class="form-label">핸드폰번호</label> <input
						type="text" name="userPhone" class="form-control"
						id="userPhone" value="<%=user.getPhone()%>">
				</div>
			<!-- 버튼 -->
			<div class="butnn">
			<a href="<%=root %>/user/userDel_pro.jsp?userId=<%= user.getUserId() %>" class="btn-3d yellow">회원 탈퇴</a> 
					<input type="submit"  class="btn-3d btn-3d-2 yellow" value="회원 수정"></input>
				</div>
			</form>
		</div>
	</div>

<!-- <script>
$('a').click(function(event){
    event.preventDefault(); 
  });
</script> -->
<jsp:include page="${root}/layout/footer.jsp" />
<script src="<%= root %>/static/scripts/validation.js"></script>
</body>
</html>