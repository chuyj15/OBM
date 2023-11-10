<%@page import="java.time.LocalDate"%>
<%@page import="obm.dto.Course"%>
<%@page import="obm.dao.CourseDAO"%>
<%@page import="obm.dto.Order"%>
<%@page import="java.util.List"%>
<%@page import="obm.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String root = request.getContextPath();
    %>
    
<jsp:include page="/static/links/links.jsp" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=root%>/static/css/reservation.css">
<meta charset="UTF-8">
<title>코스/날짜/시간 선택</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(function(){
		
		function choice(n){
			
			$(".radio-con input").eq(n).prop("disabled",true);
		}
	})
	
	</script>
</head>
<body>
	<jsp:include page="${root}/layout/header.jsp" />
	<style>

	.form-select {
		--bs-form-select-bg-img: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='white' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e") !important;
	}
	input {
	  color-scheme: dark;  /* 달력 하얀색 다크 */
	}
</style>
	
<div class="container">

	
	<h1>예약하기</h1>
	
	<br>
	
	<h5>코스 / 날짜 / 시간</h5>

	
	<%
		
		LocalDate today = LocalDate.now();
		CourseDAO courseDAO = new CourseDAO();
		String resDate = request.getParameter("resDate"); // "2023-09-25"
	
		if(resDate != null){
		Course course = courseDAO.choice(Integer.parseInt(request.getParameter("courseId")));	//아이디 받아서 코스 정보 반영. DAO연동. DAO메소드 수정
		String courseName = course.getCourseName();
		int courseDuration = course.getDuration();
		int coursePrice = course.getPrice();
		
		
		int resTimeValue9 = 9;
		int resTimeValue10 = 10;
		int resTimeValue11 = 11;
		int resTimeValue12 = 12;
		int resTimeValue13 = 13;
		int resTimeValue14 = 14;
		int resTimeValue15 = 15;
		int resTimeValue16 = 16;
		int resTimeValue17 = 17;
		int resTimeValue18 = 18;
		boolean rtvt1 = true;
		boolean rtvt2 = true;
		boolean rtvt3 = true;
		boolean rtvt4 = true;
		boolean rtvt5 = true;
		boolean rtvt6 = true;
		boolean rtvt7 = true;
		boolean rtvt8 = true;
		boolean rtvt9 = true;
		boolean rtvt10 = true;
		
			
		OrderDAO orderDAO = new OrderDAO();
		List<Order> checkList = orderDAO.resDateCheck(resDate,courseName);
		for(int i =0; i<checkList.size(); i++){
			int resTime = checkList.get(i).getResTime();
			int duration = checkList.get(i).getDuration();
			System.out.println(i+"resTime"+resTime);
			System.out.println(i+"resDate"+duration);
			
			if(resTime<=resTimeValue9&&resTimeValue9<=resTime+duration){
				rtvt1 = false;
			}else if(resTime<=resTimeValue10&&resTimeValue10<=resTime+duration){
				rtvt2 = false;
				%>
				<script>
				choice(1);
				</script>
			
			<%
			}else if(resTime<=resTimeValue11&&resTimeValue10<=resTime+duration){
				rtvt3 = false;
				%>
				<script>
				choice(2);
				</script>
			
			<%
			}else if(resTime<=resTimeValue12&&resTimeValue10<=resTime+duration){
				rtvt4 = false;
				%>
				<script>
				choice(3);
				</script>
			
			<%
			}else if(resTime<=resTimeValue13&&resTimeValue10<=resTime+duration){
				rtvt5 = false;				
				%>
				<script>
				choice(4);
				</script>
			<%
			}else if(resTime<=resTimeValue14&&resTimeValue10<=resTime+duration){
				rtvt6 = false;
				%>
				<script>
				choice(5);
				</script>
			
			<%
			}else if(resTime<=resTimeValue15&&resTimeValue10<=resTime+duration){
				rtvt7 = false;
				%>
				<script>
				choice(6);
				</script>
			
			<%
			}else if(resTime<=resTimeValue16&&resTimeValue10<=resTime+duration){
				rtvt8 = false;
				%>
				<script>
				choice(7);
				</script>
			
			<%
			}else if(resTime<=resTimeValue17&&resTimeValue10<=resTime+duration){
				rtvt9 = false;
				%>
				<script>
				choice(8);
				</script>
			
			<%
			}else if(resTime<=resTimeValue18&&resTimeValue10<=resTime+duration){
				rtvt10 = false;
				%>
				<script>
				choice(9);
				</script>
			<%
			}
			else{
			}
		}
		%>
		
		<div class="second-page-fd">
		<form action="reservation.jsp" method="post">
			<input type="date" name="resDate" value="<%=resDate%>" class="form-control bg-dark text-white" style="position:relative !important; left:42%; width:200px !important;">
			<select name="courseId" class="form-select bg-dark text-white" id="course-one" style="width:200px; position:relative !important; left:42%;">
			<%
				List<Course> courseList = courseDAO.getCourseList();
				
				for(int i = 0; i<courseList.size(); i++){
					Course courseOne = courseList.get(i);
				
			%>
			<option value="<%=courseOne.getCourseId()%>">
			<%
				
				out.print(courseOne.getCourseName());
			
				}
			%>
			</option>
			
			</select>
				<input type="submit" value="조회" class="btn btn-outline-light" style="width:200px !important; position:relative !important; left:-4px;">
				
		</form>
		</div>
		
		<div class="second-page-sd">
		<form action="order.jsp" method = "post">
			<div class="radio-con">
			<input type="hidden" name="resDate" value="<%=resDate%>">
			
				<input id = "resTime9" class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue9%>" <%if(!rtvt1) out.print("disabled");%>>
				<label for="resTime9" class="btn btn-outline-light">09시</label>
				<input id = "resTime10"  class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue10%>" <%if(!rtvt2) out.print("disabled"); %>>
				<label for="resTime10" class="btn btn-outline-light">10시</label>
				<input id = "resTime11"  class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue11%>" <%if(!rtvt3) out.print("disabled"); %>>
				<label for="resTime11" class="btn btn-outline-light">11시</label>
				<input id = "resTime12"  class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue12%>" <%if(!rtvt4) out.print("disabled"); %>>
				<label for="resTime12" class="btn btn-outline-light">12시</label>
				<input id = "resTime13"  class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue13%>" <%if(!rtvt5) out.print("disabled"); %>>
				<label for="resTime13" class="btn btn-outline-light">13시</label><br>
				<input id = "resTime14"  class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue14%>" <%if(!rtvt6) out.print("disabled"); %>>
				<label for="resTime14" class="btn btn-outline-light">14시</label>
				<input id = "resTime15"  class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue15%>" <%if(!rtvt7) out.print("disabled"); %>>
				<label for="resTime15" class="btn btn-outline-light">15시</label>
				<input id = "resTime16"  class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue16%>" <%if(!rtvt8) out.print("disabled"); %>>
				<label for="resTime16" class="btn btn-outline-light">16시</label>
				<input id = "resTime17"  class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue17%>" <%if(!rtvt9) out.print("disabled"); %>>
				<label for="resTime17" class="btn btn-outline-light">17시</label>
				<input id = "resTime18"  class ="btn-check" type="radio" name="resTime" value="<%=resTimeValue18%>" <%if(!rtvt10) out.print("disabled"); %>>
				<label for="resTime18" class="btn btn-outline-light">18시</label><br>
			</div>
				<input type="hidden" name="courseName" value="<%=courseName%>">
				<input type="hidden" name="courseDuration" value="<%=courseDuration%>">
				<input type="hidden" name="coursePrice" value="<%=coursePrice%>">
				
				<br>
			</div>
			<div class="second-page-td">
				<input type="submit" value="예약하기">
			</div>
		
		</form>
			<%
			
		}else{
			
			%>
			<div class="first-page">
			<form action="reservation.jsp" method="post">
				<div class="row">
					<div class="col">
						<input type="date" name="resDate" min="<%=today%>"value="<%=today%>" class="form-control bg-dark text-white w-100">
					</div>
					<div class="col">
						<select name="courseId" class="form-select bg-dark text-white" id="course-two" style="width:200px;">
							<%
								List<Course> courseList = courseDAO.getCourseList();
								
								for(int i = 0; i<courseList.size(); i++){
									Course courseOne = courseList.get(i);
								
							%>
							<option value="<%=courseOne.getCourseId()%>">
							<%
								
								out.print(courseOne.getCourseName());
							
								}
							%>
							</option>
						
							<%
							
							%>
						
						</select>
					
					</div>
					<div class="col">
						<input type="submit" value="조회" class="btn btn-outline-light w-100">
					</div>
					
				</div>
			
			
			</form>
			<%
		}
	%></div>

</div>
<jsp:include page="${root}/layout/footer.jsp" />
	
</body>
</html>





