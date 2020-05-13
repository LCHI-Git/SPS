<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>


<div align="center">
<h1>-결제 완료 페이지-</h1>
<h1>결제가 완료되었습니다!</h1>

<h1>1. 장바구니 --> 2. 주문서 작성 ---> [3. 결제완료 ]</h1>

<br/><br/><br/><br/>
<button onclick="location.href='/controller'">메인으로 돌아가기</button>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>