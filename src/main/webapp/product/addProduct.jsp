<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<%-- Bootstrap 가져오기 --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
	
</script>
<%-- CSS 가져오기 --%>
<link href="DesignCSS/add.css?v=<%=System.currentTimeMillis()%>"
	rel="stylesheet">
<!-- 폰트설정 링크 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">
</head>

<body>
	<!-- menu -->
	<jsp:include page="/login/Topbar_login.jsp" />

	<div class="content">
		<%--Footer 부분 --%>
		<div class="text-center">
			<div class="contentmain">
				<main class="form-add-out">
					<h3>상품 등록해주세요.</h3>
					<form class="form-add-in" name="newProduct"
						action="./processAddProduct.jsp" method="post"
						enctype="multipart/form-data">
						<div class="form-floating">
							<input type="text" class="form-control" name="name" size="30"
								placeholder="name" maxlength="15" required> <label
								for="floatingInput">상품 이름(글자수 15자 제한)</label>
						</div>
						<div class="form-floating">
							<input type="number" class="form-control" name="price" size="30"
								placeholder="price" required> <label for="floatingInput">상품
								가격(숫자만 입력)</label>
						</div>
						<div class="form-floating">
							<textarea name="description" cols="50" rows="2"
								class="form-control" maxlength="238" placeholder="description"></textarea>
							<label for="floatingInput">상품에대해 설명해주세요.(글자수 250자 제한)</label>
						</div>
						<div class="form-floating">
							<input type="file" class="form-control" name="productImage"
								size="30" required>
						</div>
						<div class="d-grid gap-2">
							<button class="btn btn-outline-dark btn-lg" type="submit"
								value="등록">등록</button>
						</div>
					</form>
				</main>
			</div>
		</div>
	</div>
	<jsp:include page="/login/footer.jsp" />
	<%--Footer 부분 --%>
</body>
</html>