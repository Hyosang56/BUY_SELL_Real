<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
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

<body class="text-center">

<main class="form-findID">


	<form class="form-findID" name="idfindscreen" method = "POST">
	<h1 class="h3 mb-3 fw-normal">휴대폰 본인확인</h1>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<br>
				<input type="text" name="username" class = "btn-name" placeholder = "등록한 이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호</label>
				<br>
				<input type="text" name="userphone" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="id_search()">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>


</body>
</html> 