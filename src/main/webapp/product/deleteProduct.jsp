<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	String productId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
 	    // p_id가 ~인 레코드 삭제
		sql = "delete from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.executeUpdate();
	} else {
		out.println("일치하는 상품이 없습니다.");
	}
	
	if (rs != null) { rs.close(); }
	if (pstmt != null) { pstmt.close(); }
	if (conn != null) { conn.close(); }
	
	// 상품 삭제 페이지로 이동
	response.sendRedirect("editProduct.jsp?edit=delete");
%>