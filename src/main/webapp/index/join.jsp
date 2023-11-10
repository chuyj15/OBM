<!-- Escape Room 회원가입 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join escape</title>
<!-- 여기서부턴 그냥 다 넣어주기 -->
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- 제목폰트 넣었음 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<!-- 구글 폰트 넣었음용. -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<!--폰트어썸 라이브러리 넣기  -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer">
	<% String root = request.getContextPath(); %>
<!--내가 만든 css --> 
	<link rel="stylesheet" href="<%=root %>/static/css/index.css">
</head>
<body>
	<!-- 여기서 절대경로 / 는 webapp까지임-->
	<jsp:include page="../layout/header.jsp" />
	<div style="height: 200px; "></div>
	
	<div class="container mt-5 mb-5" style="width : 800px;">

<%

 	//msg=joinF 회원가입에 실패하였을 경우
 	

%>
		<form action="join_pro.jsp" name="joinForm" method="post">



			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">아이디</label> <input
					type="text" class="form-control col-md-10" name="userId"
					placeholder="아이디를 입력해주세요" required>
				<!-- required 하면 이 입력란을 작성해달라고 뜸 -->
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">비밀번호</label> <input
					type="password" class="form-control col-md-10" name="userPw"
					placeholder="비밀번호를 입력해주세요" required>
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">비밀번호 확인</label> <input
					type="password" class="form-control col-md-10" name="pw_confirm"
					placeholder="비밀번호를 다시한번 입력해주세요" required>
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">이름</label> <input
					type="text" class="form-control col-md-10" name="userName"
					placeholder="이름을 입력해주세요" required>
			</div>

			<div class="input-group mb-3 row" style="">
				<label class="input-group-text col-md-2" id="">이메일</label>
				<div class="row col-md-10 align-items-center" style="">
					<div class="col-3 px-0">
						<input type="text" class="form-control col-md-10" name="email1" style=""
							placeholder="이메일을 입력해주세요">
					</div>
					<div class="col-auto">@</div>
					<div class="col-3 px-0">
						<select name="email2" class="form-select" style="">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="kakao.com">kakao.com</option>
						</select>
					</div>
				</div>
			</div>

			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">전화번호</label> <input
					type="text" class="form-control col-md-10" name="userPhone"
					placeholder="전화번호를 입력해주세요">
			</div>

			<!-- 버튼 -->
			<div class="d-flex justify-content-center mt-5">
				<input type="submit" class="btn btn-lg btn-primary" value="가입" /> <a
					href="javascript: history.back()" class="btn btn-lg btn-secondary">가입취소</a>
				<!-- javascript: history.back()" : 뒤로가기 -->
			</div>
		</form>

	</div>

	<jsp:include page="../layout/footer.jsp" />
</body>
</html>





