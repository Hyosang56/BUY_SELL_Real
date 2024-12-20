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
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<%-- Bootstrap 가져오기 --%>

<meta charset="UTF-8">
<title>아이디 찾기</title>

<link href="../login/Design CSS/findID.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">        <%-- 스타일을 위한 css 시트 --%>

<script type="text/javascript" src="../resources/js/findinfo.js?v=<%=System.currentTimeMillis() %>"> <%-- 서버연동 정보확인 자바스크립트 --%>
</script>

<%-- 폰트설정 링크 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">

</head>

<body>

<jsp:include page="/login/Topbar.jsp" />

<div class="content"> 
<div class="text-center">
<div class="contentmain">

<main class="form-findID-out">

	<form class="form-findID-in" name="idfindscreen" method = "POST">
	<h1 class="h3 mb-3 fw-normal">휴대폰 본인확인</h1>
		<section class = "form-search">
		
		
			<div class = "input-group input-group-lg">
				<span class="input-group-text" id="inputGroup-sizing-lg">이 &emsp;&emsp;&nbsp;&nbsp;름</span>
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
</div>

<jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>

</body>
</html> 