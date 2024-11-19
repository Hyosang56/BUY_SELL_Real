<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Action</title>
</head>
<body>

	<%
	String userID = request.getParameter("userid");
	String userPW = request.getParameter("userpw");

	String dbURL = "jdbc:mysql://localhost:3306/buynselldb"; // 데이터베이스 URL 수정 필요
	String dbUser = "dbmgrid"; // 데이터베이스 사용자명 수정 필요
	String dbPassword = "dbmgrpw"; // 데이터베이스 비밀번호 수정 필요

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

		String sql = "SELECT * FROM userdb WHERE userid=? AND userpw=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, userPW);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			Cookie userid = new Cookie("userid",userID);
			Cookie userpw = new Cookie("userpw",userID);
			response.addCookie(userid);
			response.addCookie(userpw);
			response.sendRedirect("loginpass.jsp");
		} else {
			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
			response.sendRedirect("loginForm.jsp");	
		}
	} 
	
	
	
	
	catch (Exception e) {                 //닫아줘야한다 안그러면 사이트가 뻗음  
		e.printStackTrace();
	} finally {
		if (rs != null) {
			try {
		rs.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
		pstmt.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
		conn.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
		}
	}
	%>

</body>
</html>