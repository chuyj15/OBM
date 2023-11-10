<%@page import="obm.dto.Review"%>
<%@page import="java.util.List"%>
<%@page import="obm.dto.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Escape Room Cafe</title>
<jsp:useBean id="courseDAO" class="obm.dao.CourseDAO"></jsp:useBean>
<jsp:useBean id="reviewDAO" class="obm.dao.ReviewDAO"></jsp:useBean>
<jsp:include page="${root}/static/links/links.jsp" />
<!--내가 만든 css -->
<link rel="stylesheet" href="<%=root %>/static/css/indexxx.css">


</head>

<body>
	<jsp:include page="layout/header.jsp" />
	
	<div id="front" class="px-4 py-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis"></h1>
		<div class="col-lg-6 mx-auto" id="front-div">
			<p class="animate__animated animate__heartBeat lead mb-4" id="titles">Escape Café Woo A Mi</p>
		</div>
	</div>
			<%
			
				//	msg=loginS : 로그인 성공
				//	msg=joinS : 회원가입 성공
				// 	msg=delS : 자가 회원 탈퇴 성공
				
			String msg = request.getParameter("msg");
			msg = msg==null ? "" : msg;
			String text = "";
			String user_id = (String)session.getAttribute("user_id");
			switch(msg){
			case "loginS" : 
				text = user_id + "님이 오늘의 주인공입니다!" ; break;
			case "joinS" : 
				text = user_id + "님! 방탈출카페의 멤버가 되셨군요!" ; break;
			case "delS" : 
				text = "아쉽네요.. 다음에 또 봐요!!" ; break;
			case "courseAdd" : 
				text = "코스추가가 완료되었습니다." ; break;
			case "courseDel" : 
				text = "코스삭제가 완료되었습니다." ; break;
			case "courseNotDel" : 
				text = "코스삭제에 실패했습니다..." ; break;
			case "courseUpd" : 
				text = "코스를 수정했습니다~!" ; break;
			case "courseNotUpd" : 
				text = "코스 수정에 실패했습니다..." ; break;
			default : 
				text = "오늘의 주인공이 되어보세요!"; break;
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


<!--회사소개 이미지  -->
<div class="company-img">
	<img alt="회사소개 이미지" src="static/img/intro.png">
</div>
	<!-- 처음에 메인그림 들어가는 곳 -->
	<div class="main-container outerClass">
		<div class="innerClass" style="height: 1000px; overflow: hidden;">
			<img src="<%=root %>/static/img/mainImage.jpg" class="img-fluid mainImg" alt="..."
				style="">
		</div>
	</div>

	<!-- 마우스그림 들어가는 곳 -->
	<div class=""
		style="height: 300px; display: flex; justify-content: center; align-items: center;">
		<img alt="" src="static/img/mouse_negative.png" style="height: 130px;">
	</div>

	<!-- 당신이주인공입니다 페이지 들어가는 곳 -->
	<div class="main-container" id="section1">
		<div class="" style="overflow: hidden;">
			<img src="./static/img/mmain.JPG" class="img-fluid" alt="당신이주인공"
				style="width: 100%;">
		</div>
	</div>

	<!-- 방탈출 코스목록 시작 -->

	<main id="courseStart">

		<section class="py-5 text-center container">
			<div class="row py-lg-5">
				<div class="col-lg-10 col-md-8 mx-auto">
					<h1 class="fw-light">방탈출 코스 목록</h1>
					<p class="lead">
						추리력, 상상력을 총동원하여 탈출하라!<br> 우아미는 여러분이 주인공이 되어 실제 상황을 방불케 하는
						미션룸에서 주어진 시간 60분만에 다양한 문제와 힌트, 추리력, 상상력 등을 통해 문제를 해결하고 탈출하는 오프라인
						게임으로서 새로운 문화 컨텐츠입니다.<br> 미션룸 입장후 출입구는 봉쇄되고 여러분 스스로 다양한 퀴즈를 출어
						주어진 시간 내에 탈출하는 것이 목표입니다. <br> 단계별로 특정수준 이상의 사고력, 추리력, 상상력 등이
						요구될 수 있습니다. 입장 시 안대, 방독면 등 장비가 주어질 수 있으며 미션 성공, 실패에 따라 다양한 엔딩 이벤트를
						제공합니다.
					</p>
				</div>
			</div>
		</section>

		<div class="album py-5">
			<div class="container">
	<!-- 코스 추가하는 버튼 추가 -->
	
	<% user_id = (String) session.getAttribute("user_id");
	if (user_id =="admin")  {
	%>
	<div class="coursebtn">
		 <a href="<%= root %>/admin/course_conAdd.jsp" class="btn-3d yellow">코스 추가</a>
	</div>
	<% } %>
	
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<!-- 코스1 -->
					
					<!-- 여기서부터 반복문을 돌려야 합니당~~~ 코스 테이블 -->
					<%
					List<Course> courseList = courseDAO.getCourseList();
					for (int i = 0; i < courseList.size(); i++) {
						Course course = courseList.get(i);
						String id = Integer.toString(course.getCourseId());
						
					%>
					<div class="col">
						<div class="card shadow-sm">
							<!-- 
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
           -->
							<img class="bd-placeholder-img card-img-top" width="100%"
								height="300" src="<%=root%>/img?id=<%=course.getCourseId()%>"
								class="w-100 p-2" />
							<div class="card-body">
								<h3><%=course.getCourseName()%></h3>
								<p class="card-text"><%=course.getDescription()%></p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<!-- 가격, 인기도 -->
										<button type="button" class="btn btn-sm"><%=course.getPrice()%>원
										</button>
										<button type="button" class="btn btn-sm">
											인기도:
											<%=course.getPopularity()%></button>
											<!-- 코스삭제 코스수정 버튼 추가 -->
											<%
		user_id = (String) session.getAttribute("user_id");
		if (user_id =="admin"){	%>
											<a href="<%=root%>/admin/course_conDel_pro.jsp?id=<%=id %>" class="btn btn-sm coursebtnn">코스 삭제</a>
											<a href="<%=root%>/admin/course_conUpd.jsp?id=<%=id %>" class="btn btn-sm coursebtnn">코스 수정</a>
											<% } %>
									</div>
									<small class="text-muted"><%=course.getDuration()%>시간</small>
								</div>
							</div>
						</div>
					</div>

					<%
					}
					%>

				</div>
			</div>
		</div>

	</main>

	<!-- 후기 -->
	<main class="container" id="reviewScroll">
		<div class="row mb-2">
			
			<!--여기서부터 후기 반복문임!! -->
			<%
			List<Review> reviewList = reviewDAO.readList();
			for (int i = 0; i < reviewList.size(); i++) {
				Review review = reviewList.get(i);
			%>
			<div class="col-md-6">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static" style="overflow: visible !important; box-shadow : 7px 7px 7px #bbf !important;">
						<strong class="d-inline-block mb-2 text-light"><%=review.getCourseName()%></strong>
						<h3 class="mb-0" style="text-shadow:7px 2px 5px #bbf; color: #bbf !important;"><%=review.getTitle()%></h3>
						<% if (review.getUserId() ==  null  || review.getUserId() == ""){
							%>
						<div class="mb-1 text-muted"><%=review.getReviewId()%></div>
						<%} else {%>
						<div class="mb-1 text-muted"><%=review.getUserId()%></div>
						<%} %>
						<p class="card-text mb-auto"><%=review.getContent()%></p>
						<div class="mb-1 text-muted"><%=review.getRegDate()%></div>
						<div class="mb-1 text-muted"><%=review.getUpdDate()%></div>
					</div>

				</div>
			</div>
			<% } %>
		</div>
	</main>

	<jsp:include page="${root}/layout/footer.jsp" />

	<script>
		let isScrolling = false;

		window.addEventListener('scroll', () => {
		    if (!isScrolling) {
		        // 스크롤 이벤트 처리를 느리게 하려면 requestAnimationFrame 내에서 setTimeout을 사용합니다.
		        setTimeout(() => {
		            // 여기에 스크롤 이벤트를 처리할 코드를 작성합니다.
		            // 예를 들어, 스크롤 위치에 따라 원하는 애니메이션을 추가할 수 있습니다.
		            isScrolling = false;
		        }, 2000); // 100 밀리초 지연을 추가하여 스크롤 이벤트 간격을 늘립니다.
		        isScrolling = true;
		    }
		});
		
		/* 스크롤양이 각각 section 들이 화면 상단에서 떨어진 거리 보다 많으면 그 섹션에 클래스명 추가 */
		$(window).scroll(function(){
			var sct = $(this).scrollTop(); //스크롤양이 변수로 잡음
			$('section').each(function(){
				var sectionOST = $(this).offset().top - 500;
				if (sct >= sectionOST){
					$(this).addClass('animate_animated');
				}
			})
		})
		
	</script>



	<!-- 부트스트랩 js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>




</body>
</html>





