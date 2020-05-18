<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>여기는 카테고리 쇼 페이지입니다.</h1>
	<h1>넘어온 카테고리 넘버 : ${cNum}</h1>
	<h1>로그인을 하셨다면 유저의 정보 : ${nowUser.client_id }</h1>
	${pList }
	<div>
		
	</div>
	
	<c:forEach var="vo" items="${pList }">
		${vo.product_name}
		${vo.product_idx }
	</c:forEach
	
	>
</body>
</html>