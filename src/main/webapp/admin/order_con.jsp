<%@page import="obm.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
//관리자가 예약내역을 확인할 수 있어야 함. 
%>
<jsp:useBean id="orderDAO" class="obm.dao.OrderDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_con</title>
<!-- 기본 링크들 -->
<jsp:include page="${root}/static/links/links.jsp"/>
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/order_con.css">

</head>
<body>
	<jsp:include page="${root}/layout/header.jsp"/>
	<div class="container">
	<h2>예약 내역 관리</h2>
	
		<div class="tablecon">
			<form action="<%=root%>/admin/order_con_pro.jsp" name="">
				<%
				List<Order> orderList = orderDAO.getOrderList();
				%>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
						<th>환불</th>
							<th>주문아이디</th>
							<th>유저아이디</th>
							<th>코스명</th>
							<th>예약날짜</th>
							<th>예약시간</th>
							<th>진행시간</th>
							<th>등록일자</th>
							<th>취소여부</th>
							<th>인원수</th>
							<th>핸드폰번호</th>
							<th>완료여부</th>
							<th>가격</th>
							<th>예약자명</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < orderList.size(); i++) {
							Order order = orderList.get(i);
						%>
						<tr>
							<!--  primary  key -->
							
							<% if (order.getIsCancel() == 1 )  {%>
							<td>환불완료</td>
							<% } else {%>
							<td><a style="position:relative; text-decoration : none;" class="btn-3d yellow" href="<%=root%>/admin/order_del_pro.jsp?orderId=<%=order.getOrderId()%>">환불</a></td>
							<% } %>
							<td><%=order.getOrderId()%></td>
							<td><%=order.getUserId()%></td>
							<td><%=order.getCourseName()%></td>
							<td><%=order.getResDate()%></td>
							<td><%=order.getResTime()%></td>
							<td><%=order.getDuration()%></td>
							<td><%=order.getRegDate()%></td>
							<td><%=order.getIsCancel()%></td>
							<td><%=order.getHc()%></td>
							<td><%=order.getPhone()%></td>
							<td><%=order.getIsDone()%></td>
							<td><%=order.getPrice()%></td>
							<td><%=order.getResName()%></td>
						
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<!-- 버튼 -->
<!-- 				<div class="coursebtn">
 					<input type="submit" value="답변 작성" class="btn-3d yellow"> 
				</div> -->
			</form>
		</div>
	</div>


	<jsp:include page="${root}/layout/footer.jsp" />






<!-- 이건 잘 모르겠음.. 어쨌든 하나만 체크하게 해야할 것 같음. -->
	<script type="text/javascript">
		function allCheck() {
			var ac = document.user_con.allcheck;
			var rc = document.user_con.rowcheck;
			if (ac.checked == true) {
				for (i = 0; i < rc.length; i++) {
					rc[i].checked = true; // 체크
				}
				alert("전체행이 체크 되었습니다.")
			} else {
				for (i = 0; i < rc.length; i++) {
					re[i].checked = false; // 체크해제
				}
				alert("전체행이 체크 해제되었습니다.")
			}
		}

		function goToDelete() {
			var rc = document.myform.rowcheck;
			// 하나도 선택되지 않은 상태에서는 삭제로 넘어갈 수 없도록 유효성 검사
			flag = false;

			for (i = 0; i < rc.length; i++) {
				if (rc[i].checked) {
					flag = true;
				}
			}

			if (flag == false) {
				alert("하나 이상 선택되어야 삭제가 가능합니다.");
				return;
			}
/* 
			// 유효성 검사를 통과한 경우 삭제 실행(submit 타입의 버튼이 눌린것과 같은 효과로 action으로 넘어감)
			document.myform.submit(); */
		}
	</script>

</body>
</html>