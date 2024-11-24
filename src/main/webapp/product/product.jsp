<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!-- DB 연결이 필요한 페이지에 include -->
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>
<style>
	
</style>
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
    
    <div class="content">  <%--Footer 부분 --%>
    <!-- jumbotron -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 정보</h1>
        </div>
    </div>
    
    <%
    String productId = request.getParameter("id");
 // 데이터베이스에 SQL문을 전달하는 PreparedStatement 객체
	PreparedStatement pstmt= null;
	// 데이터베이스로부터 결과값을 전달받는 ResultSet 객체
	ResultSet rs= null;
	
    String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {  // 레코드가 존재하는 경우에만 데이터 출력
    %>
    <div class="container">
    	<div class="row">
    		<!-- 코드 추가 -->
			<div class="col-md-5">
				<img src="../resources/images/<%= rs.getString("p_fileName") %>" style="width: 100%; height: 300px; object-fit: contain;">
			</div>
    		<div class="col-md-6">
    			<h3><%= rs.getString("p_name") %></h3>
    			<p><%= rs.getString("p_description") %></p>
    			<p>
    				<strong>상품 코드 : </strong>
    				<%= rs.getString("p_id") %>
    			</p>
    			<h4><%= rs.getString("p_price") %> 원</h4>
    			<p>
    			<%
				if(userid==null){//로그인이 되어 있지 않다면
				%>
				
            <a href="../login/loginForm.jsp" class="btn btn-info" onclick="alert('구매하려면 로그인해주세요.') ">구매하기 </a>
    		<a href="../login/MAIN.jsp" class="btn btn-secondary">메인 홈페이지 </a>
    		
            <%
				} else{//로그인이 되어있다면
			%>
			
			<a href="./processBuyProduct.jsp?id=<%= productId %>" class="btn btn-info">구매하기 </a>
    		<a href="../login/MAIN.jsp" class="btn btn-secondary">메인 홈페이지 </a>
			
			<%
				}
			%>
    			</p>
    		</div>
    	</div>
    	<hr>
    </div>
    <%
    } else {  // 레코드가 없는 경우 메시지 출력
%>
    <div class="container">
        <p>해당 상품 정보를 찾을 수 없습니다.</p>
    </div>
    <%
		}
		
		if (rs != null) { rs.close(); }
		if (pstmt != null) { pstmt.close(); }
		if (conn != null) { conn.close(); }
	%>
	
    </div>	
		<jsp:include page="/login/footer.jsp" />       <%--Footer 부분 --%>
</body>
</html>