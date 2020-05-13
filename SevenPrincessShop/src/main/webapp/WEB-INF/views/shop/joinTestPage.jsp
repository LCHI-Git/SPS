<!-- 추후 삭제하세요 프레임 참고용 가입페이지입니다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl 사용하기위한 태그입니다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>카드결제</title>
<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
td, tr{
	border: 1px solid;
	text-align: left;
	}
	
	#orderPhon{
	width: 50px;
}

#Numchk{
	width: 70px;
}

</style>


<!-- 외부 스크립트 파일 지정 태그입니다. -->
<script src="${pageContext.request.contextPath}/resources/memberJavaScript/testScriptJoinCheck.js"></script>


</head>
<body>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>
<form id="join" align="center" action="" name="f">
<h1>-핸드폰 결제 페이지-</h1>
<h1>1. 장바구니 --> [2. 주문서 작성] ---> 3. 결제완료</h1>

<table align="center">
<tr>
  	<td>통신사 선택</td>
  	<td>
<input type = "radio" name="phon" required="required">SKT
<input type = "radio" name="phon" required="required">LG
<input type = "radio" name="phon" required="required">KT
</td>
</tr>
<tr>
	<td>전화번호</td>
	<td>
	<input class="phone" type="text" id="phone_number" name="client_phoneNumber" value="${vo.client_phoneNumber}"
	 maxlength="11"  required="required" placeholder="- 없이 입력해주세요" onblur="regCheck3()"/>
	
	<button class="sendMessage" id="sendMessage" onclick="sendCode()" >인증번호 발송</button><br/>
	<span id="errorPhoneNumber" style="color: red;"></span><br/>
	</td>
</tr>	
	
	<tr>
  	<td>인증번호</td>
  	<td>
	<input type="text" id="inputCode" maxlength="6" size="6" required="required" placeholder="인증번호"/>
	<input type="hidden" id="code" value="${code}" >
	<input type="hidden" name="flag" id="flag" value="${flag}"/>
	<button class="sendMessage" type="button" id="sendButton" onclick="checkCode()">인증번호 확인</button><br/>
	<span id="errorCode" style="color: red;"></span>
		</td>
  </tr>
	<tr>
	
	<td>결제</td>
	<td>
	<button type="button" onclick="joinMember()" value="결제하기" >결제</button>
	<button type="button" class="pay-cancle" onclick="location.href='pay'">결제취소</button>
	</td>
	</tr>
	</table>
	
	</form>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>