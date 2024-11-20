<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Footer Test</title>

<style>
/* 레이아웃 초기화 */
    html, body {
        margin: 0;
        padding: 0;
        height: 100%; /* 전체 페이지 높이를 100%로 설정 */
        display: flex;
        flex-direction: column; /* 세로 정렬 */
    }
    
    /* 콘텐츠 영역 */
    .content {
        flex: 1; /* 콘텐츠가 남은 공간을 채움 */
        padding: 20px;
        
    }
    

.footer {
	background-color: #262627;
	color: white;
	padding: 10px;
	width: 100%;
	box-sizing: border-box;
	margin-top: 0px;
	margin-bottom: 0px;
	height: 10rem; /* footer 높이 */
}


</style>

</head>
<body>
	

	<!-- Footer 영역 -->
	<footer class="footer" style="padding: 10px 75px;">
		<h2
			style="text-align: left; font-size: 30px; font-weight: bold; margin-bottom: 7px;">&copy;
			Buy&Sell</h2>

		<div
			style="display: flex; justify-content: space-between; text-align: left; margin-bottom: 2px;">
			<p style="text-align: left; margin: 0;">대표번호: 1234 - 5678</p>
		</div>

		<div
			style="display: flex; justify-content: space-between; text-align: left; margin-top: 0;">
			<p style="text-align: left; margin: 0;">메일: buynsell@mail.com</p>
		</div>

		<div
			style="display: flex; justify-content: space-between; text-align: left; margin-top: 3px; margin-bottom: 15px">
			<p style="text-align: left; margin: 0;">
				<a href="#Support"
					style="color: #FFFFFF; font-weight: semi-bold; text-decoration: none;">고객지원</a>
				| <a href="#Quetion"
					style="color: #FFFFFF; font-weight: semi-bold; text-decoration: none;">자주찾는
					질문</a> | <a href="#1:1help"
					style="color: #FFFFFF; font-weight: semi-bold; text-decoration: none;">1:1문의</a>
			</p>
		</div>
	</footer>

</body>
</html>