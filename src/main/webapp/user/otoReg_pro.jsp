<%@page import="obm.dao.OtoDAO"%>
<%@page import="obm.dto.Oto"%>
<%@page import="obm.dto.User"%>
<jsp:useBean id="userDAO" class="obm.dao.UserDAO"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 문의 접수 실제 구현 페이지

	String root = request.getContextPath();
	
	// 일대일 문의 객체 생성
	Oto oto = new Oto();
	
	// 현재 세션에 로그인 되어있는 유저 아이디 정보 얻기
	String loginId = (String) session.getAttribute("user_id");
	User user = userDAO.getInfo(loginId);
	
	// 문의 접수 페이지에 입력된 정보를 얻어 변수에 저장
	String category = request.getParameter("category");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 얻어온 정보를 oto 객체에 세팅
	oto.setUserId(loginId);
	oto.setPhone(user.getPhone());
	oto.setCategory(category);
	oto.setTitle(title);
	oto.setContent(content);
	
	OtoDAO otodao = new OtoDAO();
	int result = otodao.add(oto);
	
	if(result>0){
		
	response.sendRedirect(root+"/user/otoRead.jsp");
		
	}else{
		response.sendRedirect(root+"/user/otoReg.jsp?msg=regF");
	}
	
	
	

%>