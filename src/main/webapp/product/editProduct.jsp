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
<!-- 폰트설정 링크 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">

</head>
<style>
		.outline{
		    flex: 1;
    		padding: 20px;
    		margin-top: 30px;
    		margin-bottom: 100px;
		}
			.form-product-out {
		  width: 1024px;
		  height: 500px;
		  padding: 30px 0px;
		  margin: auto;
		  border-top: 3px solid rgba(0, 0, 0, 1); /* 위쪽 밑줄 */
    	  border-bottom: 3px solid rgba(0, 0, 0, 1); /* 아래쪽 밑줄 */
    	  display: flex;

		}
		.product-img {
		    width: 428px; /* 고정 가로 크기 */
		    height: 428px; /* 고정 세로 크기 */
		    object-fit: contain; /* 비율 유지하며, 잘리는 부분 없이 */
		    border-radius: 10px; /* 둥근 모서리 */	    
		    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
		    margin-right: 40px;
    		flex-shrink: 0;
		}
		.form-textbox{
			display: flex;
		    flex-direction: column; /* 텍스트를 세로로 배치 */
		    justify-content: flex-start; /* 텍스트는 위쪽에 밀착 */
		    height: 100%;
		    padding-bottom: 10px; /* 버튼과 텍스트 사이 간격 */
		    margin: 30px 0px;
		}	
		.font-main{
			font-size: 30px; 
			font-weight: 600; 
			line-height: 1.4;
			
		}
		.font-price{
			font-size: 40px;
    		font-weight: 600;
		}
		.form-description{
			width: 500px;
			height: 180px;
			overflow: hidden;        /* 넘치는 내용은 숨김 */
		    text-overflow: ellipsis; /* 잘린 부분에 '...' 표시 */
	 	    word-wrap: break-word;   /* 단어가 너무 길면 줄바꿈 */
 		    line-height: 1.5;        /* 줄 간격 설정 */
		    white-space: pre-line;     /* 텍스트 줄바꿈 허용 */
		    padding: 10px;           /* 내부 여백 */
		    border: 1px solid #ddd;  /* 테두리 (선택 사항) */
		    background-color: #f9f9f9; /* 배경색 (선택 사항) */
		    border-radius: 8px;      /* 모서리 둥글게 (선택 사항) */
		    
						
		}
		body {
	        font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif !important;
	    	}
</style>
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