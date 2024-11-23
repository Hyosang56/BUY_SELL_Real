<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="../product/dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈페이지</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>
<style>
        #AD {
            text-align: center; /* 콘텐츠 가운데 정렬 */
        }

        #AD .ad-img {
            max-width: 55%; /* 이미지 크기 조정 */
            height: auto; /* 비율 유지 */
            display: inline-block; /* 이미지 가운데 정렬 */
            
        }
        /* 상품 이미지 스타일 */
        .product-img {
            width: 200px; /* 이미지 크기 고정 */
            height: auto; /* 비율 유지 */
            cursor: pointer; /* 마우스를 올렸을 때 클릭 가능하다는 표시 */
            border-radius: 10px; /* 이미지 둥근 모서리 */
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
        }

        /* 상품 이미지 hover 효과 */
        .product-img:hover {
            transform: scale(1.13); /* 확대 효과 */
            transition: transform 0.3s ease-in-out; /* 부드러운 전환 효과 */
        }
        
        /* 상품을 가로로 정렬하기 위한 컨테이너 */
        .product-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4개씩 한 줄에 배치 */
            gap: 20px; /* 카드 간격 */
            justify-items: center; /* 카드 중앙 정렬 */
            margin-top: 20px;
        }
    </style>
<body>

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
			
		 <div id="AD">
       		 <img src="<%= request.getContextPath() %>/image/수정배너2.png" alt="임시배너" class="ad-img">
   		 </div>
    
			<div class="content">  <%--Footer 부분 --%>
			<div class="container">
    	<div class="row" align="center">
    	<!-- SQL 사용해 DB에서 상품 정보 가져오기 -->
    		<%
    		// 데이터베이스에 SQL문을 전달하는 PreparedStatement 객체
    		PreparedStatement pstmt= null;
    		// 데이터베이스로부터 결과값을 전달받는 ResultSet 객체
    		ResultSet rs= null;
    		// SQL문 작성하고 실행하기
    		String sql= "select * from product";
    		pstmt= conn.prepareStatement(sql);
    		rs= pstmt.executeQuery();
    		
    		// 실행한 결과값 rs(product 테이블의 모든 레코드) 하나씩 출력
    		while(rs.next()){
    			
    		%>
    		<div class="col-md-4 p-4">
    		<img src="../resources/images/<%= rs.getString("p_fileName") %>" class="product-img">
    			<h3><%= rs.getString("p_name") %></h3>
    			<p><%= rs.getString("p_price") %>원</p>
    			<!-- 상품 아이디를 id 변수에 담아 파라미터로 전달 -->
    			<%
    			if(rs.getString("buycheck").equals("0")){
    			%>
			    <p><a href="../product/product.jsp?id=<%= rs.getString("p_id") %>"
			          class="btn btn-secondary" role="button">상세 정보</a></p>
			    <%
    			} else if(rs.getString("buycheck").equals("1")){
		          %>
		          	<p><button class="btn btn-secondary" role="button" disabled>판매 완료</button></p>
		          <%
    				}
		          %>
    		</div>
    		<%
    			}
    		%>
    		
    	</div>
    	<hr>
    </div>
    	</div>	
		<jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>

</body>
</html>