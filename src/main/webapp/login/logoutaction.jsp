<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃중</title>
</head>
<body>
<%
		session.invalidate();//현재 이 페이지에 접속한 회원이 세션을 빼앗기도록
	%>
	<script>
	    alert("로그아웃 되었습니다.");
		location.href="MAIN.jsp";
	</script>
</body>
</html>