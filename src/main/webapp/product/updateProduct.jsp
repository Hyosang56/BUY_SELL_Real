<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="product.dao.ProductDAO" %>
<%@ page import="product.dto.ProductDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<style>
	h1 { text-align: center; }
        #AD {
            text-align: center; /* 콘텐츠 가운데 정렬 */
        }

        #AD .ad-img {
            max-width: 55%; /* 이미지 크기 조정 */
            height: auto; /* 비율 유지 */
            display: inline-block; /* 이미지 가운데 정렬 */
            
        }
        /* 상품 카드 스타일 */
		.product-card {
		    width: 240px; /* 카드의 가로 너비 */
		    padding: 16px; /* 내부 여백 */
		    border: 2px solid #000; /* 검은색 테두리 */
		    border-radius: 12px; /* 둥근 모서리 */
		    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
		    background-color: #fff; /* 흰색 배경 */
		    text-align: center; /* 내용 가운데 정렬 */
		    display: flex; /* 플렉스 레이아웃 */
		    flex-direction: column; /* 세로 방향으로 정렬 */
		    align-items: center; /* 수평 중앙 정렬 */
		}
		.product-img {
		    width: 200px; /* 고정 가로 크기 */
		    height: 200px; /* 고정 세로 크기 */
		    object-fit: cover; /* 비율 유지하며, 잘리는 부분이 생길 수 있음 */
		    border-radius: 10px; /* 둥근 모서리 */
		    margin-bottom: 12px; /* 이미지와 텍스트 간 간격 */
		    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
		    cursor: pointer; /* 마우스를 올렸을 때 클릭 가능하다는 표시 */
		}
        /* 상품 이미지 hover 효과 */
        .product-img:hover {
            transform: scale(1.13); /* 확대 효과 */
            transition: transform 0.3s ease-in-out; /* 부드러운 전환 효과 */
        }
        .product-img-gray {
        	width: 200px; /* 고정 가로 크기 */
		    height: 200px; /* 고정 세로 크기 */
		    object-fit: cover; /* 비율 유지하며, 잘리는 부분이 생길 수 있음 */
		    border-radius: 10px; /* 둥근 모서리 */
		    margin-bottom: 12px; /* 이미지와 텍스트 간 간격 */
		    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
		    cursor: pointer; /* 마우스를 올렸을 때 클릭 가능하다는 표시 */    
        	filter: grayscale(100%);
        }

        
        /* 상품을 가로로 정렬하기 위한 컨테이너 */
        .product-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4개씩 한 줄에 배치 */
            gap: 20px; /* 카드 간격 */
            justify-items: center; /* 카드 중앙 정렬 */
            margin-top: 20px;
        }
        
		        hr {
		    margin: 20px 0; /* 위, 아래 20px 간격 추가 */
		    border: 1px solid #ccc; /* 경계선 두께와 색상 */
		}
		 .font-main{
			font-size: 20px; 
			font-weight: 600; 
			line-height: 1.4;
			
		}
		.font-price{
			font-size: 16px;
    		font-weight: 600;
		}
</style>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>

<body>
	<!-- menu -->
    <jsp:include page="/login/Topbar_login.jsp" />
    
    <div class="content">        <%--Footer 부분 --%>
	<h1> 판매중인 상품</h1>
	<div class="container">
    	<div class="row" align="center">
    	<div class="product-container">

 	<%
	 	String userid=null;
		if(session.getAttribute("userid")!=null){
			userid=(String)session.getAttribute("userid");
		}
	 	ProductDAO productDAO = new ProductDAO();
	    List<ProductDTO> products = null;
	    try {
	        products = productDAO.findSellUserid(userid);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        out.println("<p>상품 데이터를 가져오는 중 오류가 발생했습니다.</p>");
	    }
	    if (products != null) {
	        for (ProductDTO product : products) {
 	%>		
 			<div class="product-card">
    		<%  if(product.getBuycheck() == 0){  %>
    		<a href="./editProduct.jsp?id=<%= product.getP_id() %>">
    		<img src="../resources/images/<%= product.getP_fileName() %>" class="product-img">
    		</a>
    			<p class="font-main"><%= product.getP_name() %></p>
    			<p class="font-price"><%= product.getP_price() %>원</p>
    		<% } else {  %>
    			<a href="javascript:void(0)" onclick="alert('이미 판매된 상품입니다.');" role="button">
    			<img src="../resources/images/<%= product.getP_fileName() %>" class="product-img-gray">
    			</a>
    			<p class="font-main" style="text-decoration: line-through;"><%= product.getP_name() %></p>
    			<p class="font-price" style="text-decoration: line-through;"><%= product.getP_price() %>원</p>
    			
		          <%
    				}
		          %>
    		</div>
 	
    		<%
    			}
	    	}
    		%>
    		
    	</div>
    	</div>
    	</div>
    	<hr>
    </div>
    <h1> 구매한 상품</h1>
    	<div class="container">
    	<div class="row" align="center">
    	<div class="product-container">
     	<%
 
     	products = null;
	    try {
	    	products = productDAO.findBuyUserid(userid);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        out.println("<p>상품 데이터를 가져오는 중 오류가 발생했습니다.</p>");
	    }
	    if (products != null) {
	        for (ProductDTO product : products) {
 	%>
 	<div class="product-card">
    		<a href="javascript:void(0)" onclick="alert('이미 구매한 상품입니다.');" role="button">
    			<img src="../resources/images/<%= product.getP_fileName() %>" class="product-img-gray">
    			</a>
    			<p class="font-main" style="text-decoration: line-through;"><%= product.getP_name() %></p>
    			<p class="font-price" style="text-decoration: line-through;"><%= product.getP_price() %>원</p>

    		</div>
    		<%
    			}
	    	}
    		%>
    		
    	</div>

    </div>
	   <hr>
	</div>	
		<jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>
</body>
</html>