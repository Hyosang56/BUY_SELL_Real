<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="product.dao.ProductDAO" %>
<%@ page import="product.dto.ProductDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 편집</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<%-- CSS 가져오기 --%>
<link href="DesignCSS/edit.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">
<!-- 폰트설정 링크 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">

</head>

<body>
	<!-- menu -->
 	<jsp:include page="/login/Topbar_login.jsp" />
	
	<%
 	String productId = request.getParameter("id");
 		
	ProductDAO productDAO = new ProductDAO();
    ProductDTO product = null;
    try{
    	product = productDAO.findProduct(productId);
    }catch(SQLException e){
    	e.printStackTrace();
        out.println("<p>상품 데이터를 가져오는 중 오류가 발생했습니다.</p>");
    }
	
	if (product != null) {  // 레코드가 존재하는 경우에만 데이터 출력
 	%>
 	<div class="content">        <%--Footer 부분 --%>
 	<div class="outline">
    		<div class="form-product-out">
 			<div>
 				<img src="../resources/images/<%= product.getP_fileName() %>" class="product-img">
 			</div>
 			<div class="form-textbox">
 				<form name="newProduct" action="./processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
		    		<!-- Hidden field to pass productId -->
    				<input type="hidden" name="productId" value="<%= product.getP_id() %>">
		    		<input type="text" id="name" name="name" class="font-main" maxlength="15" value='<%= product.getP_name() %>'>
		    		<input type="number" id="price" name="price" class="font-price" value='<%= product.getP_price() %>'>
		    		<textarea name="description" maxlength="238" class="form-description"><%= product.getP_description() %></textarea>
		    		<input type="file" name="productImage" class="form-control">
		    		<div class="form-group row" style="margin-top:20px;">
		    			<div class="col-sm-offset-2 col-sm-10">
		    				<input type="submit" class="btn btn-primary" value="수정하기">
		    				<a href="./deleteProduct.jsp?id=<%= product.getP_id() %>" class="btn btn-danger" role="button">삭제하기</a>
		    			</div>
		    		</div>
		    		
 				</form>
 			</div>
 		</div>
 		<hr>
 	</div>
 	<% } %>
	</div>	
		<jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>
</body>
</html>