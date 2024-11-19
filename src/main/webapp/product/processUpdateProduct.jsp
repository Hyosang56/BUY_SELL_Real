<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%

	// 파일을 전달받기 위한 작업
	String path = "./resources/images";
	String savedir = request.getServletContext().getRealPath(path);
	int maxSize = 5*1024*1024;
	String encType = "utf-8";
	
	// 전달값 접근을 위한 MultipartRequest 객체 생성
	MultipartRequest multi = new MultipartRequest(request, savedir, maxSize, encType, new DefaultFileRenamePolicy());

	// 전달받은 파라미터 담기
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String price = multi.getParameter("price");
	String description = multi.getParameter("description");
	
	// Product 객체에 set하기 위해 일부 값은 형변환 필요
	Integer defaultPrice;
	
	if(price.isEmpty()) {
		defaultPrice = 0;
	} else {
		defaultPrice = Integer.valueOf(price);
	}
	
	
	// 이미지 파일 이름 가져오기
	String productImage = multi.getFilesystemName("productImage");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
    // DB에서 수정할 상품 찾아 가져오기
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		// 업로드한 파일이 있으면
		if (productImage != null) {
        	// p_id가 ~인 레코드의 내용 수정
			sql = "UPDATE product SET p_name=?, p_price=?, p_description=?, p_fileName=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, defaultPrice);
			pstmt.setString(3, description);
			pstmt.setString(4, productImage);
			pstmt.setString(5, productId);
			pstmt.executeUpdate();
		}
		// 업로드한 파일이 없으면
		else {
			sql = "UPDATE product SET p_name=?, p_price=?, p_description=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, defaultPrice);
			pstmt.setString(3, description);
			pstmt.setString(4, productId);
			pstmt.executeUpdate();
		}
		
		// SQL 실행
        pstmt.executeUpdate();
	}
	
	if (rs != null) { rs.close(); }
	if (pstmt != null) { pstmt.close(); }
	if (conn != null) { conn.close(); }
	
	// 상품 수정 페이지로 이동
	response.sendRedirect("editProduct.jsp?edit=update");
%>