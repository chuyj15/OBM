<%@page import="java.util.ArrayList"%>
<%@page import="obm.dto.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<jsp:useBean id="userDAO" class="obm.dao.UserDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_con</title>
<!-- 기본 링크들 -->
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/user_conn.css">

</head>
<body>
	<jsp:include page="${root}/layout/header.jsp" />
	<div class="container">
		<div class="tablecon">
			<form action="<%=root%>/admin/user_con_pro.jsp" name="user_con">
				<%
				List<User> userList = userDAO.userListByAdmin();
				%>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th><input type="checkbox" name="allcheck"
								onClick="allCheck()" /></th>
							<th>유저아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>포인트</th>
							<th>등급</th>
							<th>전화번호</th>
							<th>가입일자</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < userList.size(); i++) {
							User user = userList.get(i);
						%>
						<tr>
							<!--  primary  key -->
							<td><input type="checkbox" name="rowcheck"
								value="<%=user.getUserId()%>" /></td>
							<td><%=user.getUserId()%></td>
							<td><%=user.getName()%></td>
							<td><%=user.getEmail()%></td>
							<td><%=user.getPoint()%></td>
							<td><%=user.getGrade()%></td>
							<td><%=user.getPhone()%></td>
							<td><%=user.getRegDate()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<!--윤주 수정-버튼 추가  -->
				<div class="coursebtn">
					<input type="submit" value="유저 삭제" class="btn-3d yellow">
				</div>
			</form>
		</div>
	</div>


	<jsp:include page="${root}/layout/footer.jsp" />

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

			// 유효성 검사를 통과한 경우 삭제 실행(submit 타입의 버튼이 눌린것과 같은 효과로 action으로 넘어감)
			document.myform.submit();
		}
	</script>

</body>
</html>