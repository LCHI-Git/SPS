<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
  
  

	<div class="subpageTitle">
		<ul>
				<li class="active"><a href="showCategory?cNum=01">블라우스</a></li>
				<li class=""><a href="showCategory?cNum=02">티셔츠</a></li>
				<li class=""><a href="showCategory?cNum=03">맨투맨</a></li>
				<li class=""><a href="showCategory?cNum=04">후드</a></li>
			</ul>
		<div class="count">TOTAL : <span>203</span>ea</div>
	</div>
	
	
  

	<div class="contentArea">
	
	
		<div class="container">
		
		<c:forEach begin="0" end="10" step="1">
			
			<div class="row">
			
			
			<c:forEach begin="0" end="3" step="1">
			
				<div class="col-sm">
					
					<div class="thumb">
						<a href="/product/view/711">
							<img alt="상품" src="./resources/images/productImages/01/01_01.jpg"/>
						</a>
					</div>
					
					<div class="prdInfo">
					
						<div class="Pname">
							<a href="/product/view/711"><span class="instock-icon">국내</span>
							[DA33]하운드 체크 패턴 데일리룩 셔츠</a>
						</div>
						
						<div class="Pprice">
							<span class="price">22,000</span>원
						</div>
						
						<div class="Picon"></div>
				
				
				</div>
			</div>
			
			</c:forEach>
			
			
		</div>
		</c:forEach>
	</div>		
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>