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
        <div class="content">  <%--Footer 부분 --%>
   		 <div class="outline">
    		<div class="form-product-out">
			<div >
				<img src="../resources/images/<%= rs.getString("p_fileName") %>" class="product-img">
			</div>
    		<div class="form-textbox">
    			<p class="font-main"><%= rs.getString("p_name") %></p>
    			<p class=font-price><%= rs.getString("p_price") %> 원</p>
    			<p>
    				<strong>상품 코드 : </strong>
    				<%= rs.getString("p_id") %>
    			</p>
				<p class="form-description"><%= rs.getString("p_description") %></p>
				<p>
    			<%
				if(userid==null){//로그인이 되어 있지 않다면
				%>
            <a href="../login/loginForm.jsp" class="btn btn-info" onclick="alert('구매하려면 로그인해주세요.') ">구매하기 </a>
    		<a href="../login/MAIN.jsp" class="btn btn-secondary">메인 홈페이지 </a>
    		
            <%
				} else{//로그인이 되어있다면
					if(userid.equals(rs.getString("userid"))){
			%>
			
			<a class="btn btn-info" onclick="alert('본인이 판매 중인 상품은 구매할 수 없습니다.')" >구매하기 </a>
    		<a href="../login/MAIN.jsp" class="btn btn-secondary">메인 홈페이지 </a>
			
			<%
				}else{
			%>
			<a href="./processBuyProduct.jsp?id=<%= productId %>" class="btn btn-info">구매하기 </a>
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