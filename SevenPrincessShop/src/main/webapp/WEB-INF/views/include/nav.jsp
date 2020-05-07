<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>

<!-- css 적용 코드 -->
<link href="${path}/resources/css/nav.css" rel="stylesheet"/>
</head>
<body>

<!-- header 3 - nav -->
<div class="col-xs-12 mainMenuContainer">			
	<div class="contentLimit">	
		<div class="col-xs-12 col-lg-8 col-lg-offset-2 ">			
			<div class="row">
				<nav class="navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" aria-expanded="false">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a href="/product/top" class="dropdown-toggle" data-toggle="dropdown">상의
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/1" target="_self">블라우스</a>
									</li>
									<li>
										<a href="/product/2" target="_self">티셔츠</a>
									</li>
									<li>
										<a href="/product/3" target="_self">맨투맨</a>
									</li>
									<li>
										<a href="/product/4" target="_self">후드</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/bottom" class="dropdown-toggle" data-toggle="dropdown">하의
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/5" target="_self">청바지</a>
									</li>
									<li>
										<a href="/product/6" target="_self">반바지</a>
									</li>
									<li>
										<a href="/product/7" target="_self">와이드팬츠</a>
									</li>
									<li>
										<a href="/product/8" target="_self">스커트</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/dress" class="dropdown-toggle" data-toggle="dropdown">원피스
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/9" target="_self">롱원피스</a>
									</li>
									<li>
										<a href="/product/10" target="_self">숏원피스</a>
									</li>
									<li>
										<a href="/product/11" target="_self">민소매원피스</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/outer" class="dropdown-toggle" data-toggle="dropdown">아우터
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/12" target="_self">코트</a>
									</li>
									<li>
										<a href="/product/13" target="_self">자켓</a>
									</li>
									<li>
										<a href="/product/14" target="_self">가디건</a>
									</li>
									<li>
										<a href="/product/15" target="_self">패딩</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="/product/accessory" class="dropdown-toggle" data-toggle="dropdown">악세사리
									<span class="caret hidden-sm hidden-md hidden-lg"/>
								</a>
								<ul class="dropdown-menu " role="menu">
									<li>
										<a href="/product/16" target="_self">가방</a>
									</li>
									<li>
										<a href="/product/17" target="_self">신발</a>
									</li>
									<li>
										<a href="/product/18" target="_self">모자</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>			
</div>

</body>
</html>