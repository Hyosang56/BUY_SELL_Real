<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="<%= request.getContextPath() %>loginaction.jsp" method="post">
	아 이 디: <input type="text" name="id">	
	비밀번호 : <input type="password" name="pw">	
	<input type="submit" value="로그인버튼">
</form>

</body>
</html>