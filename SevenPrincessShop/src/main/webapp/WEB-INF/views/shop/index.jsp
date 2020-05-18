<%@page import="jason.stdlib.include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SevenPrincessShop</title>

<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">

<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>

<!-- BEST ITEM입니다~~~!!!! -->
<h2 align="center">BEST ITEM</h2>
<hr/>

<div class="contentArea" id="bestItem">
	<div class="container">
		<!-- row는 한줄 -->
		<div class="row">
		<!-- 칸 -->
		<c:forEach var="productList" items="${productList}">
			<!-- 상품 이미지 -->
			<div class="col-sm">
				<div class="thumb">
					<c:if test="${productList.product_category > 0}">
						<a href="productInfo?product_imgPath=${productList.product_imgPath}&product_category=${productList.product_category}&product_idx=${productList.product_idx}">
							<img alt="상품" src="${productList.product_imgPath}${productList.product_category}/${productList.product_category}_1/${productList.product_category}_1(1).jpg"/>
						</a>
					</c:if>
				</div>
			<!-- 상품 이름 -->
			<div class="prdInfo">
				<div class="Pname">
					<a href="productInfo?product_imgPath=${productList.product_imgPath}&product_category=${productList.product_category}&product_idx=${productList.product_idx}">
						<span class="instock-icon">국내</span>
						${productList.product_name}
					</a>
				</div>
					<div class="Pprice">
						<span class="price">${productList.product_price}</span>원
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</div>
	
	<!-- HIT ITEM입니다!!!!!!!!!!!!!!!!!! -->
	<h2 align="center">HIT ITEM</h2>
	<hr/>
	
	<div class="contentArea" id="hitItem">
		<div class="container">
			<div class="row">
			<c:forEach var="productList" items="${productList}">
				<!-- 상품 이미지 -->
				<div class="col-sm">
					<div class="thumb">
						<c:if test="${productList.product_category > 0}">
							<a href="productInfo?product_imgPath=${productList.product_imgPath}&product_category=${productList.product_category}&product_idx=${productList.product_idx}">
								<img alt="상품" src="${productList.product_imgPath}${productList.product_category}.jpg"/>
							</a>
						</c:if>
					</div>
				<!-- 상품 이름 -->
				<div class="prdInfo">
					<div class="Pname">
						<a href="productInfo?product_imgPath=${productList.product_imgPath}&product_category=${productList.product_category}&product_idx=${productList.product_idx}">
							<span class="instock-icon">국내</span>
							${productList.product_name}
						</a>
					</div>
						<div class="Pprice">
							<span class="price">${productList.product_price}</span>원
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 상의입니다!!!!! -->
	<h2 align="center">상의</h2>
	<hr/>
	<div class="contentArea" id="topItem">
		<div class="container">
			<div class="row">
			<%-- <c:set var="i" value="1"/> --%>
			<c:forEach var="vo" items="${topList}">
				<!-- 상품 이미지 -->
				<div class="col-sm">
					<div class="thumb">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<img alt="상품" src="${vo.product_imgPath}${vo.product_category}/${vo.product_category}_${topCount}/${vo.product_category}_${topCount}(1).jpg" width="300px" height="300px"/>
						</a>
						카운트:${topCount}
					</div>
				<!-- 상품 이름 -->
				<div class="prdInfo">
					<div class="Pname">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<span class="instock-icon">국내</span>
							${vo.product_name}
						</a>
					</div>
						<div class="Pprice">
							<span class="price">${vo.product_price}</span>원
						</div>
					</div>
				</div>
				
				<c:set var="topCount" value="${topCount - 1}"/>
				
			</c:forEach>
			</div>
		</div>
	</div>
		
	
	<h2 align="center">하의</h2>
	<hr/>
	<div class="contentArea" id="bottomItem">
		<div class="container">
			<div class="row">
			<c:forEach var="vo" items="${bottomList}">
				<!-- 상품 이미지 -->
				<div class="col-sm">
					<div class="thumb">
					
					<!-- 카테고리 8이 8_6까지 밖에 없기에 if로 오류를 잡아줬다.(7도 마찬가지) -->
					<c:if test="${bottomCount == 8}">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<img alt="상품" src="${vo.product_imgPath}${vo.product_category}/${vo.product_category}_6/${vo.product_category}_6(1).jpg" width="300px" height="300px"/>
						</a>
					</c:if>
					<c:if test="${bottomCount == 7}">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<img alt="상품" src="${vo.product_imgPath}${vo.product_category}/${vo.product_category}_5/${vo.product_category}_5(1).jpg" width="300px" height="300px"/>
						</a>
					</c:if>
					<c:if test="${bottomCount != 8 && bottomCount != 7}">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<img alt="상품" src="${vo.product_imgPath}${vo.product_category}/${vo.product_category}_${bottomCount}/${vo.product_category}_${bottomCount}(1).jpg" width="300px" height="300px"/>
						</a>
					</c:if>
					카운트:${bottomCount}
					</div>
					
				<!-- 상품 이름 -->
				<div cl{ass="prdInfo">
					<div class="Pname">
						<c:if test="${vo.product_category gt 4 && vo.product_category le 8}">
							<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
								<span class="instock-icon">국내</span>
								${vo.product_name}
							</a>
						</c:if>
					</div>
						<c:if test="${vo.product_category gt 4 && vo.product_category le 8}">
							<div class="Pprice">
								<span class="price">${vo.product_price}</span>원
							</div>
						</c:if>
					</div>
				</div>
				
				<c:set var="bottomCount" value="${bottomCount - 1}"/>
				
			</c:forEach>
			</div>
		</div>
	</div>
	
	<h2 align="center">원피스</h2>
	<hr/>
	<div class="contentArea" id="onePieceItem">
		<div class="container">
			<div class="row">
			<c:forEach var="vo" items="${onePieceList}">
			
				<!-- 상품 이미지 -->
				<div class="col-sm">
					<div class="thumb">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<img alt="상품" src="${vo.product_imgPath}${vo.product_category}/${vo.product_category}_${onePieceCount}/${vo.product_category}_${onePieceCount}(1).jpg" width="300px" height="300px"/>
						</a>
						카운트:${onePieceCount}
					</div>
				<!-- 상품 이름 -->
				<div class="prdInfo">
					<div class="Pname">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<span class="instock-icon">국내</span>
							${vo.product_name}
						</a>
					</div>
						<div class="Pprice">
							<span class="price">${vo.product_price}</span>원
						</div>
					</div>
				</div>
				
				<c:set var="onePieceCount" value="${onePieceCount - 1}"/>
				
			</c:forEach>
			</div>
		</div>
	</div>
	
	<h2 align="center">아우터</h2>
	<hr/>
	<div class="contentArea" id="outerItem">
		<div class="container">
			<div class="row">
			<c:forEach var="vo" items="${outerList}">
			
				<!-- 상품 이미지 -->
				<div class="col-sm">
					<div class="thumb">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<img alt="상품" src="${vo.product_imgPath}${vo.product_category}/${vo.product_category}_${outerCount}/${vo.product_category}_${outerCount}(1).jpg" width="300px" height="300px"/>
						</a>
						카운트:${outerCount}
					</div>
				<!-- 상품 이름 -->
				<div class="prdInfo">
					<div class="Pname">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<span class="instock-icon">국내</span>
							${vo.product_name}
						</a>
					</div>
						<div class="Pprice">
							<span class="price">${vo.product_price}</span>원
						</div>
					</div>
				</div>
				
				<c:set var="outerCount" value="${outerCount - 1}"/>
				
			</c:forEach>
			</div>
		</div>
	</div>
	
	<h2 align="center">악세사리</h2>
	<hr/>
	<div class="contentArea" id="acsItem">
		<div class="container">
			<div class="row">
			<c:forEach var="vo" items="${acsList}">
			
				<!-- 상품 이미지 -->
				<div class="col-sm">
					<div class="thumb">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<img alt="상품" src="${vo.product_imgPath}${vo.product_category}/${vo.product_category}_${acsCount}/${vo.product_category}_${acsCount}(1).jpg" width="300px" height="300px"/>
						</a>
						카운트:${acsCount}
					</div>
				<!-- 상품 이름 -->
				<div class="prdInfo">
					<div class="Pname">
						<a href="productInfo?product_imgPath=${vo.product_imgPath}&product_category=${vo.product_category}&product_idx=${vo.product_idx}">
							<span class="instock-icon">국내</span>
							${vo.product_name}
						</a>
					</div>
						<div class="Pprice">
							<span class="price">${vo.product_price}</span>원
						</div>
					</div>
				</div>
				
				<c:set var="acsCount" value="${acsCount - 1}"/>
				
			</c:forEach>
			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>