<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.dao.ProductDAO"%>
<%@ page import="product.dto.ProductDTO"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.Random"%>

<%
String userid = null;
if (session.getAttribute("userid") != null) {
	userid = (String) session.getAttribute("userid");
}

// DB에서 수정할 상품 찾아 가져오기
String productId = request.getParameter("id");
ProductDAO productDAO = new ProductDAO();
ProductDTO product = null;
try {
	product = productDAO.findProduct(productId);
} catch (SQLException e) {
	e.printStackTrace();
	out.println("<p>상품 데이터를 가져오는 중 오류가 발생했습니다.</p>");
}

if (product != null) {
	try {
		productDAO.buyProduct(product, userid);
		response.sendRedirect("../login/MAIN.jsp");
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<p>상품 구매 중 오류가 발생했습니다.</p>");
	}

}
%>