<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500페이지</title>
<style>


 body{
    background-color: #040D12;
 	
 }
	.container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 95vh; 
    text-align: center;
    background-color: #040D12;
	}

	h1 {
	    font-size: 36px;
	    color: white;
	    margin-top: 20px;
	}

	p {
	    font-size: 18px;
	    color: #777;
	    margin-top: 10px;
	}
</style>
<!-- bootstrap lib -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
</head>
<body>


	<%
		String root = request.getContextPath();
	%>

	<div class="container">
		<img class="" src="<%= root %>/static/img/1.gif" alt="" width="256" height="256">
		<h1 class="">500에러</h1>
		<div class="">
			<p class="lead mb-4">서버에서 에러가 발생했습니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<button type="button" class="btn btn-primary btn-lg px-4 gap-3" onclick="location.href='<%=root%>/'">메인화면</button>
			</div>
		</div>
	</div>




</body>
</html>