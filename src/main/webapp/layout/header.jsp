<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
      <script>
                            
        document.addEventListener('DOMContentLoaded', ()=>{
            let $theme = document.getElementById('theme')
            $theme.addEventListener('click', ()=>{
                window.scrollTo(0,2400)
            })
        })
        </script>
    
        
   <nav class="navbar navbar-expand-md navbar-dark bg-dark" aria-label="Fourth navbar example" style="position:fixed; z-index:5; width:100%;">
    <div class="container-fluid">
     <a class="navbar-brand" href="<%= root %>/index.jsp">Escape Room Cafe</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse header" id="navbarsExample04">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
          <!--  -->
          </li>
          <li class="nav-item">
           <!--  <button  class="nav-link" id="theme">THEME</button > -->
             <a class="nav-link" href="<%= root %>/index.jsp#courseStart">THEME</a>
          </li>
          <li class="nav-item">
          <!--   <button  class="nav-link" id="review">REVIEW</button > -->
            <a class="nav-link" href="<%= root %>/index.jsp#reviewScroll">REVIEW</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= root%>/index/reservation.jsp">RESERVATION</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=root%>/index/QNAcommu.jsp">FAQ</a>
          </li>
          <!-- 
          <li class="nav-item">
            <a class="nav-link disabled" aria-disabled="true">Disabled</a>
          </li>
           -->
           <!-- 
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
           -->
        </ul>
		<ul class="navbar-nav me-auto mb-2 mb-md-0" style="position: absolute; right: 10px;">
		
		<!-- 윤주 수정 -->
		<%
		String user_id = (String) session.getAttribute("user_id");
		if (user_id ==null || user_id==""){	%>
			<li class="nav-item"><a class="nav-link" href="<%=root%>/index/loginandsignup.jsp">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=root%>/index/loginandsignup.jsp">회원가입</a></li>
		<% } else if (user_id != "admin") {	
			%>
			<li class="nav-item"><a class="nav-link" href="<%=root%>/user/mypage.jsp ">MyPage</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=root%>/index/logout_pro.jsp">로그아웃</a></li>
			
			<% 
		} else {
			%>
			<li class="nav-item"><a class="nav-link" href="<%=root%>/admin/OTO_con.jsp ">1:1문의관리</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=root%>/admin/user_con.jsp ">유저 관리</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=root%>/admin/order_con.jsp ">주문 관리</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=root%>/user/logout_pro.jsp">로그아웃</a></li>
			
			<% 
		}
		%>
		</ul>
		</div>
    </div>
  </nav>
  
  
 