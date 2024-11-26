<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="product.dao.ProductDAO" %>
<%@ page import="product.dto.ProductDTO" %>

<%
	
	// 파일을 전달받기 위한 작업
	String path = "./resources/images";
	String savedir = request.getServletContext().getRealPath(path);
	int maxSize = 5*1024*1024;
	String encType = "utf-8";
	
	// DAO 인스턴스 생성
	ProductDAO productDAO = new ProductDAO();
	
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
	
	// DTO 생성 및 값 설정
		ProductDTO product = new ProductDTO();
		product.setP_id(productId);
		product.setP_name(name);
		product.setP_price(defaultPrice);
		product.setP_description(description);
		product.setP_fileName(productImage);
		product.setBuycheck(0);
		product.setUserid((String) session.getAttribute("userid"));
	
	
		try {
		    productDAO.updateProduct(product);
		    response.sendRedirect("./updateProduct.jsp");
		} catch (Exception e) {
		    e.printStackTrace();
		    out.println("<p>상품 수정 중 오류가 발생했습니다.</p>");
		}
	
%>