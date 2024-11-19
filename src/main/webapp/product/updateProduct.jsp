<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<!-- menu -->
    <jsp:include page="menu.jsp" />
    
    <!-- jumbotron -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 수정</h1>
        </div>
    </div>

 	<%
 		String productId = request.getParameter("id");
 		
	 	PreparedStatement pstmt = null;
		ResultSet rs = null;
        
        // 데이터베이스에서 상품 id가 productId인 레코드 찾기
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
        
        // 레코드가 존재하면 다음 내용 실행
		if (rs.next()) {
 	%>
 	<div class="container">
 		<div class="row">
 			<div class="col-md-5">
 				<img src="../resources/images/<%= rs.getString("p_fileName") %>" style="width: 300px; height: 200px; object-fit: contain;">
 			</div>
 			<div class="col-md-7">
 				<form name="newProduct" action="./processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
 					<div class="form-group row">
		    			<label class="col-sm-2">상품 코드</label>
		    			<div class="col-sm-3">
		    				<input type="text" id="productId" name="productId" class="form-control" value='<%= rs.getString("p_id") %>'>
		    			</div>
		    		</div>
		    		<div class="form-group row">
		    			<label class="col-sm-2">상품명</label>
		    			<div class="col-sm-3">
		    				<input type="text" id="name" name="name" class="form-control" value='<%= rs.getString("p_name") %>'>
		    			</div>
		    		</div>
		    		<div class="form-group row">
		    			<label class="col-sm-2">가격</label>
		    			<div class="col-sm-3">
		    				<input type="text" id="price" name="price" class="form-control" value='<%= rs.getInt("p_price") %>'>
		    			</div>
		    		</div>
		    		<div class="form-group row">
		    			<label class="col-sm-2">상세 설명</label>
		    			<div class="col-sm-5">
		    				<textarea name="description" cols="50" rows="2" class="form-control"><%= rs.getString("p_description") %></textarea>
		    			</div>
		    		</div>
		    		<div class="form-group row">
		    			<label class="col-sm-2">이미지</label>
		    			<div class="col-sm-5">
		    				<input type="file" name="productImage" class="form-control">
		    			</div>
		    		</div>
		    		<div class="form-group row">
		    			<div class="col-sm-offset-2 col-sm-10">
		    				<input type="submit" class="btn btn-primary" value="등록">
		    			</div>
		    		</div>
 				</form>
 			</div>
 		</div>
 		<hr>
 	</div>
 	<%
		}
		
		if (rs != null) { rs.close(); }
		if (pstmt != null) { pstmt.close(); }
		if (conn != null) { conn.close(); }
	%>
	
    <!-- footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>