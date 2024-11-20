<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<style>
	h1 { text-align: center; }
</style>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>

<%
		String userid=null;
		if(session.getAttribute("userid")!=null){
			userid=(String)session.getAttribute("userid");
		}
%>
<body>
	<!-- menu -->
    <jsp:include page="/login/Topbar_login.jsp" />
    
    <div class="content">        <%--Footer 부분 --%>
	<h1> 판매중인 상품</h1>
	<div class="container">
    	<div class="row" align="center">

 	<%
 
	 	PreparedStatement pstmt = null;
		ResultSet rs = null;
        
        // 데이터베이스에서 내가 팔고있는 상품 보기
		String sql = "select * from product where userid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
        
        // 레코드가 존재하면 다음 내용 실행
		while (rs.next()) {
 	%>
    		<div class="col-md-4 p-4">
    		<img src="../resources/images/<%= rs.getString("p_fileName") %>" style="width: 300px; height: 200px; object-fit: contain;">
    			<h3><%= rs.getString("p_name") %></h3>
    			<p><%= rs.getString("p_price") %>원</p>
    			<!-- 상품 아이디를 id 변수에 담아 파라미터로 전달 -->
    			<%
    			if(rs.getString("buycheck").equals("0")){
    			%>
			    <p><a href="./editProduct.jsp?id=<%= rs.getString("p_id") %>"
			          class="btn btn-secondary" role="button">상품 수정 &raquo;</a></p>
			    <%
    			} else if(rs.getString("buycheck").equals("1")){
		          %>
		          	<p><button class="btn btn-secondary" role="button" disabled>판매 완료 &raquo;</button></p>
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
    <h1> 구매한 상품</h1>
    	<div class="container">
    	<div class="row" align="center">
     	<%
 
	 	pstmt = null;
		rs = null;
        
        // 데이터베이스에서 내가 팔고있는 상품 보기
		sql = "select * from product where buy_userid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
        
        // 레코드가 존재하면 다음 내용 실행
		while (rs.next()) {
 	%>
    		<div class="col-md-4 p-4">
    		<img src="../resources/images/<%= rs.getString("p_fileName") %>" style="width: 300px; height: 200px; object-fit: contain;">
    			<h3><%= rs.getString("p_name") %></h3>
    			<p><%= rs.getString("p_price") %>원</p>
		          <p><button class="btn btn-secondary" role="button" disabled>구매 완료 &raquo;</button></p>

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