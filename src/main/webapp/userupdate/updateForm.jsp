<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.bean.MemberDTO"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>

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

<link href="../login/Design CSS/update.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">        <%-- 스타일을 위한 css 시트 --%>

<script type="text/javascript" src="../resources/js/updateV.js?v=<%=System.currentTimeMillis() %>" defer> <%-- 입력값 확인 증명 자바스크립트 --%>
</script>

</head>
<body>

<jsp:include page="/login/Topbar_login.jsp" />


    <% 
	String userid = null;
	if(session.getAttribute("userid")!=null){
		userid = (String)session.getAttribute("userid");
	}
	
	MemberDTO user = new MemberDAO().getUser(userid);
	
	%>
	
<div class="content">      <%--Footer 부분 --%>
<div class="text-center">
<div class="contentmain">
				
<main class="form-update-out">
			
				<form name="updateForm" class="form-update-in" method="post" action="updateaction.jsp" onsubmit="return checkUpdate();">
					<h2 class="h3 mb-3 fw-normal">내 정보</h2>
					<div class = "form-floating">
						<input type="text" class="form-control" value=<%=user.getuserid()%> name="userid" maxlength="20" readonly>
						<label for="floatingInput">아이디(수정불가)</label>
					</div>
					
					<div class="form-floating">
						<input type="password" class="form-control" value=<%=user.getuserpw()%> name="userpw" maxlength="20">
						<label for="floatingPassword">비밀번호</label>
					</div>
					
					<div class="form-floating">
						<input type="text" class="form-control" value=<%=user.getusername()%> name="username" maxlength="20">
						<label for="floatingInput">사용자 이름</label>
					</div>
					
					
					<div class="form-radio" style="text-align:center;">
						<div class="btn-group" data-toggle="buttons">
						<%
							if(user.getusergender().equals("man")){
						%>
							<label class="btn btn-success active">
						<%
							} 
							else{
						%>
							<label class="btn btn-success">
						<%
							}
						%>		
								<input type="radio" name="usergender" autocomplete="off" value="man" checked >남자
							</label>
						<%
							if(user.getusergender().equals("woman")){
						%>
								<label class="btn btn-success active">
						<%
							} else{
						%>
								<label class="btn btn-success">
						<%
							}
						%>	
								<input type="radio" name="usergender" autocomplete="off" value="woman" >여자
							</label>
						</div>
					</div>
					
					
					<div class="form-floating">
						<input type="email" class="form-control" value=<%=user.getuseremail()%> name="useremail" maxlength="20">
						<label for="floatingInput">이메일</label>
					</div>
					
					<div class="form-floating">
						<input type="text" class="form-control" value=<%=user.getuserdob()%> name="userdob" maxlength="6">
						<label for="floatingInput">생년월일 6자리</label>
					</div>
					
					<div class="form-floating">
						<input type="text" class="form-control" value=<%=user.getuserphone()%> name="userphone" maxlength="11">
						<label for="floatingInput">휴대폰번호('-'를 빼고 작성)</label>
					</div>
					
			<input type="submit" class="btn btn-success form-control" value="수정하기"></form>
					
            <form class="form-userdelete" method="post" action="deleteaction.jsp">
            <input type="submit" class="btn btn-danger pull-right" value="탈퇴하기">
            </form>

					
					</main>
					</div>
					</div>
					</div>

           <jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>

</body>
</html>