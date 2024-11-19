<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join</title>
</head>
<body>

	<h1>Join</h1>

	<div class="row align-items-md-stretch   text-center">
		<div class="row justify-content-center align-items-center ">
			<div class="h-100 p-5 col-md-6">
				<h3>회원가입 해주세요.</h3>


					<form method="post" action="joinaction.jsp">
					<main class="form-join">
						
						<div class="form-floating">
						    <input type="text" class="form-control" id="userid" name="userid" placeholder="ID" required> 
							<label for="floatingInput">아이디</label>
							</div>
							
						<br> 
							
							<div class="form-floating">
							<input type="password" class="form-control" id="userpw" name="userpw" placeholder="password" required>
							<label for="floatingPassword">비밀번호</label>
							</div>
						
						<br>
							
							<div class="form-floating">
							<input type="email" class="form-control" id="useremail" name="useremail" placeholder="name@example.com" required> 
							<label for="floatingInput">이메일 주소</label>
							</div>
							
						<br> 				
							
							<div class="form-check">
                            <input type="radio" class="form-check-input" id="usergender" name="usergender" value="man">
                            <label class="form-check-label" for="flexRadioDefault1"> 남자 </label>
                            </div>
                            
                            <div class="form-check">
                            <input type="radio" class="form-check-input" id="usergender" name="usergender" value="woman">
                            <label class="form-check-label" for="flexRadioDefault1"> 여자 </label>
                            </div>
							
						<br>
							
							<div class="form-floating">
							<input type="text" class="form-control" id="username" name="username" required> 
							<label for="floatingInput">이름</label> 
							</div>
							
							<br>
							
							<div class="d-grid gap-2">
							<button class="btn btn-outline-dark btn-lg" type="submit" value="Join">회원가입</button>
					</form>
</body>
</html>