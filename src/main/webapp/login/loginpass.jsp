<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공 패이지</title>
</head>
<body>

<%
	String userid = null;
	Cookie[] cs = request.getCookies();
	
	
	for(Cookie c : cs){
		if(c.getName().equals("userid")){
			userid = c.getValue();
		}
	}
	if(userid == null){//로그아웃후에 main페이지로 주소값을 입력해도 접속되지않게 방지 (로그인페이지호출)
		response.sendRedirect("loginForm.jsp");
	}
%>
<%=userid %> 님 반갑습니다.
<a href="logoutaction.jsp">로그아웃</a>


</body>
</html>