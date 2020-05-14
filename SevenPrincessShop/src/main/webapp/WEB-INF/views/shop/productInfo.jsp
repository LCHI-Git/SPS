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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

var count = 0;
var sizeList = new Array();
var colorList = new Array();
var stockList = new Array();

///////////////////////// 찬호오빠한테 로그인 하세요 물어보기
///////////////////////// 옵션 삭제할 때 배열에서도 삭제하고 거기에 공백 뺴기



//	옵션 선택 삭제
	function deleteOption(btnClass) {
			
			var del = $(btnClass).attr("class");
			sizeList[del] = "";
			colorList[del] = "";
			stockList[del] = "";
			
			$('#' + del).empty();
			$('#' + del).remove();
		
	}
	
		
		
//	옵션 선택
	function selectOptionend() {
		for (var i = 0; i < sizeList.length; i++) {
			if(sizeList[i] == $("#sizeSel option:selected").val() && colorList[i] == $("#colorSel option:selected").val()){
			
			$("#check").attr("name", "select");
			$('#colorSel option:eq(0)').attr('selected', 'selected');
			$('#sizeSel option:eq(0)').attr('selected', 'selected');
			$('#colorSel option:eq(0)').removeAttr('selected');
			$('#sizeSel option:eq(0)').removeAttr('selected');
			alert("이미 선택된 옵션입니다.");
			return false;
		}
	}
		if($("#colorSel option:selected").val() != ""){
					sizeList.push($("#sizeSel option:selected").val());
					colorList.push($("#colorSel option:selected").val());
					stockList.push(1);
					
					var options = $("#sizeSel option:selected").val() + " / " + $("#colorSel option:selected").val();
					var stockOption= "";
					
					for (var i = 1; i < 6; i++) {
						stockOption =	stockOption +"<option value='" + i + "'>"+ i +"</option>";
					}
					
					
					$("#colorSelDiv").after("<div id = '" + count 
							+ "' style='border:1px solid #d4c8cc; padding: 15px;')><div>"
							+ options  
					+"</div><div><select id=" + count +" onclick='selectStock(this.id)'>" 
					+ stockOption + "</select></div><a href='#'><span class = '" 
					+ count 
					+ "' style='border:1px solid #d4c8cc; margin: 0 3px;' onclick='deleteOption(this)'> x </span></a></div>");
				
				$("#check").attr("name", "select");
				$('#colorSel option:eq(0)').attr('selected', 'selected');
				$('#sizeSel option:eq(0)').attr('selected', 'selected');
				$('#colorSel option:eq(0)').removeAttr('selected');
				$('#sizeSel option:eq(0)').removeAttr('selected');
				count = count + 1;
		}
	}
	
//	수량 재선택
	function selectStock(stock)  {
		stockList[stock] = $("#"+ stock + "option:selected").val();
	}

//	옵션 중 컬러 먼저 선택
	function selectOption() {
		
		//상위 사이즈 선택 창의 현재 select 벨류가 sizeIsNone 이면 사이즈 선택 알렛
		if($("#check").attr("name") == "noneSelect"){
			if($("#sizeSel option:selected").val() == "sizeIsNone"){
	
				alert("사이즈를 먼저 선택해주세요.");
			
			}
		}
		$("#check").attr("name", "noneSelect");
	}
	
	var sendCode = "";
	var client =  "${nowUser.client_id}";
	
//	장바구니 클릭
	 function cart(){
	if (client=="비회원"){
			alert("로그인이 필요합니다.");
			return false; 
		}
		alert("상품 "+ sizeList.length + "개가 장바구니에 담겼습니다.");
		
		for (var i = 0; i < sizeList.length; i++) {
			sendCode += sizeList[i]+"_"+colorList[i]+"_"+stockList[i]+"/"; 
		}
			let idx = ${productVO.product_idx};
			location.href = "insertCart?orderList_client_idx=" + ${nowUser.client_idx} + "&orderList_product_idx=" + idx +"&selectCode="+sendCode;
	}
	
	
//	바로 결제 클릭
 	function pay(){
 		if (client=="비회원"){
			alert("로그인이 필요합니다.");
			return false; 
		}
		for (var i = 0; i < sizeList.length; i++) {
			sendCode += sizeList[i]+"_"+colorList[i]+"_"+stockList[i]+"/"; 
		}
			let idx = ${productVO.product_idx};
			location.href = "pay?orderList_client_idx=" + ${nowUser.client_idx} + "&orderList_product_idx=" + idx +"&selectCode="+sendCode;
	}

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<%-- <form action="insertCart">
	<input type="hidden" name="orderList_client_idx" value="${nowUser.client_idx}"/>
	<input type="hidden" name="orderList_product_idx" value="${productVO.product_idx}"/>
	<input id="sendCode" type="hidden" name="selectCode" value=""/>
</form> --%>
<div style="margin: 50px 15%;">


<!-- 상품 선택 -->
<span id="check" style="display:none;" name="noneselect"></span>
<div style="border: 1px solid #d4c8cc; padding: 15px; width: 100%; height: 450px">
		<div class="imgDiv" style="width: 100%;">
			<img src= "${productVO.product_imgPath}.jpg">
		</div>
		<div class="nameDiv">${productVO.product_name}</div>
		<div class="priceDiv">
			<div class="price">PRICE</div>
			<div class="price">${productVO.product_price}</div>
		</div>
		
		<div class="sizeDiv">
			<div class="size">SIZE</div>
			<div class="size">
				<select id="sizeSel" >
					<option id="none" value="sizeIsNone" >옵션 선택</option>
					<c:if test="${fn:length(size)> 0}">
					<fmt:parseNumber var="sizeNum" type="number" value="${fn:length(size)}" />
						<c:forEach var="i" begin="0" end="${sizeNum-1}" step="1">
							<option value="${size[i]}" >${size[i]}</option>
						</c:forEach>
					</c:if> 
				</select>
				
			</div>
		</div>
		
		<div class="colorDiv">
			<div class="color">COLOR</div>
			<div class="color" id="colorSelDiv">
				<select id="colorSel" onclick="selectOption()" onchange="selectOptionend()">
					<option id="none2" value="colorIsNone">옵션 선택</option>
					<c:if test="${fn:length(color)> 0}">
					
					<fmt:parseNumber var="colorNum" type="number" value="${fn:length(color)}" />
					
						<c:forEach var="i" begin="0" end="${colorNum-1}" step="1">
							<option value="${color[i]}">${color[i]}</option>
						</c:forEach>
					</c:if> 
			
				</select>
			</div>
			
		</div>
		<div>
			<div class="cartDiv"><button onclick="cart()">장바구니</button></div>
			<div class="payDiv"><button onclick="pay()">바로결제</button></div>
		</div>
</div>


<hr/>

<!-- 상품 사진 -->
<%-- <div>
<c:if test="${productVO.product_imgPathStock> 0}">
	<c:forEach var="i" begin="1" end="${productVO.product_imgPathStock}" step="1">
		<div class="infoImg" style="margin: 4%;">
			<img id="infoImg" src= "${productVO.product_imgPath}_0${i}.jpg">
		</div>
	</c:forEach>
</c:if>
</div>
<hr/>


상품배송 안내<br/>
<br/>
상품발송 <br/>
<br/>
저희 쇼핑몰은 평일 오후 2시 이전 결제완료건에 한하여, 당일 발송을 원칙으로 합니다.<br/>
단, 주문상품의 입고지연 및 주문제작 상품 경우, 발송기간이 2~3일 가량 지연될 수 있습니다.<br/>
<br/>
<br/>
<br/>
평일(월~금) 주문건 오후 2시 이전 결제건<br/>
<br/>
당일 발송. 오후 6시 상품 출고<br/>
<br/>
<br/>
<br/>
평일(월~금) 주문건 오후 2시 이후 결제건<br/>
<br/>
익일 발송. 다음날 오후 6시 상품 출고<br/>
<br/>
<br/> 
<br/>
토/일/공휴일 결제건<br/>
<br/>
다음 영업일 기준 오후 6시 상품 출고<br/>
<br/>
배송기간<br/>
<br/>
국내 상품은 상품발송일로 부터, 택배사의 사정에 따라 1일~3일 가량 소요될 수 있습니다.<br/>
<br/>
해외 상품은 상품발송일로 부터, 택배사의 사정에 따라 12일~15일 가량 소요될 수 있습니다.<br/>
<br/>
주말/공휴일을 포함하거나, 도선산간 지역일 경우 추가적인 배송지연이 발생할 수 있습니다.<br/>
<br/>
배송요금<br/>
<br/>
8만원 이하 결제건 : 배송비 2,500원 (주문 결제시, 부담)<br/>
<br/>
8만원 이상 결제건 : 무료 배송<br/>
<br/>
단, 아래와 같은 경우 별도의 추가 배송비(도선료)가 발생 됩니다.<br/>
<br/>
- 도서산간/제주도 : 추가요금 500원<br/>
<br/>
- 국내 기타/섬 지역 : 4,500원<br/>
<br/>
- 해외 발송 : 전화문의<br/>
<br/>
배송조회<br/>
<br/>
우체국 택배<br/>
<br/>
배송조회는 택배사의 홈페이지 또는 전화문의를 이용 하시거나,<br/>
쇼핑몰 내 마이페이지 > 배송조회를 통해 확인하실 수 있습니다.<br/>

<hr/>
<!-- REVIEW -->
<b>총 개의 리뷰가 있습니다.</b>

 --%>
</div>
<%-- <%@ include file="/WEB-INF/views/include/footer.jsp"%> --%>
</body>
</html>