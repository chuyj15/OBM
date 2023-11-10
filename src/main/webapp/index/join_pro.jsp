<%@page import="obm.dto.User"%>
<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="obm.dao.UserDAO"></jsp:useBean>>


<%
	request.setCharacterEncoding("UTF-8");
	//루트 경로 문자열입니다.
	String root = request.getContextPath();
	

	//유저 DTO를 생성합니다.
	User user = new User();

	
	//DTO에 요청받은 파라미터 넣습니다.
	user.setUserId(request.getParameter("userId"));
	user.setName(request.getParameter("userName"));
	user.setPassword(request.getParameter("userPw"));
	/* 수정 */
	user.setEmail(request.getParameter("email"));
	user.setPhone(request.getParameter("userPhone"));
	
	
	//회원가입을 실행하고 결과값을 반환받습니다.
	int result = userDAO.join(user);

	
	//성공시 세션을 생성하고 메인페이지(index.jsp)로 이동합니다.
	if(result>0){
		session.setAttribute("user_id", request.getParameter("userId"));
		session.setAttribute("user_pw", request.getParameter("userPw"));
		response.sendRedirect(root+"/?msg=joinS");
		
	//실패시 회원가입 페이지로 돌아갑니다.zz
	}else{
		
		response.sendRedirect(root+"/index/loginandsignup.jsp?msg=joinF");
		
	}


%>