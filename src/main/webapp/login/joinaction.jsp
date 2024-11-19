<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Action</title>
</head>
<body>

	<%
	String userID = request.getParameter("userid");
	String userPassword = request.getParameter("userpw");
	String userName = request.getParameter("username");
	String userGender = request.getParameter("usergender");
	String userEmail = request.getParameter("useremail");
	String userdob = request.getParameter("userdob");
	String userphone = request.getParameter("userphone");

	String DBURL = "jdbc:mysql://localhost:3306/buynselldb"; // 데이터베이스 URL 수정 필요
	String DBUser = "dbmgrid"; // 데이터베이스 사용자명 수정 필요
	String DBPassword = "dbmgrpw"; // 데이터베이스 비밀번호 수정 필요

	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(DBURL, DBUser, DBPassword);

		String sql = "INSERT INTO userdb (userid, userpw, username, usergender, useremail, userdob, userphone) VALUES (?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, userPassword);
		pstmt.setString(3, userName);
		pstmt.setString(4, userGender);
		pstmt.setString(5, userEmail);
		pstmt.setString(6, userdob);
		pstmt.setString(7, userphone);
		pstmt.executeUpdate();

		response.sendRedirect("loginForm.jsp");	
	} 
	
	catch (Exception e) {             //SQL 리소스 종료 
		e.printStackTrace();
	} finally {
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