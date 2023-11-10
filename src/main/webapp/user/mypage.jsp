<%@page import="obm.dto.User"%>
<%@page import="java.util.Date"%>
<%@page import="obm.dto.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<jsp:useBean id="OrderDAO" class="obm.dao.OrderDAO" />
<jsp:useBean id="UserDAO" class="obm.dao.UserDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<!-- 기본 링크들 -->
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/mypagee.css">
</head>
<body>
	<jsp:include page="${root}/layout/header.jsp" />
	<%
	String userId = (String) session.getAttribute("user_id");
	List<Order> getOrderList = OrderDAO.getOrderListByUser(userId);
	User user = UserDAO.getInfo(userId);
	%>

	<!-- 전체 div -->
	<div class="container">
		<h1 class="mypageh1">My Page</h1>
		<h2>Reservation list</h2>
		<!-- 예약 현황 div -->
		<div class="tablecon">
			<table class="table table-dark table-striped">
				<thead>
					<tr>
						<th>테마 이름</th>
						<th>예약 시간</th>
						<th>진행시간</th>
						<th>예약일</th>
						<th>인원수</th>
						<th>예약전화번호</th>
						<th>후기작성</th>
					</tr>
				</thead>
				<tbody>
					<%
					
					if (getOrderList == null || getOrderList.isEmpty()) {
						 %>
						 
						 <tr>
						 	<td>예약정보가 없습니다. </td>
						 </tr>
						 
						 	<%
					} else {
					for (int i = 0; i < getOrderList.size(); i++) {
						Order order = getOrderList.get(i);
						int id = order.getOrderId();
						String course = order.getCourseName();
						int res = order.getResTime();
						int duration = order.getDuration();
						Date reg = order.getRegDate();
						int hc = order.getHc();
						String phone = order.getPhone();
						 %>
						<tr>
							<td><%=course%></td>
							<td> <%=res%> </td>
							<td><%=duration%></td>
							<td><%=reg%></td>
							<td><%=hc%></td>
							<td><%=phone%></td>
							<td>
							<% if(order.getIsDone()!=0){%>
							<a class="btn-3d btn-3d-3 blue reviewbtn " href="<%=root%>/user/regReview.jsp?courseName=<%=course%>">작성하기</a>
							 
							 <%} %>
							 
							 
							</td>
						</tr>
						<% } }%>
				</tbody>
			</table>
		</div>

<hr>
		<!-- 자기 회원정보 -->
		<h2>My Information</h2>
		<!-- 반복문을 통해서 리스트를 출력할 때, 후기 작성버튼을 통해 넘기는 값은 고유PK아닌 order.getCourseName을 넘겨주면 원할할듯 합니다! -->
		<div class="tablecon">
			<table class="table table-dark table-striped">
				<colgroup>
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><%=user.getUserId()%></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><%=user.getName()%></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=user.getEmail()%></td>
					</tr>
					<tr>
						<th>포인트</th>
						<td><%=user.getPoint()%></td>
					</tr>
					<tr>
						<th>회원등급</th>
						<td><%=user.getGrade()%></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><%=user.getPhone()%></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><%=user.getRegDate()%></td>
					</tr>

				</tbody>
			</table>
		</div>

		<!-- 버튼 -->
		<div class="butnn">
			<%-- <a href="<%=root %>/admin/course_conAdd.jsp" class="btn-3d yellow">코스 등록</a> --%>
			<!-- 	<input type="submit"  class="btn-3d yellow">코스 등록</input> -->
			<a href="<%=root %>/user/otoRead.jsp" class="btn-3d yellow">1:1 문의</a> 
			<a href="<%=root %>/user/userUpdate.jsp" class="btn-3d btn-3d-2 yellow">회원정보 수정</a>
		</div>


	</div>
<script>
$('a').click(function(event){
    event.preventDefault(); 
  });
</script>
	<jsp:include page="${root}/layout/footer.jsp" />
</body>
</html>