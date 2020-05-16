<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>판매 목록</title>
	<script type="text/javascript">
	   window.onload = function(){
	      var k = "${key}";
	      if(k=="orderList_idx"){
	         document.getElementById("1").setAttribute("selected", "selected");
	      }else if(k=="product_name"){
	          document.getElementById("2").setAttribute("selected", "selected");
	      }else if(k=="orderList_status"){
	          document.getElementById("3").setAttribute("selected", "selected");
	      }else if(k=="client_id"){
	          document.getElementById("4").setAttribute("selected", "selected");
	      }else if(k=="product_price"){
	          document.getElementById("5").setAttribute("selected", "selected");
	      }
		};
 	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/css_js_link.html"%>

	<!-- 검색창 -->
	<form action="salesTable" method="post" class="container gs">
		<h2>판매목록</h2>
		<div class="row" >		
			<div class="col-xs-2 fc">
				<select id="searchKey" name="searchKey" class="form-control">
			 			 <option id="1" value="orderList_idx">orderList_idx</option>
			 			 <option id="2" value="product_name">제품명</option>
			 			 <option id="3" value="orderList_status">판매 상태</option>
			  			 <option id="4" value="client_id">고객ID</option>
			  			 <option id="5" value="product_price">금액</option>
				</select> 
			</div>			
			<div class="col-xs-2">
				<input type="text" name="searchValue" class="form-control" value="${value}">
			</div>
		</div>
		<div class="row col-xs-2 sf">		
			
			<input type="date" name="startDate" class="form-control" value="${sDate}"> 
				&nbsp;&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="date" name="endDate" class="form-control" value="${eDate}">
				&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-default"  type="submit" value="전송"> 
		</div>	
	</form>
	
			
			
	<!-- 테이블 -->			
	<div class="ta">
		<div class="container">
			<div id="listNum">${count}개</div>
			<table class="table table-hover">
				<tr>
					<th><a href="salesTable">orderList_idx</a></th>
					<th><a href="salesTable">판매제품</a></th>
					<th><a href="salesTable">제품명</a></th>
					<th><a href="salesTable">판매상태</a></th>
					<th><a href="salesTable">고객 ID></a></th>
					<th><a href="salesTable">금액</a></th>	
					<th><a href="salesTable">판매일자</a></th>	 
				</tr>
				
				<c:forEach var="test" items="${joinList.joinList}"> 
				<tr id="rec">
					<td style="vertical-align: middle;">${test.orderListVO.orderList_idx}</td>
					<td style="vertical-align: middle;"><img src="${test.productVO.product_imgPath}/01_01.jpg" width="60px" height="60px"/></td>
					<td style="vertical-align: middle;">${test.productVO.product_name}</td>
					<td style="vertical-align: middle;">${test.orderListVO.orderList_status}</td>
					<td style="vertical-align: middle;">${test.clientVO.client_id }</td>
					<td style="vertical-align: middle;">${test.productVO.product_price}</td>
					<td style="vertical-align: middle;">${test.orderListVO.orderList_orderDate}</td>

				</tr>
				</c:forEach> 
				
					
				<!-- 페이지 이동 버튼 -->
				<tr>
					<td align="center" colspan="7">
						<!-- 처음으로, 10페이지 앞으로 --> 
						<c:if test="${joinList.startPage > 1}">
							<input type="button" value="start page" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다." />
							<input type="button" value="-10 page" onclick="location.href='?currentPage=${joinList.startPage - 1}'" title="이전 10 페이지로 이동합니다." />
						</c:if> 
						<c:if test="${joinList.startPage <= 1}">
							<input type="button" value="start page" disabled="disabled" title="이미 첫 페이지 입니다." />
							<input type="button" value="-10 page" disabled="disabled" title="이전 10 페이지가 없습니다." />
						</c:if> 
						
						
						<!-- 페이지 이동 --> 
						<c:forEach var="i" begin="${joinList.startPage}" end="${joinList.endPage}" step="1">
							<c:if test="${i == joinList.currentPage}">
								<input class="button button2" type="button" value="${i}" disabled="disabled" />
							</c:if>

							<c:if test="${i != joinList.currentPage}">
								<input class="button button1" type="button" value="${i}" 
									onclick="location.href='?currentPage=${i}&searchKey=${joinList.searchKey}&searchValue=${joinList.searchValue}	&startDate=${joinList.startDate}&endDate=${joinList.endDate}'"	
									title="${i}페이지로 이동합니다." />
							</c:if>
						</c:forEach> 
						
						<!-- 마지막으로, 10페이지 뒤로 --> 
						<c:if test="${joinList.endPage < joinList.totalPage}">
							<input type="button" value="+10 page"
								onclick="location.href='?currentPage=${joinList.endPage + 1}'"
								title="다음 10 페이지로 이동합니다." />
							<input type="button" value="end page"
								onclick="location.href='?currentPage=${joinList.totalPage}'"
								title="마지막 페이지로 이동합니다." />
						</c:if> 
						<c:if test="${joinList.endPage >= joinList.totalPage}">
							<input type="button" value="+10 page" disabled="disabled"
								title="다음 10 페이지가 없습니다." />
							<input type="button" value="end page" disabled="disabled"
								title="이미 마지막 페이지 입니다." />
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
</body>
</html>