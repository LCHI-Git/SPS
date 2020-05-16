<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>

<body>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

	<h2>주문목록 / 배송조회</h2>
	<hr/>
	
	<!-- 테이블에 글이 없으면 -->
	<c:if test="${list.size() == 0}">
		<tr>
			<td colspan="9" align="center">주문목록이 없습니다.</td>
		</tr>
	</c:if>
	
	<!-- 테이블에 글이 있으면 화면에 출력할 글의 개수 만큼 반복하며 글을 출력한다. -->
	<c:if test="${list.size() != 0}">
	<form>
		<c:forEach var="list" items="${list}">
				<table border="1" width="800" cellpadding="5" cellspacing="0">
						<tr>
							<!-- 1.주문일 -->
							<th align="left" colspan="2">
								${list.orderListVO.orderList_orderDate}
							</th>  
							<!-- 2.결제금액 -->
							<th align="right">
								<fmt:formatNumber value="${list.orderListVO.orderList_stock * list.productVO.product_price}" pattern="#,###"/>원
								<%-- <a href="#" onclick="content(this)" id="${status.current.orderList_idx}">
									<span><fmt:formatNumber value="${list1.orderList_stock*list2.product_price}" pattern="#,###" />원 ></span>
								</a> --%>
							</th>
						</tr>
						<tr>
							<!-- 3.상품 이미지 -->
							<td>
								 <img src="${list.productVO.product_imgPath}/01_01.jpg"/>
							</td>
							<!-- 4~6. 상품 이름 / 상품 옵션 /수량 -->
							<td>
								 <h3>${list.productVO.product_name}</h3>
								 <span>${list.orderListVO.orderList_color}</span> / 
								 <span>${list.orderListVO.orderList_size}</span> SIZE /
								 <span>${list.orderListVO.orderList_stock}개</span>
							</td>
							<!-- 7.주문 상태 -->
							<td>
								<h3>
									<c:if test="${list.orderListVO.orderList_status eq 'send'}">
										<c:out value="배송완료"/>
									</c:if>
									<c:if test="${list.orderListVO.orderList_status eq 'payOK'}">
										<c:out value="결제완료"/>
									</c:if>
									<c:if test="${list.orderListVO.orderList_status eq 'cxl'}">
										<c:out value="주문취소"/>
									</c:if>
								</h3>
			
							</td>
						</tr>
					</table><br/>
				</c:forEach>
		</form>
	</c:if>
	



</body>
</html>