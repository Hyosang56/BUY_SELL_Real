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
<title>Buy & Sell에 오신걸 환영합니다.</title>

</head>

<body>

	<h3>Buy & Sell에 오신걸 환영합니다.</h3>
	<form method="post" action="loginaction.jsp">

		<div class="row align-items-md-stretch   text-center">
			<div class="row justify-content-center align-items-center ">
				<div class="h-100 p-5 col-md-6">
					<h3>로그인 해주세요.</h3>

					<%
					String error = request.getParameter("error");
					if (error != null) {
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요");
						out.println("</div>");
					}
					%>

					<form class="form-signin" action="j_security_check" method="post">

						
						<main class="form-signin">
							<form>                                                             <%--로그인 안내 문구 --%>
								<img class="mb-4" src="docs/cartlogo2" alt=""
									width="72" height="57">
								<h1 class="h3 mb-3 fw-normal">Please Sign in</h1>

								<div class="form-floating">                                     <%-- 아이디 항목 --%>
									<input type="text" class="form-control" id="userid"
										name="userid" placeholder="ID"> 
										<label for="floatingInput">아이디</label>
								</div>
								
								<div class="form-floating">                                     <%--비밀번호 항목 --%>
									<input type="password" class="form-control" id="userpw" 
									name="userpw" placeholder="Password"> 
									<label for="floatingPassword">비밀번호</label>
								</div>

								<div class="checkbox mb-3">                                        <%-- 로그인 기억항목 --%>
									<label> <input type="checkbox" value="remember-me">
										Remember me
									</label>
								</div>
								
								<div class="d-grid gap-2">                                         <%-- 로그인 버튼 --%>
								<button class="btn btn-primary btn-lg" type="submit">로그인</button>
									 
                                                                                                    <%-- 회원가입 --%>
								<button type="button"class="btn btn-outline-secondary btn-lg"      
									onclick="window.location.href='join.jsp'">Join</button>
									</div>
									
								<p class="mt-5 mb-3 text-muted">&copy;All right reserved 2024</p>
							</form>
						</main>

					</form>
				</div>
			</div>
		</div>
</body>
</html>