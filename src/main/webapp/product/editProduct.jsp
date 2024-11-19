<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 편집</title>
<script>
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니다.!!")==true){
			location.href="./deleteProduct.jsp?id="+id;
		} else{return;}
	}
</script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<!-- menu -->
	<jsp:include page="menu.jsp"/>
	
	<!-- jumbotron -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<!-- DB 연결이 필요한 페이지에 include -->
    		<%@ include file="dbconn.jsp" %>
    		<!-- SQL 사용해 DB에서 상품 정보 가져오기 -->
    		<%
    			PreparedStatement pstmt = null;
    			ResultSet rs = null;
    			String sql = "select * from product";
    			pstmt = conn.prepareStatement(sql);
    			rs = pstmt.executeQuery();
    			while (rs.next()) {
    		%>
    		<div class="col-md-4 p-4">
    			<img src="../resources/images/<%= rs.getString("p_fileName") %>"  style="width: 300px; height: 200px; object-fit: contain;">
    			<h3><%= rs.getString("p_name") %></h3>
    			<p><%= rs.getString("p_description") %></p>
    			<p><%= rs.getString("p_price") %>원</p>
    			<!-- 상품 아이디를 id 변수에 담아 파라미터로 전달 -->
    			<p>
    				<%
    					if(edit.equals("update")) {
    				%>
    				<a href="./updateProduct.jsp?id=<%= rs.getString("p_id") %>" class="btn btn-success" role="button">수정 &raquo;</a>
    				<%
    					} else if(edit.equals("delete")) {
    				%>
    				<a href="#" onclick="deleteConfirm('<%= rs.getString("p_id") %>')" class="btn btn-success" role="button">삭제 &raquo;</a>
    				<%
    					}
    				%>
    			</p>
    		</div>
    		<%
    			}
    			
    			if (rs != null) { rs.close(); }
    			if (pstmt != null) { pstmt.close(); }
    			if (conn != null) { conn.close(); }
    		%>
		</div>
		<hr>
	</div>
	 <!-- footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>