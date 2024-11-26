<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="product.dao.ProductDAO" %>
<%@ page import="product.dto.ProductDTO" %>

<%
	String productId = request.getParameter("id");
	ProductDAO productDAO = new ProductDAO();

try {
    productDAO.deleteProduct(productId);
    response.sendRedirect("./updateProduct.jsp");
} catch (Exception e) {
    e.printStackTrace();
    out.println("<p>상품 삭제 중 오류가 발생했습니다.</p>");
}

%>