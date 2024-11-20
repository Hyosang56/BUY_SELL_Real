<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
		String userid=null;
		if(session.getAttribute("userid")!=null){
			userid=(String)session.getAttribute("userid");
		}
%>

<%
PreparedStatement pstmt = null;
ResultSet rs = null;

// DB에서 수정할 상품 찾아 가져오기
String productId = request.getParameter("id");
String sql = "select * from product where p_id = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, productId);
rs = pstmt.executeQuery();

if (rs.next()) {
sql = "UPDATE product SET buy_userid=?, buycheck=? WHERE p_id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, userid);
pstmt.setInt(2, 1);
pstmt.setString(3, productId);
pstmt.executeUpdate();
} else {
	out.println("일치하는 상품이 없습니다.");
}

if (rs != null) { rs.close(); }
if (pstmt != null) { pstmt.close(); }
if (conn != null) { conn.close(); }

// 상품 수정 페이지로 이동
response.sendRedirect("../login/MAIN.jsp");
%>