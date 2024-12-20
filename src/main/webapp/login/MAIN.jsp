<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.List, java.text.DecimalFormat" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="product.dao.ProductDAO" %>
<%@ page import="product.dto.ProductDTO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈페이지</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<!-- CSS파일 -->
<link href="Design CSS/main.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">
<!-- 폰트설정 링크 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">
</head>

<body>

	<%
		String userid=null;
		if(session.getAttribute("userid")!=null){
			userid=(String)session.getAttribute("userid");
		}
	%>
	
	<% if(userid==null){//로그인이 되어 있지 않다면 %>
		<jsp:include page="/login/Topbar.jsp" />
    <% } else{//로그인이 되어있다면 %>
		<jsp:include page="/login/Topbar_login.jsp" />
	<% } %>
			
	<div id="AD">
    	<img src="../image/ad2.png" alt="광고배너" class="ad-img" >
 	</div>
    
	<div class="content">  <%--Footer 부분 --%>
		<div class="container" style="margin-top:50px;">
    		<div class="row" align="center">
    			<div class="product-container">
	    		<% 
	                ProductDAO productDAO = new ProductDAO();
	                List<ProductDTO> products = null;
	                try {
	                    products = productDAO.getAllProducts();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    out.println("<p>상품 데이터를 가져오는 중 오류가 발생했습니다.</p>");
	                }
	                
	                DecimalFormat formatter = new DecimalFormat("#,###");
	                
	                if (products != null) {
	                    for (ProductDTO product : products) {
                %>
             	<div class="product-card">
    				<div class="image-wrapper">
    					<% if(product.getBuycheck() == 0){  %>
    						<a href="../product/product.jsp?id=<%= product.getP_id() %>">
    							<img src="../resources/images/<%= product.getP_fileName() %>" class="product-img">
    						</a>
    						<p class="font-main"><%= product.getP_name() %></p>
    						<p class="font-price"><%= formatter.format(product.getP_price()) %>원</p>
    					<% } else{ %>
			   				<div class="text-outline">
			    				<p class="text-image">판매 완료</p>
			    			</div>
			    			<a href="javascript:void(0)" onclick="alert('이미 판매된 상품입니다.');" role="button">
			    				<img src="../resources/images/<%= product.getP_fileName() %>" class="product-img-gray">
			    			</a>
			    			<p class="font-main" ><%= product.getP_name() %></p>
			    			<p class="font-price"><%= formatter.format(product.getP_price()) %>원</p>
		         		 <% } %>
    				</div>
    			</div>
			    		<%
			    				}
			                }
			    		%>
    			</div>
    		</div>
    </div>
 </div>	
		<jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>

</body>
</html>