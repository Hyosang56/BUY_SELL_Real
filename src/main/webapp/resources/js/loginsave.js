//쿠키 저장 함수
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
		+ todayDate.toGMTString() + ";"
}
//쿠키 불러오기 함수
function getCookie(name) {
	var search = name + "=";
	if (document.cookie.length > 0) { // 어떤 쿠키라도 있다면
		offset = document.cookie.indexOf(search);
		if (offset != -1) { // 쿠키 존재 시 
			offset += search.length; // 첫번째 값의 인덱스 셋팅 
			end = document.cookie.indexOf(";", offset); // 마지막 쿠키 값의 인덱스 셋팅
			if (end == -1)
				end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		}
	}
}


function login() {
	if (document.loginForm.autoLogin.checked === true) { //자동로그인 체크시
		//"autoLogin"이라는 키 값에 "Y" 값 셋팅
		setCookie("autoLogin", "Y", 30);
		//"ID"라는 키 값에 form에 입력한 아이디 값 셋팅
		setCookie("ID", document.loginForm.userid.value, 30);
		//"PW"라는 키 값에 form에 입력한 비밀번호 값 셋팅
		setCookie("PW", document.loginForm.userpw.value, 30);
	} else { //자동로그인 체크 해제시
		//쿠키 값 제거
		setCookie("autoLogin", "Y", 0);
		
		
		//아이디 저장 클릭 시 
		if (document.loginForm.saveID.checked === true) { // 아이디 저장을 체크 하였을때
			setCookie("ID", document.loginForm.userid.value, 30);
		} else { // 아이디 저장을 체크 하지 않았을때
			setCookie("ID", document.loginForm.userid.value, 0); //날짜를 0으로 저장하여 쿠키삭제
		}
		//비밀번호 저장 클릭 시
		if (document.loginForm.savePW.checked === true) {
			setCookie("PW", document.loginForm.userpw.value, 30);
		} else {
			setCookie("PW", document.loginForm.userpw.value, 0);
		}
	}
	//로그인 실행
	document.loginForm.method = "post";
	document.loginForm.action = "loginaction.jsp";
	document.loginForm.submit();
}


//화면로드시 쿠키저장값 가져오기
window.onload = function() {
	if (getCookie("ID")) { //id라는 키 값이 있으면
		document.loginForm.userid.value = getCookie("ID"); //form의 name=userId에 값 넣기
		document.loginForm.saveID.checked = true; //체크박스 체크 
	}
	if (getCookie("PW")) {
		document.loginForm.userpw.value = getCookie("PW");
		document.loginForm.savePW.checked = true;
	}
	//autoLogin 값 && id값 && 비밀번호가 쿠키에 저장되어있으면 로그인 함수 실행
	if (getCookie("autoLogin") && getCookie("ID") && getCookie("PW")) {
		document.loginForm.autoLogin.checked = true;
		checkLogin();
	}
}