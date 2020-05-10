<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="info" method="post">
<div class="projectInfo">
	<img src="./images/productImages/01/01_01/01_01.jpg">
	<ul>
		<li>상품이름 : </li>
		<li>판매가격 : </li>
		<li>사이즈: </li>
		<li>컬러: </li>
		<li>

			<table> 
				<tr>
					<td>주문사항</td>
					<td></td>
					<td>수량</td>
					<td></td>
				</tr>
			</table>
		상품 총 금액 : </li>
	</ul>
</div>

<hr/>
<%-- <c:if test="${vo.lev > 0}">
	<c:forEach var="i" begin="1" end="${vo.lev}" step="1">
	</c:forEach>
	<img src="./images/productImages/01/01_01/01_0"+"i"+".jpg"/>
</c:if>  --%>

</form>

</body>
</html>