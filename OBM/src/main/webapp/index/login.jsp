<!-- Escape 로그인 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<% String root = request.getContextPath(); 
		String error = request.getParameter("msg");
	
	%>
<jsp:include page="${root}/static/links/links.jsp" />

<link rel="stylesheet" href="<%=root %>/static/css/login.css">

</head>
<body>
	<!-- 여기서 절대경로 / 는 webapp까지임~!  -->
	<jsp:include page="${root}/layout/header.jsp" />
	<div class="px-4 py-5 mt-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">로그인</h1>
	</div>

	<!-- 로그인 입력 폼 -->
	<main class="form-signin w-100 m-auto" style="max-width: 330px; height : 900px; ">
		<form action="login_pro.jsp"   style="">

			<div class="form-floating">
				<input type="text" class="form-control" name="user_id" id="floatingInput"
					placeholder="아이디를 입력해주세요"> <label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" name="password"
					id="floatingPassword" placeholder="비밀번호"> <label
					for="floatingPassword">비밀번호</label>
			</div>

<%
//msg=loginPwF	:로그인 실패 비밀번호만 다를시
//msg=loginIdF	:로그인 실패 아이디가 다를지
//msg=loginTrouble :로그인 메소드 실패
String msg = request.getParameter("msg");
	msg = msg==null ? "" : msg;
	String text = "";
	switch(msg){
	case "loginPwF" : 
		text = "비밀번호가 틀렸습니다" ; break;
	case "loginIdF" : 
		text = "아이디가 틀렸습니다" ; break;
	case "loginTrouble" : 
		text = "로그인에 실패했습니다" ; break;
	case "" : 
		text = "로그인 정보를 입력하세요" ; break;
	}	
%>

<!-- 메세지를 표현해줄 곳 -->
<div class='typing'><p class="msgg"></p></div>
<script>
const $text = document.querySelector(".typing .msgg");
//글자 모음
const letters = ["<%=text%>"];
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

/* // 지우는 효과
remove(); */

}

/* 
//글자 지우는 효과
const remove = async () => {
const letter = letters[i].split("");
while (letter.length) {
 await wait(speed);
 letter.pop();
 $text.innerHTML = letter.join(""); 
}

// 다음 순서의 글자로 지정, 타이핑 함수 다시 실행
i = !letters[i+1] ? 0 : i + 1;
typing();
} 
*/
//딜레이 기능 ( 마이크로초 )
function wait(ms) {
return new Promise(res => setTimeout(res, ms))
}
//초기 실행
setTimeout(typing, 1500);
</script>


			<div class="form-check text-start my-3 d-flex justify-content-around">
				<div class="item">
					<input class="form-check-input" type="checkbox" value="reId" name="reId"
						id="flexCheckDefault1"> <label class="form-check-label"
						for="flexCheckDefault1">아이디 저장</label>
				</div>

				<div class="item">
					<input class="form-check-input" type="checkbox" value="remember-me"
						id="flexCheckDefault2"> <label class="form-check-label"
						for="flexCheckDefault2">자동 로그인</label>
				</div>
			</div>

			<input class="btn btn-primary w-100 py-2" type="submit" value="로그인"></input>
		</form>
	</main>


	<jsp:include page="${root}/layout/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
</body>
</html>





