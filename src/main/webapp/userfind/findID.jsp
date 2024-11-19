<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
    
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

<meta charset="UTF-8">
<title>아이디 찾기</title>

<link href="../login/Design CSS/findID.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">        <%-- 스타일을 위한 css 시트 --%>

<script type="text/javascript" src="../resources/js/findinfo.js?v=<%=System.currentTimeMillis() %>"> <%-- 서버연동 정보확인 자바스크립트 --%>
</script>

</head>

<body>

<jsp:include page="/login/Topbar.jsp" />

<div class="text-center">
<div class="contentmain">

<main class="form-findID-out">

	<form class="form-findID-in" name="idfindscreen" method = "POST">
	<h1 class="h3 mb-3 fw-normal">휴대폰 본인확인</h1>
		<section class = "form-search">
		
		
			<div class = "input-group input-group-lg">
				<span class="input-group-text" id="inputGroup-sizing-lg">이름</span>
				<input type="text" class="form-control" name="username" 
				aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder = "등록한 이름">
			<br>
			</div>
			
			<div class = "input-group input-group-lg">
				<span class="input-group-text" id="inputGroup-sizing-lg">휴대폰 번호</span>
				<input type="text" class="form-control" name="userphone" 
				aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder = "휴대폰번호를 '-'없이 입력">
			</div>
			<br>
			
	</section>
	<div class ="btnSearch">
		<input type="button" class="btn btn-outline-danger btn-lg" name="cancle" value="취소" onClick="history.back()">
		<input type="button" class="btn btn-outline-success btn-lg" name="enter" value="찾기" onClick="id_search()">
 	</div>
 </form>
 
 </main>
 </div>
</div>


</body>
</html> 