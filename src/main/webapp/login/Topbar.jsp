<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top Navigation Bar</title>

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

<script>
        function sellbutton() {
            // 알림창 표시
            alert('판매하려면 로그인해주세요.');
            // 특정 URL로 이동
            window.location.href = 'loginForm.jsp'; // 이동할 URL 설정
        }
        
        function auctionbutton() {
            // 알림창 표시
            alert('경매를 시작하려면 로그인해주세요.');
            // 특정 URL로 이동
            window.location.href = 'loginForm.jsp'; // 이동할 URL 설정
        }
        
    </script>

<%-- 폰트설정 링크 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">

<style>
body {
        font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif !important;
       }
</style>

</head>
<body>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container-md">
		<div class="imgform">
			<a class="navbar-brand" href="../login/MAIN.jsp">              <%--우측상단 이미지 --%>
			 <img src="../docs/pic/MainLogo remake-1.png" alt="buynselllogo" width="234px" height="45px">
			</a>
			
			</div>
			


			<div class="collapse navbar-collapse" id="navbarsExample04">
			<%--
				<<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="###">내 상점</a></li>
						</ul>
						--%>
				</div>
				
				
				<div class="col-4 d-flex justify-content-end align-items-center">
				<form action="../product/searchProduct.jsp" method="get" class="d-flex">
				<input class="form-control" type="search" name="search" placeholder="Search" aria-label="Search" style="width: 500px;">
				</form>
				</div>
				
				
				<li class="sell-item">
				<div class="btn-group " role="sell group" aria-label="sell label">
				<button type="button" class="btn btn-light border border-dark btn-lg fw-bold" onclick="sellbutton()">판매</button>
				<button type="button" class="btn btn-light border border-dark btn-lg fw-bold" onclick="auctionbutton()">경매</button>
				</li>
				
				<li class="login-item">
				<div class="btn-group " role="login group" aria-label="login label">
                <button type="button" class="btn btn-outline-light" onclick="window.location.href='../login/loginForm.jsp'">로그인</button>
                <button type="button" class="btn btn-outline-light" onclick="window.location.href='../login/joinForm.jsp'">회원가입</button>
                </div>
                </li>
                
		</div>
		
	</nav>
	
	
</body>
</html>




