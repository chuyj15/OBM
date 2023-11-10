<!-- escape 커뮤니케이션 페이지( 공통faq) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
<%
String root = request.getContextPath();
%>
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root%>/static/css/QNAcommu.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style> 
/* 서브 메뉴 스타일링 */
#blind1 {
display: none;
}
   
#blind2 {
display: none;
}
   
#blind3 {
display: none;
}
   
#blind4 {
display: none;
}
   
.mb-0 {
cursor: pointer;
user-select:none;
}

.mb-0:hover {
text-shadow: 3px 3px 3px rgb(192, 192, 192);
}
</style>


</head>
<body>

<jsp:include page="${root}/layout/header.jsp" />

<script>
$(document).ready(function() {
    // main menu를 클릭했을 때
    $("#mainMenu1").click(function() {
        // sub menu가 보이도록 토글
        $("#blind1").toggle();
    });
    
    // main menu를 클릭했을 때
    $("#mainMenu2").click(function() {
        // sub menu가 보이도록 토글
        $("#blind2").toggle();
    });
    
    // main menu를 클릭했을 때
    $("#mainMenu3").click(function() {
        // sub menu가 보이도록 토글
        $("#blind3").toggle();
    });
    
    // main menu를 클릭했을 때
    $("#mainMenu4").click(function() {
        // sub menu가 보이도록 토글
        $("#blind4").toggle();
    });
});
</script>


	<div class="container">
		<div
			class="firstdiv row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			<div class="col p-4 d-flex flex-column position-static">
				<h3 class="mb-0" id="mainMenu1">한 사람이 예약할 수 있는 수량에 제한이 있나요?</h3>
				<p class="card-text mb-auto" id="blind1">
				<br>
				∙ 상품 별로 1인당 최대 예약 가능 수가 제한되어 있을 수 있습니다.
				<br>
				∙ 옵션 선택 영역에 예약 가능 수가 기재되어 있으니 참고 부탁 드립니다.</p>

			</div>
		</div>

		<div
			class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			<div class="col p-4 d-flex flex-column position-static">
				<h3 class="mb-0" id="mainMenu2">예약일(사용일) 당일 환불 가능한가요?</h3>
				<p class="card-text mb-auto" id="blind2">
				<br>
				∙ 재판매가 어려워 예약일(사용일) 당일 환불은 불가합니다. 다만 일부 티켓은 수수료 공제 환불이 가능하오니 상품 설명 또는 취소/환불 페이지를 확인해 주시기 바랍니다.</p>
			</div>
		</div>

		<div
			class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			<div class="col p-4 d-flex flex-column position-static">
				<h3 class="mb-0" id="mainMenu3">회원가입에 나이제한이 있나요?</h3>
				<p class="card-text mb-auto" id="blind3">
				<br>
				∙ 만 14세 미만은 티몬 이용약관에 따라 회원가입 및 구매/결제 활동을 제한합니다. 만 14세 이상부터 회원 가입이 가능합니다.</p>
			</div>
		</div>


		<div
			class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			<div class="col p-4 d-flex flex-column position-static">
				<h3 class="mb-0" id="mainMenu4">후기가 너무 안좋네요. 환불해주세요.</h3>
				<p class="card-text mb-auto" id="blind4">
				<br>
				∙ 후기만으로는 환불이 불가합니다. 구매한 상품의 취소/환불 규정에 따라서만 처리가 가능하니, 상품설명 또는 취소/환불 페이지 내 취소/환불 규정을 확인하시기 바랍니다.</p>
			</div>
		</div>

	</div>

<jsp:include page="${root}/layout/footer.jsp" />
	
</body>
</html>





