<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	//비밀번호 에러 처리
	let error = '${error}';
	
	if(error!="" && error!=null){
		alert(error);
	}
</script>
<script src="<c:url value="/resources/js/loginForm.js" />"></script>
<title>Insert title here</title>
</head>
<body>

<body onload="document.loginForm.id.focus()">
	<form action="loginCheck" method="post" name="loginForm" onsubmit="return loginFormCheck(this)">
		<table width="500" align="center" border="1" cellpadding="5"
			cellspacing="0">
			<tr>
				<th colspan="2">로그인</th>
			</tr>
			
			<tr>
				<td width="150">아이디</td>
				<td width="350">
				<input type="text" name="client_id" id="client_id" placeholder="아이디를 입력하세요" />
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="client_password" placeholder="비밀번호 입력하세요"
						id="client_password" /></td>
			</tr>
			
		
			<tr>
				<td align="center" colspan="2">
				<input type="submit" value="로그인" />
				<input type="button" value="회원가입" onclick="location.href='register'"/>  
			</tr>
		</table>
	</form>
</body>
</html>