<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <!-- jstl ����ϱ����� �±��Դϴ�. ���� include ���Ϸ� �����-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel= "stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findIdPw.css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="col-xs-12 col-lg-8 contentArea">
		<div class='findResultBox'>
	<div class='ttl'>��й�ȣã��</div>
	
	<div class='resultMsg'>
	
					
			�ӽú�й�ȣ�� <span>${email }</span>���� �߱޵Ǿ����ϴ�.
			<br>�̸����� Ȯ���� �ּ���.
				
			</div>
	
	<div class='resultMenu'>
		<input type='button' class='btn  loginBtn mb20' style='float:left;' value='���ư���' onclick='history.back();'>
		
				<input type='button' class='btn btn-skyblue loginBtn mb20' value='�α���' onclick='document.location="/member"'>
			</div>
		</div>
	</div>
</body>
</html>