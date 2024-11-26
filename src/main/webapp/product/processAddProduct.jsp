<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="product.dao.ProductDAO" %>
<%@ page import="product.dto.ProductDTO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Random" %>

<%
	request.setCharacterEncoding("UTF-8");

		// 이미지 저장 경로 설정
	String path = "./resources/images";
	String savedir = request.getServletContext().getRealPath(path);
	int maxSize = 5 * 1024 * 1024; // 5MB 제한
	String encType = "UTF-8";
	
	// MultipartRequest 객체 생성
	MultipartRequest multi = new MultipartRequest(request, savedir, maxSize, encType, new DefaultFileRenamePolicy());
	
	// DAO 인스턴스 생성
	ProductDAO productDAO = new ProductDAO();
	
	// 랜덤 ID 생성 및 중복 체크
	String productId;
	Random random = new Random();
	try {
			do {
		    StringBuilder sb = new StringBuilder();
		    for (int i = 0; i < 6; i++) {
		        int n = random.nextInt(36);
		        if (n > 25) sb.append(n - 25);
		        else sb.append((char) (n + 65));
	    	}
	    	productId = sb.toString();
		} while (productDAO.isProductIdDuplicate(productId));
	} catch (SQLException e) {
        e.printStackTrace();
        out.println("<p>상품 ID 생성 중 오류가 발생했습니다.</p>");
        return; // ID 생성 실패 시 처리 중단
    }
	// 폼 데이터 수집
	String name = multi.getParameter("name");
	String priceStr = multi.getParameter("price");
	String description = multi.getParameter("description");
	String productImage = multi.getFilesystemName("productImage"); // 업로드된 파일명 가져오기
	
	// Price 값 변환
	int price = (priceStr == null || priceStr.isEmpty()) ? 0 : Integer.parseInt(priceStr);
	
	// DTO 생성 및 값 설정
	ProductDTO product = new ProductDTO();
	product.setP_id(productId);
	product.setP_name(name);
	product.setP_price(price);
	product.setP_description(description);
	product.setP_fileName(productImage);
	product.setBuycheck(0);
	product.setUserid((String) session.getAttribute("userid"));
	
	// DAO를 사용해 DB에 등록
	try {
	    productDAO.insertProduct(product);
	    response.sendRedirect("../login/MAIN.jsp");
	} catch (Exception e) {
	    e.printStackTrace();
	    out.println("<p>상품 등록 중 오류가 발생했습니다.</p>");
	}
%>

