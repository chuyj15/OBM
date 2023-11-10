<!-- 실제 예약 등록 처리 구현 -->
<%@page import="obm.dto.User"%>
<%@page import="obm.dao.UserDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="obm.dao.OrderDAO"%>
<%@page import="obm.dto.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// 객체 생성
	Order order = new Order(); 
	OrderDAO orderDAO = new OrderDAO();
	UserDAO userDAO = new UserDAO();
	
    
	String userId = (String) session.getAttribute("user_id")==null? "비회원" : (String) session.getAttribute("user_id");
	

	// 예약 페이지에서 입력된 정보들을 하나씩 다 얻어서 변수에 저장
	String courseName = request.getParameter("courseName");
	int courseDuration = Integer.parseInt(request.getParameter("courseDuration"));
	int coursePrice = Integer.parseInt(request.getParameter("coursePrice"));
	String resDate = request.getParameter("resDate");
	int resTime = Integer.parseInt(request.getParameter("resTime"));
	int hc = Integer.parseInt(request.getParameter("hc"));
	String phone = request.getParameter("phone");
	String name = request.getParameter("name");
	
	
	order.setUserId(userId);
	order.setCourseName(courseName);
	order.setResDate(resDate);
	order.setResTime(resTime);
	order.setDuration(courseDuration);
	order.setHc(hc);
	order.setPhone(phone);
	order.setResName(name);

	if(userId.equals("비회원")) {
		order.setPrice(coursePrice);
	}
	else {
		int inputPoint2 = Integer.parseInt(request.getParameter("userInput"));
		int inputPoint = Integer.parseInt(request.getParameter("hiddenUserInput"));
		order.setPrice(coursePrice-inputPoint);
	}
	
	
	int result = orderDAO.add(order);
	
	// 비회원일 땐 order 정보만 저장
	if(userId.equals("비회원")) {
		
		if(result>0){
			
			response.sendRedirect(request.getContextPath()+"/index/order_complete.jsp?order="+phone);
			System.out.println("order success");
			
		}else{
			System.err.println("order failed");
			response.sendRedirect(request.getContextPath()+"/index/reservation.jsp?msg=failed");
		}
	}
	// 회원일 땐 order 정보 및 point 사용 정보도 저장
	else {
		int inputPoint = Integer.parseInt(request.getParameter("hiddenUserInput"));
		int result2 = userDAO.usePoint(userId, inputPoint);
		
		if(result>0 && result2>0){
			
			response.sendRedirect(request.getContextPath()+"/index/order_complete.jsp?order="+phone);
			System.out.println("order success");
			
		}else{
			System.err.println("order failed");
			response.sendRedirect(request.getContextPath()+"/index/reservation.jsp?msg=failed");
		}
	}
	
	
%>