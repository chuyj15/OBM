<%@page import="obm.dto.Oto"%>
<%@page import="obm.dto.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<jsp:useBean id="otoDAO" class="obm.dao.OtoDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_con</title>
<!-- 기본 링크들 -->
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/OTO_con.css">

</head>
<body>
	<jsp:include page="${root}/layout/header.jsp" />
	<div class="container">
	<h2>1:1 문의 관리</h2>
	<%
	
		//msg = reviewF : 후기 등록 실패
				
			String msg = request.getParameter("msg");
			msg = msg==null ? "" : msg;
			String text = "";
			String user_id = (String)session.getAttribute("user_id");
			switch(msg){
			case "otocomF" : 
				text = user_id + "님 답변등록에 실패했습니다..." ; break;
			case "otocomS" : 
				text = user_id + "님 문의답변을 완료했습니다~!" ; break;
			default : 
				text = "문의에 대한 답변을 남겨주세요!"; break;
			}
			%>
<!-- 메세지를 표현해줄 곳 -->
<div class='typing'><h1 class="msgg"></h1></div>
<script>
const $text = document.querySelector(".typing .msgg");
//글자 모음
const letters = [
"<%= text %>"
];
//글자 입력 속도
const speed = 100;
let i = 0;
//타이핑 효과
const typing = async () => {  
const letter = letters[i].split("");
while (letter.length) {
 await wait(speed);
 $text.innerHTML += letter.shift(); 
}
// 잠시 대기
await wait(800);
}
//딜레이 기능 ( 마이크로초 )
function wait(ms) {
return new Promise(res => setTimeout(res, ms))
}
//초기 실행
setTimeout(typing, 1500);
</script>
		<div class="tablecon">
			<form action="<%=root%>/admin/OTO_conRead.jsp" name="">
				<%
				List<Oto> otoList = otoDAO.readListByAdmin();
				%>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th>비고</th>
							<th>문의아이디</th>
							<th>유저아이디</th>
							<th>문의제목</th>
							<th>문의내용</th>
							<th>카테고리</th>
							<th>등록일자</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < otoList.size(); i++) {
							Oto oto = otoList.get(i);
						%>
						<tr>
							<!--  primary  key -->
							<td><a style="position:relative; text-decoration : none;" class = "btn-3d yellow" href="<%=root%>/admin/OTO_conRead.jsp?otoId=<%=oto.getOtoId()%>">답변등록</a></td>
							<td><%=oto.getOtoId()%></td>
							<td><%=oto.getUserId()%></td>
							<td><%=oto.getTitle()%></td>
							<td><%=oto.getContent()%></td>
							<td><%=oto.getCategory()%></td>
							<td><%=oto.getRegDate()%></td>
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

			// 유효성 검사를 통과한 경우 삭제 실행(submit 타입의 버튼이 눌린것과 같은 효과로 action으로 넘어감)
			document.myform.submit();
		}
	</script>

</body>
</html>