<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String root = request.getContextPath(); %>
<jsp:include page="${root}/static/links/links.jsp" />
 <link rel="stylesheet" href="<%= root %>/static/css/loginandsignup.css">
 
</head>

<jsp:include page="${root}/layout/header.jsp" />
<body class="loginandsignup">
<!-- 메세지를 표현해줄 곳 -->
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
	case "joinF" : 
		text = "회원가입에 실패하였습니다." ; break;
	case "" : 
		text = "로그인 정보를 입력하세요" ; break;
	}	
%>
<div class='typing' style="margin: 10px; position: absolute; z-index:5; top : 80px; left : 800px; background-color: initial !important; color:gray !important; "><p class="msgg" style="background-color: initial !important; font-size: 22px; text-shadow: 7px 7px 15px white;"></p></div>
<script>
const $text = document.querySelector(".typing .msgg");
//글자 모음
const letters = ["<%= text %>"];
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

  <div class="cotn_principal">
  
    <div class="cont_centrar">

      <div class="cont_login">
      
        <div class="cont_info_log_sign_up">
          <div class="col_md_login">
            <div class="cont_ba_opcitiy">

              <h2>LOGIN</h2>
              <p>로그인을 해주세요</p>
              <button class="btn_login" onclick="change_to_login()">LOGIN</button>
            </div>
          </div>
          <div class="col_md_sign_up">
            <div class="cont_ba_opcitiy">
              <h2>SIGN UP</h2>


              <p>회원가입을 해주세요</p>

              <button class="btn_sign_up" onclick="change_to_sign_up()">SIGN UP</button>
            </div>
          </div>
        </div>


        <div class="cont_back_info">
          <div class="cont_img_back_grey">
            <img src="img/login.png" alt="" />
          </div>

        </div>
        <div class="cont_forms">
          <div class="cont_img_back_">
            <img src="img/signup.png" alt="" />
          </div>
          
          <%
          
          Cookie[] cookies = request.getCookies();
          
          String reUserId = "";
          String reId = "";
          
          
          for(int i = 0; i<cookies.length; i++){
        	  
        	  if(cookies[i].getName().equals("user_id")){
        		  reUserId = cookies[i].getValue();
        	  }else if(cookies[i].getName().equals("reId")){
        		  reId = cookies[i].getValue();
        	  }
        	  
          }
          
          %>
          
          
          <!-- 로그인폼 -->
          <form action="login_pro.jsp" class="cont_form_login" method="post">
            <a href="#" onclick="hidden_login_and_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
            <h2>LOGIN</h2>
            <input type="text"  name="user_id" placeholder="ID" value="<%=reUserId%>"/>
            <input type="password"  name="password" placeholder="PASSWORD" />
            <button class="btn_login" onclick="change_to_login()">LOGIN</button>
          <div class="form-check text-start my-3 d-flex justify-content-around">
				<div class="item">
					<input class="form-check-input" type="checkbox" value="reId" name="reId"
						id="flexCheckDefault1" <%if(reId.equals("reId")) out.print("checked");%>> <label class="form-check-label"
						for="flexCheckDefault1">아이디 저장</label>
				</div>

				<div class="item">
					<input class="form-check-input" type="checkbox" value="on" name="auto"
						id="flexCheckDefault2" > <label class="form-check-label" for="flexCheckDefault2">자동 로그인</label>
				</div>
			</div>

          </form>
          <!-- 회원가입폼 -->
          <form action="join_pro.jsp" class="cont_form_sign_up" method="post">
            <a href="#" onclick="hidden_login_and_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
            <h2>SIGN UP</h2>
            <input type="text" placeholder="ID" name="userId" />
            <input type="text" placeholder="NAME" name="userName" />
            <input type="text" placeholder="EMAIL" name="email" />
            <input type="text" placeholder="PHONE" name="userPhone" />
            <input type="password" placeholder="Password" name="userPw" />
            <input type="password" placeholder="Confirm Password" name="pw_confirm" />
            <button class="btn_sign_up" onclick="change_to_sign_up()">SIGN UP</button>

          </form>

        </div>

      </div>
    </div>
  </div>

  <script src="<%= root %>/static/scripts/loginandsignup.js"></script>
  <!-- 추가 -->
  <script src="<%= root %>/static/scripts/validation.js"></script>
  
  
</body>
  <jsp:include page="${root}/layout/footer.jsp" />
</html>