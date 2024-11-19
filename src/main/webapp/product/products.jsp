<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<!-- DB 연결이 필요한 페이지에 include -->
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>
<body>
	<!-- menu -->
    <jsp:include page="menu.jsp" />
    
    <!-- jumbotron -->
    <div class="jumbotron">
    	<div class="container">
    		<h1 class="display-3">상품 목록</h1>
    	</div>
    </div>
    
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
    		<img src="../resources/images/<%= rs.getString("p_fileName") %>" style="width: 300px; height: 200px; object-fit: contain;">
    			<h3><%= rs.getString("p_name") %></h3>
    			<p><%= rs.getString("p_description") %></p>
    			<p><%= rs.getString("p_price") %>원</p>
    			<!-- 상품 아이디를 id 변수에 담아 파라미터로 전달 -->
			    <p><a href="./product.jsp?id=<%= rs.getString("p_id") %>"
			          class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
    		</div>
    		<%
    			}
    		%>
    		
    	</div>
    	<hr>
    </div>
    
    <!-- footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>