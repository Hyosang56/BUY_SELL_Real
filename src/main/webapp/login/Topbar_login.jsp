<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top Navigation Bar_login</title>

<%-- Bootstrap 가져오기 --%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<%-- Bootstrap 가져오기 --%>


</head>
<body>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark"
		aria-label="Fourth navbar example">
		<div class="container-md">
		<div class="imgform">
			<a class="navbar-brand" href="../login/MAIN.jsp">              <%--우측상단 이미지 --%>
			 <img src="../docs/pic/Fulllogoedit.png" alt="buynselllogo" width="236" height="43">
			</a>
			
			</div>


			<div class="collapse navbar-collapse" id="navbarsExample04">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="###">내 상점</a></li>
						</ul>
				</div>
				
				
				<div class="col-4 d-flex justify-content-end align-items-center">
				<input class="form-control" type="search" placeholder="Search" aria-label="Search">
				</div>
				
				
				<li class="sell-item">
				<a class="btn btn-warning btn-lg fw-bold" href="../product/addProduct.jsp">판매하기</a>
				</li>
				
				<li class="login-item">
				<div class="btn-group " role="login group" aria-label="login label">
                <button type="button" class="btn btn-outline-light" onclick="window.location.href='../userupdate/updateForm.jsp'">마이페이지</button>
                <button type="button" class="btn btn-outline-light" onclick="window.location.href='../login/logoutaction.jsp'">로그아웃</button>
                </div>
                </li>
                
		</div>
		
	</nav>
</body>

</html>




