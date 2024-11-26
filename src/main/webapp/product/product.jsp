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
<title>상품 상세 정보</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<!-- 폰트설정 링크 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">
<%-- CSS 가져오기 --%>
<link href="DesignCSS/product.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">
</head>
<body>
	<!-- menu -->
    <%
		String userid=null;
		if(session.getAttribute("userid")!=null){
			userid=(String)session.getAttribute("userid");
		}
	%>
	
	<%
				if(userid==null){//로그인이 되어 있지 않다면
			%>
			
            <jsp:include page="/login/Topbar.jsp" />


            <%
				} else{//로그인이 되어있다면
			%>
			
			
			<jsp:include page="/login/Topbar_login.jsp" />
			
			<%
				}
			%>
    

    
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
        <div class="content">  <%--Footer 부분 --%>
   		 <div class="outline">
    		<div class="form-product-out">
			<div >
				<img src="../resources/images/<%= product.getP_fileName() %>" class="product-img">
			</div>
    		<div class="form-textbox">
    			<p class="font-main"><%= product.getP_name() %></p>
    			<p class=font-price><%= product.getP_price() %> 원</p>
    			<p>
    				<strong>상품 코드 : </strong>
    				<%= product.getP_id() %>
    			</p>
				<p class="form-description"><%= product.getP_description() %></p>
				<p>
    			<%
				if(userid==null){//로그인이 되어 있지 않다면
				%>
            <a href="../login/loginForm.jsp" class="btn btn-info" onclick="alert('구매하려면 로그인해주세요.') ">구매하기 </a>
    		<a href="../login/MAIN.jsp" class="btn btn-secondary">메인 홈페이지 </a>
    		
            <%
				} else{//로그인이 되어있다면
					if(userid.equals(product.getP_id())){
			%>
			
			<a class="btn btn-info" onclick="alert('본인이 판매 중인 상품은 구매할 수 없습니다.')" >구매하기 </a>
    		<a href="../login/MAIN.jsp" class="btn btn-secondary">메인 홈페이지 </a>
			
			<%
				}else{
			%>
			<a href="./processBuyProduct.jsp?id=<%= product.getP_id() %>" class="btn btn-info">구매하기 </a>
    		<a href="../login/MAIN.jsp" class="btn btn-secondary">메인 홈페이지 </a>
			<%
					}
				}
			%>
			</p>
			</div>
    	</div>
    </div>
    <%
    } else {  // 레코드가 없는 경우 메시지 출력
%>
    <div class="container">
        <p>해당 상품 정보를 찾을 수 없습니다.</p>
    </div>
	<% } %>
    </div>	
		<jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>
</body>
</html>