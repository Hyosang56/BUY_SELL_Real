<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
//데이터
String id = request.getParameter("userid");

//DB
MemberDAO memberDAO = new MemberDAO();
boolean exist = memberDAO.isExistId(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 검증</title>

<link href="../login/Design CSS/CheckID.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">          <%-- 스타일을 위한 css 시트 버전--%>

<%-- Bootstrap 가져오기 --%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<%-- Bootstrap 가져오기 --%>

<script type="text/javascript" src="../resources/js/Validation.js?v=<%=System.currentTimeMillis() %>" defer> <%-- 입력값 확인 증명 자바스크립트 --%>
</script>

<script type="text/javascript">
	function CheckIDClose(){                    //아이디 중복 검사 종료시 값 넘기기
		opener.document.joinForm.userid.value = '<%=id%>';
		window.close();
		opener.document.joinForm.userpw.focus();
		
		opener.document.joinForm.idDuplication.value= 'idCheck';
		opener.document.joinForm.dbCheckId.disabled=true; 
		opener.document.joinForm.dbCheckId.style.opacity=0.6;
		opener.document.joinForm.dbCheckId.style.cursor="default";
	}
	
	function validateID() {               //아이디 유효성 검사 
		const id = document.checkIDForm.userid.value.trim();
		const regex = /^[a-zA-Z0-9]{5,12}$/; // 5~12자 영어 및 숫자 조합
		if (id === "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (!regex.test(id)) {
			alert("아이디는 5~12자의 영어 및 숫자 조합만 가능합니다.");
			return false;
		}
		return true;
	}

	
</script>

<%-- 폰트설정 링크 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css">

</head>
<body>

<div class="text-center">
<div class="contentmain">
<main class="form-checkid-out">
	<form name="checkIDForm" method="post" action="CheckID.jsp" onsubmit="return validateID();">
		<%
		if (exist) {
		%>
		
		<%=id%>은 사용중입니다.
		<br>
		
		<input type="text" class="form-control" name="userid" placeholder="바꾸실 아이디" aria-label="default input example"> 
		<input type="submit" class="btn btn-primary" value="중복체크" >
		
		<%
		} 
		
		else {
		%>
		<div>
		<%=id%>는 사용 가능합니다.<br>
		</div>
		<br> 
		<input type="button" class="btn btn-primary" value="사용" onclick="CheckIDClose()"> <%-- 위에 스크립트 실행 --%>
		<%
		}
		%>
	</form>
	</main>
</div>
</div>


</body>
</html>