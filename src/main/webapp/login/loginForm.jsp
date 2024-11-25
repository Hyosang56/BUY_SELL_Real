<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<% String errMsg = (String)session.getAttribute("errMsg");
if(errMsg == null) errMsg = ""; %>
<!DOCTYPE html>
<html>
<head>

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
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      

<title>Buy & Sell에 오신걸 환영합니다.</title>

<link href="Design CSS/login.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">        <%-- 스타일을 위한 css 시트 --%>

<script type="text/javascript" src="../resources/js/Validation.js?v=<%=System.currentTimeMillis() %>"> <%-- 입력값 확인 증명 자바스크립트 --%>
</script>

<script type="text/javascript" src="../resources/js/loginsave.js?v=<%=System.currentTimeMillis() %>"> <%-- 입력값 확인 증명 자바스크립트 --%>
</script>

<%-- 폰트설정 링크 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">

</head>

<body>

<jsp:include page="/login/Topbar.jsp" />

<div class="content">        <%--Footer 부분 --%>
<div class="text-center">
<div class="contentmain">
				
<main class="form-login-out">
	<h3>Buy & Sell에 오신걸 환영합니다.</h3>

	<form class="form-login-in" name = "loginForm" method="post" action="loginaction.jsp">   <%-- 로그인 진행페이지 --%>


                                                                                       <%--로그인 안내 문구 --%>
					<img class="mb-4" src="../docs/pic/Fulllogobigedit.png" name="logo" alt="error" width="367" height="300">
					<h1 class="h3 mb-3 fw-normal">지금 로그인하여 지구에 도움주기!</h1>

					<div class="form-floating">                                     <%-- 아이디 항목 --%>
						<input type="id" class="form-control" id="userid" name="userid" placeholder="ID"> 
						<label for="floatingInput">아이디</label>
					</div>
								
					<div class="form-floating">                                     <%--비밀번호 항목 --%>
						<input type="password" class="form-control" id="userpw" name="userpw" placeholder="Password"> 
						<label for="floatingPassword">비밀번호</label>
					</div>

					<div class="checkbox">                                        <%-- 로그인 기억항목 --%>
						<label> <input type=checkbox name="autoLogin"> 자동로그인   </label>
						<label> <input type=checkbox name="saveID"> 아이디 저장   </label>
						<%-- <label> <input type=checkbox name="savePW"> 비밀번호 저장</label> --%>
					</div>
								
					<div type="errMsg" id="errMsg" style="color:red"><%=errMsg%></div>
								
					<div class="d-grid gap-2">                                         <%-- 로그인 버튼 --%>
					<button class="btn btn-primary btn-lg" type="submit" value="로그인" onclick="login()">로그인</button>
									 
                                                                                                    <%-- 회원가입 --%>                                                                                                  
					<button type="button"class="btn btn-outline-secondary btn-lg" name="join"     
					onclick="window.location.href='joinForm.jsp'">Join</button>
					</div>
					
					<div class="FIND">
					<a href="../userfind/findID.jsp">아이디 찾기</a>
					<a href="../userfind/findPW.jsp">비밀번호 찾기</a>
					</div>
									
				<p class="mt-5 mb-3 text-muted">&copy;All right reserved 2024</p>
			</form>
							
							
		</main>
		</div>
		</div>
	</div>	
		<jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>
		
</body>
</html>