<%@page import="obm.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="obm.dao.UserDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>

<%
String root = request.getContextPath();
%>
<link rel="stylesheet" href="<%=root%>/static/css/order.css">
<jsp:include page="${root}/static/links/links.jsp" />
</head>

<body>

<jsp:include page="${root}/layout/header.jsp" />
	
	
    <%	
    	request.setCharacterEncoding("UTF-8");
    
        String resDate = request.getParameter("resDate");
        String resTime= request.getParameter("resTime");
        String courseName = request.getParameter("courseName");
        String courseDuration= request.getParameter("courseDuration");
        String coursePrice= request.getParameter("coursePrice");
    	int point = 0;
        
        User user = new User();
      //User user = userDAO.getInfo((String) session.getAttribute("user_id"));
      	String userCheck = (String) session.getAttribute("user_id");
      	user = userDAO.getInfo(userCheck);
      	
        point = user.getPoint();
      
        
        boolean isUser = true;
        
        if(userCheck==null){ 	// 비회원이라면
        	isUser = false;
        }
        
    %>

	<div class="container">    
		<h1>예약하기</h1>
		
		<br>
		
		<h5>선택 코스 / 선택 날짜 / 선택 시간</h5>
	    
		<div class="reservation_info">
			<h5><%= courseName %> / <%= resDate %> / <%= resTime %>시</h5>
		</div>
		
		<br>
		
		<div class="order-box">
			<form action="order_pro.jsp" name="orderForm" method="post" onsubmit="return checkOrder()">
				
				<div class="name">
					<label>예약자명 : </label>
					<input type="text" name="name" placeholder="이름을 입력해주세요.">
				</div>
				 
				 <br>
				 
				<div class="phone">
					<label>연락처 : </label>
					<input type="text" name="phone" placeholder="전화번호를 입력해주세요.">
				</div>
				
				<br>
				
				<div class="hc">
					<label>인원 : </label>
					<select name=hc>
						<option value="2">2</option>
						<option value="2">3</option>
						<option value="2">4</option>
						<option value="2">5</option>
						<option value="2">6</option>
					</select>
				</div>
				
				<br>
				
				<div class="price">
					<label>가격 : </label>
					<span><%=coursePrice %></span>원
				</div>		
				
				<br>
				
				<!--
					가용 포인트 부분 - 회원 / 비회원 구분 필요
					=> 회원일 시 - 세션 로그인 아이디로 DB상의 포인트 값 가져 옴
					=> 비회원일 시(세션 로그인 아이디가 null일 시) - 비활성화
				-->
				<div class="use_point">
					<label>포인트 사용 : </label>
					<%
						if(isUser==false) {
					%>
					<span><input type="text" placeholder="포인트 사용 불가" readonly>p
					<button disabled value="사용">사용</button>
					</span>
					<%
						}
						else {
					%>
					<span><input type="text" id="userInput" name="userInput" placeholder="<%= point %>" value="0">p
    				<input type="button" value="사용" onclick="saveUserInput()">
    				</span>
					
					<input type="hidden" id="hiddenUserInput" name="hiddenUserInput" value="0">
					<%
						}
					%>
				</div>


				<br>
				
				<div class="price">
    				<label id="price">결제 금액 : <%= coursePrice %></label>
				</div>
				
				<br>
				
				<input type="hidden" name="courseDuration" value="<%=courseDuration %>">
				<input type="hidden" name="courseName" value="<%=courseName%>">
				<input type="hidden" name="coursePrice" value="<%=coursePrice%>">
				<input type="hidden" name="resDate" value="<%=resDate%>">
				<input type="hidden" name="resTime" value="<%=resTime%>">
				
				<button class="abutton"><a href="javascript: history.back()">취소</a></button>
				<input type="submit" value="예약" />
			</form>
		
		</div>
	</div>
	<jsp:include page="${root}/layout/footer.jsp" />
	
<script>
    function saveUserInput() {

        let userInput = document.getElementById("userInput").value;

        document.getElementById("hiddenUserInput").value = userInput;

        let coursePrice = <%= coursePrice %>;
        let updatedPrice = coursePrice - parseFloat(userInput);

        document.getElementById("price").innerHTML = "결제 금액 : " + updatedPrice;
    }
    
   /*  function prepareInput() {

        let userInput = document.getElementById("userInput").value;
        
        if (userInput === "") {
            document.getElementById("userInput").value = "0";
            document.getElementById("hiddenUserInput").value = "0";
        }
    } */
</script>
<script src="<%= root %>/static/scripts/validation.js"></script>

</body>
</html>