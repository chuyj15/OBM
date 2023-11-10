<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="obm.dao.UserDAO"></jsp:useBean>




<%
//로그인 시도 시, 아이디 기억에 대한 여부를 파악하여 쿠키를 등록 및 해제합니다.
//DB와 아이디가 다를 시, 아이디는 같은데 비밀번호 매칭 실패 시, 모두 성공시의 경우의 수를 분리했습니다.
//위 경우는 redirect를 통해 넘어간 jsp페이지에서 request.getParameter("msg")를 통해 조건문으로 작성할 수 있습니다.

String root = request.getContextPath();

String user_id = request.getParameter("user_id");
String password = request.getParameter("password");

String reId = request.getParameter("reId");

//클라이언트 측에 생성되는 쿠키 이름 : id를 담은 = userId, id저장여부를 담은 =reId.

if (reId != null) {
	Cookie cookie_id = new Cookie("user_id", user_id);
	Cookie cookie_reId = new Cookie("reId", reId);
	cookie_id.setMaxAge(1000*60*60*24);
	cookie_reId.setMaxAge(1000*60*60*24);
	response.addCookie(cookie_id);
	response.addCookie(cookie_reId);
} else {
	Cookie cookie_id = new Cookie("user_id", "");
	Cookie cookie_reId = new Cookie("reId", "");
	cookie_id.setMaxAge(0);
	cookie_reId.setMaxAge(0);
	response.addCookie(cookie_id);
	response.addCookie(cookie_reId);
}

if (user_id.equals("admin") && password.equals("dndkal")) {

	session.setAttribute("user_id", "admin");
	session.setAttribute("user_pw", "dndkal");
	response.sendRedirect(root+"/index.jsp?msg=loginS");
} else {

	int result = userDAO.login(user_id, password);

	if (result == 1) {
		/* 윤주가 추가했음 */
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_pw", password);
		response.sendRedirect(root + "/index.jsp?msg=loginS");
	} else if (result == 2) {
		/* 수정했음 */
		response.sendRedirect(root + "/index/loginandsignup.jsp?msg=loginPwF");

	} else if (result == 3) {
		response.sendRedirect(root + "/index/loginandsignup.jsp?msg=loginIdF");

	} else {
		response.sendRedirect(root + "/index/loginandsignup.jsp?msg=loginTrouble");
	}
}
%>