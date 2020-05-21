<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.invalid {
	border-color: red;
}
#error {
	color: red
}
#correct{
	color: green
}
</style>

</head>
<body onload="document.loginForm.nickname.focus()">
	<script src="<c:url value="/resources/js/registerForm.js" />"></script>


	<form action="registerCheck" method="post" name="loginForm"
		onsubmit="return checkValue(this)">
		<table align="center" cellpadding="5" cellspacing="0">
			<tr>
				<th colspan="2"><strong>회원가입</strong></th>
			</tr>
			<tr>
				<td><strong>성명</strong></td>
				<td><input type="text" name="client_name" placeholder="이름을 입력하세요" required/>
				</td>
			</tr>
			<tr>
				<td width="150"><strong>아이디</strong></td>
				<td width="350"><input type="text" name="client_id" id="id"
					placeholder="아이디를 입력하세요" required/> 
					<input type="button" value="중복확인" onclick="openIdChk()"/>
					<input type="hidden" name="IdDuplication" value="idUncheck">
				</td>
			</tr>
			<tr>
				<td><strong>비밀번호</strong></td>
				<td><input type="text" name="client_password" placeholder="비밀번호 입력하세요" id="password" required/></td>
			</tr>
			<tr>
				<td><strong>비밀번호 재확인</strong></td>
				<td><input type="text" name="repassword" placeholder="비밀번호 확인" id="repassword" />		
					<div id="error"></div>
					<div id="correct"></div>
				</td>
			</tr>
			<tr>
				<td><strong>생년월일</strong></td>
				<td>
					<%
						Calendar cal = Calendar.getInstance();
						int year = cal.get(Calendar.YEAR); //현재 년도	
						int start = year - 14; // 14세 이상부터 회원가입 할 수 있다고 가정
					%> <select name="years" style="height: 23px">
						<%
							for (int i = start; i >= 1901; i--) {
						%>
						<option value="<%=i%>">
							<%=i%>년
						</option>
						<%
							}
						%>

				</select> 
				<input type="text" name="month" style="width: 50px" required />월 
				<input type="text" name="day" style="width: 50px" required/>일
				</td>
			</tr>
			<tr>
			<td><strong>연락처</strong></td>
			<td>
				<div id="phone">
					<select id="phone1" name="phone1">
						<option	 value="010">010</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="011">011</option>
					</select>
					-
					<input type="text" id="phone2" name="phone2" maxlength="4" style="width:50px" required/>
					-
					<input type="text" id="phone3" name="phone3" maxlength="4" style="width:50px" required/>
					<input type="button" id="phoneBtn" name="phoneBtn" value="인증번호 받기" /><br>
					<input type="text" id="inputConfirm" name="inputConfirm" maxlength="6" placeholder="인증번호 입력하세요" style="width:150px"/>
					<input type="button" id="confirmBtn" name="confirmBtn" value="인증번호 확인" />
				</div>
			</td>
		</tr>
			<tr>
				<td><strong>이메일</strong></td>
				<td><input type="text" name="email1" id="email1" value="${vo.client_email}" required/> @ 
					<input type="text" name="email2" id="email2" value="naver.com" /> 
					<select id="e0" onchange="emailSet()">
						<option id="e1" value="naver.com" selected>naver.com</option>
						<option id="e2" value="google.com">google.com</option>
						<option id="e3" value="daum.net">daum.net</option>
						<option>직접입력</option>
				</select></td>
			</tr>
			<tr>
				<!-- 주소 API -->
				<td><strong>주소</strong></td>
				<td>
					우편번호 : <input type="text" name="client_addressNumber" style="width:80px; height:26px;" />
					<button type="button" style="width:60px; height:32px;" onclick="openZipSearch()">검색</button><br>
					주소 : <input type="text" name="client_address" style="width:300px; height:30px;" readonly /><br>
					상세 : <input type="text" name="client_dateilAddress" style="width:300px; height:30px;" />
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit"
					value="회원가입" /> <input type="reset" value="다시쓰기" /></td>
			</tr>
		</table>
	</form>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	repassword.onblur = function() {
		var pw = password.value;
		var repw = repassword.value;
			if (repw!=pw) { // 비밀번호가 일치하지 않으면
				repassword.classList.add('invalid');
				error.innerHTML = '비밀번호가 일치하지 않습니다.'
				correct.innerHTML = "";
			}else if(repw==pw){
				correct.innerHTML = '비밀번호가 일치합니다.'
				error.innerHTML = "";
				
			}
		};
		repassword.onfocus = function() {
			if (repassword.classList.contains('invalid')) { //repw가 invalid 이면
				// remove the "error" indication, because the user wants to re-enter something
				repassword.value="";
				repassword.classList.remove('invalid'); // 다시 입력받을 때는 invalid(빨간색)가 아님.
				error.innerHTML = ""; //다시 입력받을 때 error 메시지도 지워줌.
				correct.innerHTML = ""; // 다시 입력받을 때 correct 메시지도 지워줌.
			}
		};
		password.onfocus = function() {
			if (repassword.classList.contains('invalid')){	
				error.innerHTML = "";
				repassword.classList.remove('invalid');
				repassword.value="";
			}	
		};
		

		function checkValue(obj) { // 비밀번호 검사
			var len = obj.password.value.trim().length;
			
			if(obj.IdDuplication.value != "idCheck"){
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
		
		function openZipSearch() { //주소 API
			new daum.Postcode({
				oncomplete: function(data) {
					$('[name=client_addressNumber]').val(data.zonecode); // 우편번호 (5자리)
					$('[name=client_address]').val(data.address);
					$('[name=client_dateilAddress]').val(data.buildingName);
				}
			}).open();
		}
	</script>

</body>
</html>