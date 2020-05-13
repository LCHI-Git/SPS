 <%@page import="jason.stdlib.include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SevenPrincessShop</title>
<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>

<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>

<h1>여기는 메인 Index 페이지 입니다.</h1>
<h1>로그인을 하셨다면 유저의 정보 : ${nowUser.client_id }</h1>
<h3>상세페이지에서 주문을 할경우 DB를 거치지 않고 pay.jsp페이지로 값들을 받아와 뿌려준다.</h3>
구입상품명<br/>
주문금액<br/>
상품이미지<br/>
옵션<br/>
개수<br/>
<h3>장바구니에서 주문하기 버튼을 누를경우 DB로 저장된 장바구니의 정보를 가져와 pay.jsp페이지에 뿌려준다.</h3>
구입상품명<br/>
주문금액<br/>
상품이미지<br/>
옵션<br/>
개수<br/>

<h3>결제에 필요한 정보</h3>
주문자명<br/>
연락처<br/>
이메일<br/>
주소<br/>
총 결제금액<br/>
결제방법 선택<br/>

<h3>결제 완료 후</h3>
관리자와 주문자에서 주문완료 정보 넘겨주기

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>