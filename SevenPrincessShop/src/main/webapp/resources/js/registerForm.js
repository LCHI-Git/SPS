
function checkValue(obj) { // 비밀번호 검사
	var len = obj.password.value.trim().length;
	
	if(form.IdDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	pattern = new RegExp(
			"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,12}$");

	if (!pattern.test(obj.password.value.trim()) && len != 0) {
		alert("비밀번호는 영문자, 숫자, 특수문자(!@#$%^&*)를 각각 1개 이상 포함해야 하고 8자 이상 12자 이하로 입력해야 합니다.");
		obj.password.value = "";
		obj.repassword.value = "";
		obj.password.focus();
		return false;
	}
	return true;
}

function emailSet() {

	let email = $("#e0 > option:selected").val();
	if (email != "직접입력") {
		$("#email2").val(email);
	} else {
		$("#email2").val("");
	}
}

function openIdChk(){
	window.name = "parentForm";
	window.open("IdCheckForm", "chkForm", 
				"width=500, height=300, resizable=no, scrollbars=no");
}