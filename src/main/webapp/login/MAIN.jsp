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
    			<p><%= rs.getString("p_price") %>원</p>
    			<!-- 상품 아이디를 id 변수에 담아 파라미터로 전달 -->
    			<%
    			if(rs.getString("buycheck").equals("0")){
    			%>
			    <p><a href="../product/product.jsp?id=<%= rs.getString("p_id") %>"
			          class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
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

</body>
</html>