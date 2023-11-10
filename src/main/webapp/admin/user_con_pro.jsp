<%@page import="obm.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="obm.dao.UserDAO" />
<%
	// 선택박스에서 선택된 것들의 value만 배열로 넘어오게 되어있음.
	String userId = request.getParameter("rowcheck");
	out.println("userId");
	String root = request.getContextPath();
	
	int result = userDAO.delUser(userId);		// 유저 정의가 안되어있음 DTO에서 유저 정의하고 확인
	
	String msg = "";
	String url = "";

	if(result > 0) {
		msg = "삭제성공";
		url = root + "/admin/user_con.jsp?msg=userDel";				// 삭제완료 후 갈 페이지 (user_con.jsp)
	} else {
		msg = "삭제실패";
		url = root + "/admin/user_con.jsp?msg=userNoDel";
	}
%>

<script type="text/javascript">
	alert("<%= msg %>");
	location.href = '<%= url %>';	/* 이동할때 사용하는 기능 */
</script>