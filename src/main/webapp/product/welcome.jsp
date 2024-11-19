<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫 페이지</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>
<body>
	<!-- menu -->
	<%@ include file="menu.jsp" %>
	
	<!-- jumbotron -->
<%! String greeting = "Welcome to Web Shopping Mall";
    String tagline = "Welcome to Web Market!";
    %>
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">
        <%= greeting %>
      </h1>
    </div>
  </div>
  
  <!-- main -->
<main role="main">
  <div class="container">
    <div class="text-center">
      <h3>
        <%= tagline %>
      </h3>
    </div>
  </div>
</main>

<!-- footer -->
<%@ include file="footer.jsp" %>

</body>
</html>