function checkUpdate(){                                         //회원수정 미입력시 알람 
	
	//var ID = document.updateForm.userid;                       //사용 용이를 위한 변수 지정
	var PW = document.updateForm.userpw;
	var EMAIL = document.updateForm.useremail;
	var NAME = document.updateForm.username;
	var DOB = document.updateForm.userdob;
	var PHONE = document.updateForm.userphone;
	
	//var RegExpID = /^[a-zA-Z0-9]{5,12}$/;  //숫자와 영어만 입력가능 
	var RegExpPW = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;  //8글자이상의 영문, 숫자, 특수문자 입력필수 
	var RegExpEMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	  //이메일 입력 형식 제한
	 var F = false
	 var T = true
	

	
	//////////////////////////////////비밀번호는 8~20글자, 영문, 숫자, 특수문자를 모두 사용해야한다.
	if(PW.value == ""){
		alert("비밀번호를 입력하세요.");
		PW.focus();
		PW.select();
		return F;
	}
		
	else if(!RegExpPW.test(PW.value)){                        //RegExpID 함수에 따라 이메일 형식 검사
		alert("비밀번호는 8~20글자의 영문, 숫자, 특수문자 조합으로 입력해야합니다.");
		PW.select();
		return F;
		}
	
	
	///////////////////////////////이메일은 이메일 @, .의 형식을 지켜야한다.
	else if(EMAIL.value == ""){
		alert("이메일을 입력하세요.");
		EMAIL.focus();
		EMAIL.select();
		return F;
	}
	
    else if(!RegExpEMAIL.test(EMAIL.value)){        //RegExpEMAIL 함수에 따라 이메일 형식 검사
		alert("이메일 입력을 확인해주세요");
		EMAIL.select();
		return F;
	}
	
	///////////////////////////이름은  2글자 이상 20글자 이내이다.
	else if(NAME.value == ""){
		alert("이름을 입력하세요.");
		NAME.focus();
		NAME.select();
		return F;
	}
	
	else if(NAME.value.length < 2 || PW.value.length >20){   //이름 항목 글자 수 제한 
		alert("이름을 2자 이상 20자 이내로로 입력해주세요.");
		NAME.select();                //이름 잘못썻을 시 항목 자동 선택 
		return F;
			}
	
	//////////////////////////생년월일은 숫자로만 6글자로 적어야한다.
	else if(DOB.value == ""){
		alert("생년월일을 입력하세요.");
		DOB.focus();
		DOB.select();
		return F;
		}
		
	else if(DOB.value.length !== 6 || isNaN(DOB.value)){   //생년월일 항목 형식, 숫자 수 제한 
		alert("생년월일을 숫자 6자로 입력해주세요.");
		DOB.select();                //생년월일 잘못썻을 시 항목 자동 선택 
		return F;
		}
		
		////////////////////////휴대폰번호는 숫자로만 11글자로 적어야한다.
	else if(PHONE.value == ""){
		alert("휴대폰번호를 입력하세요.");
		PHONE.focus();
		PHONE.select();
		return F;
		}
		
	else if(PHONE.value.length !== 11  || isNaN(PHONE.value)){   //휴대폰번호 항목 형식, 숫자 수 제한 
		alert("휴대폰번호를 숫자 11자로 입력해주세요.");
		PHONE.select();                //휴대폰번호 잘못썻을 시 항목 자동 선택 
		return F;
		}
		
		/////////////////////////모든 조건 충족시 회원가입

		else{
		alert("회원정보 수정을 완료했습니다.");
		document.updateForm.submit();
		return T;

	}
}

///////////////////////////////////////////////////////////////////