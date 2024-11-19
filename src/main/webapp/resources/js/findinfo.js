function id_search() {                            //ID 찾는 자바스크립트
	 	var frm = document.idfindscreen;

	 	if (frm.username.value.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (frm.userphone.value.length != 11) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }

	 frm.method = "post";
	 frm.action = "findIDresult.jsp"; //넘어간화면
	 frm.submit();  
	 }
	 
	 
	 
	 function pw_search(){                        //PW 찾는 자바스크립트

	   var frm = document.pwfindscreen;

	   if(frm.userid.value.length<3){
	    alert("아이디를 올바르게 입력해주세요");
	    return;
	   }

	    if (frm.userphone.value.length != 11) {
	 			  alert("핸드폰번호를 정확하게 입력해주세요");
	 			  return;
	 		 }
	 	
	   frm.method="post";
	   frm.action="findPWresult.jsp"; //넘어간화면
	   frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
	   }
	 