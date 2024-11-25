<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>	
<%@ page import="member.dao.MemberDAO" %>

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
<title>아이디 찾기 결과</title>

<link href="../login/Design CSS/findIDresult.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">        <%-- 스타일을 위한 css 시트 --%>

<script type="text/javascript" src="../resources/js/findinfo.js?v=<%=System.currentTimeMillis() %>"> <%-- 서버연동 정보확인 자바스크립트 --%>
</script>

<%-- 폰트설정 링크 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">

</head>
<body>

<jsp:include page="/login/Topbar.jsp" />

<%
    request.setCharacterEncoding("UTF-8");
    String user_name = request.getParameter("username");
    String user_phone = request.getParameter("userphone");
     
    MemberDAO dao = new MemberDAO();
    String userid = dao.findId(user_name, user_phone); //아이디를 디비에서 가져옴..실패시 널
 
%>

<div class="content">       <%--Footer 부분 --%>
<div class="text-center">
<div class="contentmain">

<main class="form-findIDresult-out">

  <form class="form-findIDresult-in" name="idsearch" method="post">
      <%
       if (userid != null) {
      %>
      
      <div class = "container">
      	<div class = "found-success">
	      <div class ="found-id" id="IDresult" style="font-weight::bold; font-size:24px">
	      회원님의 아이디는  <%=userid%>  입니다.</div>
	 
	    </div>
	     <div class = "found-login">
 		    <input type="button" class="btn btn-secondary" name="login" id="btnLogin" value="로그인" onClick = "location.href='../login/loginForm.jsp'"/>
       	</div>
       </div>
      <%
  } else {
 %>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" class="btn btn-secondary" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" class="btn btn-secondary" id="btnjoin" value="회원가입" onClick="location.href='../login/joinForm.jsp'"/>
       	</div>
       </div>
       <%
  }
 %> 
      </form>
      
      </main>
      </div>
      </div>
      </div>
      
      <jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>
      
</body>
</html>