<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">


<link rel="stylesheet" href="./resources/css/productInfo.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

var count = 0;
var sizeList = new Array();
var colorList = new Array();
var stockList = new Array();



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
							+ "' class='selOption'; style='border:1px solid #d4c8cc; padding: 15px;')><div>"
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
		alert("상품 "+ $('.selOption').length + "개가 장바구니에 담겼습니다.");
		
		for (var i = 0; i < sizeList.length; i++) {
			sendCode += sizeList[i]+"_"+colorList[i]+"_"+stockList[i]+"/"; 
		}
		var confirmFlag = confirm("장바구니로 이동하시겠습니까?");
			let idx = ${productVO.product_idx};
			location.href = "insertCart?orderList_client_idx=" + ${nowUser.client_idx} + "&orderList_product_idx=" + idx +"&selectCode="+sendCode+"&confirmFlag="+confirmFlag;
	}
	
	 var idx = ${productVO.product_idx};
//	바로 결제 클릭
 	function pay(){
 		if (client=="비회원"){
			alert("로그인이 필요합니다.");
			return false; 
		}
		for (var i = 0; i < sizeList.length; i++) {
			sendCode += sizeList[i]+"_"+colorList[i]+"_"+stockList[i]+"/"; 
		}
			
			location.href = "pay?orderList_client_idx=" + ${nowUser.client_idx} + "&orderList_product_idx=" + idx +"&selectCode="+sendCode+"";
	}

//	부분 품절
	function searchSoldOut(Val) {
		var sizeVal = $(btnClass).attr("class");
		// S, S, M, M
		// 살구, 블랙, 살구, 블랙
		// 0, 8, 6, 5
		
		
		
		
		/*
		
		HashMap<String, Integer> optionList = new HashMap();
		for (var i = 0; i < size.size(); i++) {
					optionList.put(allSize[i]+allColor[i], stock[i]);	
					// S살구, 0
					// S블랙, 8
					// M살구, 6
					// M블랙, 5
		}
		for (String key : keys) {
		    alert(key);
		}
		var sizeOption = new Array();
		Set<Map.Entry<String, Integer>> entries = optionList.entrySet();
		for (Map.Entry<String, Integer> entry : entries) {
			if(entry.getKey().contains(sizeVal))
				sizeOption.push(entry.getValue());
			}

		var sizeOptionString="";
		for (var i = 0; i < color.size(); i++) {
			if(sizeOption[i]==0){
				sizeOptionString +=	stockOption +"<option value='" + color[i] + "' disabled='true'>"+ color[i]+"[품절]" +"</option>";
			}else{
				sizeOptionString +=	stockOption +"<option value='" + color[i] + "'>"+ color[i] +"</option>";
			}
		}
		$("#none2").after(sizeOptionString)
		
		
	*/
	}

	function showOption() {
		alert("${ao.size()}");
		var sel = document.getElementById("sizeSel").value;
		
		
		var row = "${ao.size()}";
		var col = 3;
		
		var arr = new Array(row);
		alert(arr.length);
		var list = new Array();
			<c:forEach var="vo" items="${ao}">
				list.push("${vo}");
			</c:forEach>
		for (var i = 0; i < arr.length; i++) {
			arr[i] = new Array(col);
		}
		
		for (var i = 0; i < row; i++) {
				arr[i][0]="$list[i]}";	
				arr[i][1]="$list[i]}";	
				arr[i][2]="${list[i]}";	
		}
		for (var i = 0; i < arr.length; i++) {
			alert(arr[i]);
		}
		
		// ao.get(0).odSize='M' odOption='블랙' odStock='5'
		// ao.get(1).odSize='M' odOption='살구' odStock='8'
		// ao.get(2).odSize='S' odOption='블랙' odStock='6'
		// ao.get(3).odSize='S' odOption='살구' odStock='0'
			if(sel=='S'){
				
			}
			else if(sel=='M'){}
			else if(sel=='L'){}
			else if(sel=='F'){}
			
	}

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<div id= "contents">
<!-- 상품 선택 -->
<span id="check" style="display:none;" name="noneselect"></span>
<div id= "mainContents" >
		<!-- 이미지 -->
		<div class="imgDiv">
			<img src= "${productVO.product_imgPath}.jpg">
		</div>
		
		<!-- 상품 전체 품절 -->
		 <c:if test = "${productVO.product_stock == 0}">
			<div class="explainClass">
			<div class="nameDiv">${productVO.product_name}</div>
			<div style="border: 1px solid #d4c8cc; padding: 15px;">
				품절된 상품입니다.
			</div>
		</div>
		</c:if>
		
		
		
		<fmt:parseNumber var="sizeNum" type="number" value="${fn:length(size)}" />
		<fmt:parseNumber var='colorNum' type='number' value='${fn:length(color)}' />
		
		 
		<!-- 상품 정보 -->
		<div class="explainClass">
		<div class="nameDiv">${productVO.product_name}</div>
		<c:if test = "${productVO.product_stock != 0}">
		<div class="priceDiv">
			<div class="priceTitle">PRICE</div>
			<div class="price">${productVO.product_price}</div>
		</div>
		
		
		
		
		
		
		
		
		
		<!-- S,M -->
		<!-- 사이즈 옵션 -->
		<div class="sizeDiv">
			<div class="sizeTitle">SIZE</div>
			<div class="size">
				<select id="sizeSel" onchange="showOption()">
					<option id="none" value="sizeIsNone" >옵션 선택</option>
					<c:if test="${sizeNum >0}">
						<c:forEach var="i" begin="0" end="${sizeNum-1}" step="1">
							<option value="${size[i]}" >${size[i]}</option>
						</c:forEach>
					</c:if> 
				</select>
				
			</div>
		</div>
		
		
		
		
		<div class="colorDiv">
			<div class="colorTitle">COLOR</div>
 			<div class="color" id="colorSelDiv">
				<select id="colorSel" onclick="selectOption()" onchange="selectOptionend()">
					<option id="none2" value="colorIsNone">옵션 선택</option>
						
						
					<c:forEach var="option" items="ao">
							<c:if test=""><!-- 위의 셀렉트 값 과 option.get(0)의 값이 같은지 비교  -->
								<c:if test="" ><!-- stock이 0이상인지 비교 -->	
									<option></option>
								</c:if>		
							</c:if>

					</c:forEach>		
				
				
				</select>
			</div> 
			
		</div>
		
		
		
		<c:out value="${size }"></c:out>
		<c:out value="${color }"></c:out>
		<c:out value="${allSize }"></c:out>
		<c:out value="${allColor }"></c:out>
		<c:out value="${stock }"></c:out>
		
		
		
		
		
		
		
		<!-- 
		<!-- 살구(품절), 블랙 -->
		<!-- 색상 옵션 
		<div class="colorDiv">
			<div class="colorTitle">COLOR</div>
 			<div class="color" id="colorSelDiv">
				<select id="colorSel" onclick="selectOption()" onchange="selectOptionend()">
					<option id="none2" value="colorIsNone">옵션 선택</option>
	
			
				</select>
			</div> 
			
		</div>
		 -->
		
		
		
		
		
		
		
		
		
		<div>
			<div class="cartDiv"><button onclick="cart()">장바구니</button></div>
			<div class="payDiv"><button onclick="pay()">바로결제</button></div>
		</div>
	</c:if>
	

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