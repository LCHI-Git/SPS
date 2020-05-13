  
/**
 * Join Member Check
 * Test용 JavaScript 파일입니다
 * 추후 삭제해주세요.
 */


// id 체크 정규식 대, 소문자 포함 숫자 8~16자리
function regCheck1(){
	var id = document.getElementById("id").value;
	var regType1 = /^[A-Za-z0-9+]{8,16}$/;
	var idSpan = document.getElementById("errorId");
	
//	정규식과 value 비교
	if(!regType1.test(id)){
//		스판 text 추가
		idSpan.innerHTML = "영문숫자 조합 8~16자 사이로 입력해주세요!";
		idSpan.setAttribute('style', 'color: red;');
	}
	else{
//		스판 text 추가
		idSpan.setAttribute('style', 'color: green;');
		idSpan.innerHTML = "Check!";
	}
	
}





// 비밀번호 정규식 비교 위와 동일
function regCheck2() {
	var regType2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,18}$/;
	let pw = document.getElementById("password").value;
	var pwSpan = document.getElementById("errorPw");
	
	if(!regType2.test(pw)){
		pwSpan.innerHTML = "영문(대,소문자) 숫자, 특수문자 조합 10~18자 사이로 입력해주세요!";
		pwSpan.setAttribute('style', 'color: red;');
	}
	else{
		pwSpan.innerHTML = "Check!";
		pwSpan.setAttribute('style', 'color: green;');	}
}







// 핸드폰번호 정규식 비교 그냥 숫자만으로 11 개면 통과 위와 동일
function regCheck3() {
	var regType3 = /^[0-9]{11}$/;
	var phoneNumber = document.getElementById("phone_number").value;
	var phoneNumberSpan = document.getElementById("errorPhoneNumber");
	
	if(!regType3.test(phoneNumber)){
		phoneNumberSpan.innerHTML = "- 없는 전화번호만 입력해주세요!";
		phoneNumberSpan.setAttribute('style', 'color: red;');

	}else{
		phoneNumberSpan.innerHTML = "Check!";
		phoneNumberSpan.setAttribute('style', 'color: green;');	
	}
}





// 날자 정규식 비교 0000-00-00 표현, 위와동일
function regCheck4() {
	var regType4 = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
	var birthDay = document.getElementById("birth_day").value;
	var errorBD = document.getElementById("errorBD");
	
	if(!regType4.test(birthDay)){
		errorBD.innerHTML = "정확한 생년월일을 입력하세요!";
		errorBD.setAttribute('style', 'color: red;');
	}
	else{
		errorBD.innerHTML = "Check!";
		errorBD.setAttribute('style', 'color: green;');	
	}
}




// 비밀번호 재입력 비교 엘리먼트 벨류 가져와서 비교, 위와동일
function rePwCheck() {
	var pw = document.getElementById("password").value;
	var rePw = document.getElementById("password_re").value;
	var rePwSpan = document.getElementById("errorRePw");
	if(pw!=rePw){
		rePwSpan.innerHTML = "비밀번호가 일치하지 않습니다!";
		rePwSpan.setAttribute('style', 'color: red;');
	}
	else{
		rePwSpan.innerHTML = "Check!";
		rePwSpan.setAttribute('style', 'color: green;');
	}
}





// 실명인증 api 미인증으로 그냥 이름체크 추후 행정안전부 인증 받아 추가 적으로 구현 가능
function nameCheck() {
	var nameSpan = document.getElementById("checkName");
	nameSpan.innerHTML = "추후 원할한 주문을 위해 실명을 등록해주시길 바랍니다."
}





// SampleController - sendCode 에서 발급받은 code값의 일치,불일치 처리, 위와동일
function checkCode() {
	var code = document.getElementById("code").value;
	var inputCode = document.getElementById("inputCode").value;
	var codeSpan = document.getElementById("errorCode");
	if(code==inputCode && inputCode != ""){
		alert("일치");
		codeSpan.innerHTML = "Check!";
		codeSpan.setAttribute('style', 'color: green;');
	}else if(inputCode==""){
		alert("인증번호 입력해주세요");
		codeSpan.innerHTML = "인증번호 입력해주세요!";
		codeSpan.setAttribute('style', 'color: red;');
	}else{
		alert("불일치");
		codeSpan.innerHTML = "인증번호가 일치하지 않습니다!";
		codeSpan.setAttribute('style', 'color: red;');
	}
}





// form 의 action값 조작으로 sendCode 동작시킴 SampleController - sendCode 동작
function sendCode() {
	regCheck3();
	var phoneNumber = document.getElementById("phone_number");
	var phoneNumberSpan = document.getElementById("errorPhoneNumber").textContent;

	if(phoneNumber.value==""){
		alert("전화번호를 입력해주세요.");
	}
	
	else if(phoneNumberSpan!="Check!"){
		alert("양식확인.");
	}
	else{
		var form = document.getElementById("join");
		form.setAttribute("action", "sendCode");
		form.submit();
	}
	
}

function joinMember() {
	var inputCode = document.getElementById("inputCode");
	var phoneNumber = document.getElementById("phone_number");
	var errorCode = document.getElementById("errorCode").textContent;
	var s = document.getElementById("sendMessage");
	 alert("인증번호를 확인해주세요");
	
	if(phoneNumber.value == ""){
		
		alert("전화번호 입력!");
	}else if(inputCode.value == ""){
		alert("인증번호 입력!")
	}else if(errorCode =="Check!"){
		alert("결제완료 페이지로 이동")
		var form = document.getElementById("join");
		form.setAttribute("action", "pay3");
		form.submit();
	}else{
		alert("인증번호를 다시입력하세요")
		
		/*	var form = document.getElementById("join");
		form.setAttribute("action", "phonePay");
		form.submit();*/
	}
		
}























