<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>�Ǹ� ���</title>
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

	<!-- �˻�â -->
	<form action="salesTable" method="post" class="container gs">
		<h2>�ǸŸ��</h2>
		<div class="row" >		
			<div class="col-xs-2 fc">
				<select id="searchKey" name="searchKey" class="form-control">
			 			 <option id="1" value="orderList_idx">orderList_idx</option>
			 			 <option id="2" value="product_name">��ǰ��</option>
			 			 <option id="3" value="orderList_status">�Ǹ� ����</option>
			  			 <option id="4" value="client_id">��ID</option>
			  			 <option id="5" value="product_price">�ݾ�</option>
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
			<input class="btn btn-default"  type="submit" value="����"> 
		</div>	
	</form>
	
			
			
	<!-- ���̺� -->			
	<div class="ta">
		<div class="container">
			<div id="listNum">${count}��</div>
			<table class="table table-hover">
				<tr>
					<th><a href="salesTable">orderList_idx</a></th>
					<th><a href="salesTable">�Ǹ���ǰ</a></th>
					<th><a href="salesTable">��ǰ��</a></th>
					<th><a href="salesTable">�ǸŻ���</a></th>
					<th><a href="salesTable">�� ID></a></th>
					<th><a href="salesTable">�ݾ�</a></th>	
					<th><a href="salesTable">�Ǹ�����</a></th>	 
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
				
					
				<!-- ������ �̵� ��ư -->
				<tr>
					<td align="center" colspan="7">
						<!-- ó������, 10������ ������ --> 
						<c:if test="${joinList.startPage > 1}">
							<input type="button" value="start page" onclick="location.href='?currentPage=1'" title="ù �������� �̵��մϴ�." />
							<input type="button" value="-10 page" onclick="location.href='?currentPage=${joinList.startPage - 1}'" title="���� 10 �������� �̵��մϴ�." />
						</c:if> 
						<c:if test="${joinList.startPage <= 1}">
							<input type="button" value="start page" disabled="disabled" title="�̹� ù ������ �Դϴ�." />
							<input type="button" value="-10 page" disabled="disabled" title="���� 10 �������� �����ϴ�." />
						</c:if> 
						
						
						<!-- ������ �̵� --> 
						<c:forEach var="i" begin="${joinList.startPage}" end="${joinList.endPage}" step="1">
							<c:if test="${i == joinList.currentPage}">
								<input class="button button2" type="button" value="${i}" disabled="disabled" />
							</c:if>

							<c:if test="${i != joinList.currentPage}">
								<input class="button button1" type="button" value="${i}" 
									onclick="location.href='?currentPage=${i}&searchKey=${joinList.searchKey}&searchValue=${joinList.searchValue}	&startDate=${joinList.startDate}&endDate=${joinList.endDate}'"	
									title="${i}�������� �̵��մϴ�." />
							</c:if>
						</c:forEach> 
						
						<!-- ����������, 10������ �ڷ� --> 
						<c:if test="${joinList.endPage < joinList.totalPage}">
							<input type="button" value="+10 page"
								onclick="location.href='?currentPage=${joinList.endPage + 1}'"
								title="���� 10 �������� �̵��մϴ�." />
							<input type="button" value="end page"
								onclick="location.href='?currentPage=${joinList.totalPage}'"
								title="������ �������� �̵��մϴ�." />
						</c:if> 
						<c:if test="${joinList.endPage >= joinList.totalPage}">
							<input type="button" value="+10 page" disabled="disabled"
								title="���� 10 �������� �����ϴ�." />
							<input type="button" value="end page" disabled="disabled"
								title="�̹� ������ ������ �Դϴ�." />
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
</body>
</html>