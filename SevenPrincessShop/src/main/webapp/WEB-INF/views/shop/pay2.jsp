<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>카드결제</title>
<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">
<style type="text/css">



.cardtt{
width:70px;
}
.cardpass{
width: 70px;
}
.YY{
width: 55px;
}
.MM{
width: 55px;
}

td, tr{
	border: 1px solid;
	text-align: left;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>

<form role="form" method="post" align="center" action="pay3">

<h1>-카드 결제페이지-</h1>

<h1>1. 장바구니 --> [2. 주문서 작성] ---> 3. 결제완료</h1>

<table  align="center" style="width: 80%;">
<div class="cardname">
	<tr>
		<td>은행선택</td>
		<td>
  			<input type = "radio" name="cardN" required="required">기업
  			<input type = "radio" name="cardN" required="required">우체국
  			<input type = "radio" name="cardN" required="required">신한
  			<input type = "radio" name="cardN" required="required">농협
  			<input type = "radio" name="cardN" required="required">국민		
		</td>
	</tr>	
	<tr>
		<td>카드번호입력</td>
		<td>
  			<input type="text" name="card1" class="cardtt" required="required" pattern="^[0-9]{4}" maxlength="4"/>-
			<input type="text" name="card2" class="cardtt" required="required" pattern="^[0-9]{4}" maxlength="4"/>-
			<input type="text" name="card3" class="cardtt" required="required" pattern="^[0-9]{4}" maxlength="4"/>-
			<input type="text" name="card4" class="cardtt" required="required" pattern="^[0-9]{4}" maxlength="4"/>		
		</td>
	</tr>	
	<tr>
		<td>YYMM</td>
		<td>
  			<input type="text" name="YY" class="YY" required="required" pattern="^[0-9]{2}" maxlength="2"/>-
			<input type="text" name="MM" class="MM" required="required" pattern="^[0-9]{2}" maxlength="2"/>		
		</td>
	</tr>	
 	<tr>
 		<td>CVC</td>
 		<td>
 			<input type="text" name="card1" class="MM" required="required" pattern="^[0-9]{3}" maxlength="3"/>
 		</td>
 	</tr>
	<tr>
		<td>카드비밀번호</td>
		<td>
		<input type="text" name="card" class="cardpass" required="required" pattern="^[0-9]{2}" maxlength="2" placeholder="앞두자리"/>●●
		</td>
	</tr>
	<tr>
	<td>선택</td>
	<td>
		<button type="submit" class="pay">결제하기</button>
		<button type="button" class="pay-cancle" onclick="location.href='pay'">결제취소</button>
	</td>
	</tr>
</div>
</table>
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>