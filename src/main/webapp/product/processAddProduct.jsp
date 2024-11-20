<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%!
//6자리 랜덤 난수 생성(영어+숫자) 함수
public static String randomid(){
	StringBuilder sb = new StringBuilder();
	Random random = new Random();
    
    for(int i=0; i<6; i++) {
        int n = random.nextInt(36);
        if(n>25) {
        	sb.append(n-25);
        }
        else {
        	sb.append((char)(n+65));
        }
   	}
    
	return sb.toString(); 
}
%>

    <%
		String userid=null;
		if(session.getAttribute("userid")!=null){
			userid=(String)session.getAttribute("userid");
		}
	%>

<%
	
	// 전달받은 파라미터 인코딩 방식 설정
	request.setCharacterEncoding("UTF-8");
	
	//파일을 전달받기 위한 작업
	// 이미지 경로 지정
	String path= "./resources/images";
	String savedir= request.getServletContext().getRealPath(path);
	// 최대 파일 크기, 인코딩 유형
	int maxSize = 5*1024*1024;
	String encType = "UTF-8";
	// getServletContext() : 서버가 실행되고 있는 경로 얻기
	
	// 전달값 접근을 위한 MultipartRequest 객체 생성
	MultipartRequest multi = new MultipartRequest(request, savedir, maxSize, encType);
	// new DefaultFileRenamePolicy()을 파라미터로 추가하면 덮어쓰지 않음
	
	
		
      //랜덤 난수값 중복 체크
 		PreparedStatement pstmt= null;
 		// 데이터베이스로부터 결과값을 전달받는 ResultSet 객체
 		ResultSet rs= null;
 		boolean run = true;
 		String testid = null;
 		
 		
 		while(run){
 		//6자리 랜덤 난수 생성(영어+숫자) 
 			testid = randomid();

 			
 		// 데이터베이스에서 중복 검사
 			String sql = "SELECT COUNT(*) FROM product WHERE p_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, testid);
            rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                // 중복이 없으면 while 루프 종료
                run = false;
            }
         // 리소스 정리
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
 		}
 	   		
 		
   			
       
   	//랜덤 난수값 제품id로 등록
    String productId = testid;
        
	// 전달받은 파라미터 담기
	String name = multi.getParameter("name");
	String price = multi.getParameter("price");
	String description = multi.getParameter("description");
	String productImage = multi.getFilesystemName("productImage");
	
	// Product 객체에 set하기 위해 일부 값은 형변환 필요
	Integer defaultPrice;
	
	if(price.isEmpty()) {
		// 가격 입력값이 null 이거나 비어있으면 0으로 설정
		defaultPrice = 0;
	} else {
		// 가격 입력값(String)을 Integer 타입으로 변환
		defaultPrice = Integer.valueOf(price);
	}
	
	

	
	// SQL 사용해 DB에 상품 등록하기
	String insertsql= "INSERT INTO product(p_id, p_name, p_price, p_description, p_fileName, buycheck, userid) values(?,?,?,?,?,?,?)";
	pstmt= conn.prepareStatement(insertsql);
	
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, defaultPrice);
	pstmt.setString(4, description);
	pstmt.setString(5, productImage);
	pstmt.setInt(6, 0);
	pstmt.setString(7, userid);
	
	// SQL 실행
	pstmt.executeUpdate();
	
	// PreparedStatement 닫기
    if (pstmt != null) pstmt.close();
		
	// 상품 목록 페이지로 이동
	response.sendRedirect("products.jsp");
%>