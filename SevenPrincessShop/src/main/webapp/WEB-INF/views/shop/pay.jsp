<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>

<link href="./resources/images/pageImages/logo.png" rel="shortcut icon" type="image/x-icon">
<!-- jquery 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	function chk(f) {
		if(f.card[0].checked == true){
			f.action="cardPay";
		}
		//두번째 라디오 버튼을 선택한 경우
		else if(f.card[1].checked == true){
			f.action = "phonePay";
		}
}
	
	//이메일 select태그에 change 발생시 text에 적용해줄 메서드
	   function emailSet(){
	      let email = $("#e0 > option:selected").val();
	      if(email!="직접입력"){
	         $("#email2").val(email);
	      }else{
	         $("#email2").val("");
	      }
	   }

</script>
<style type="text/css">

td, tr{
	border: 1px solid;
	text-align: left;
}

#userAddr2{
	width: 550px;
}

#orderPhon{
	width: 50px;
}

</style>


</head>
<body>
<%@ include file="/WEB-INF/views/include/css_js_link.html"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<%@ include file="/WEB-INF/views/include/cardSilder.jsp"%>

<form align="center">
  <h1>-주문하기 페이지-</h1>
    <h1>1. 장바구니 --> [2. 주문서 작성] ---> 3. 결제완료 </h1>
      <table width="800" cellpadding="5" cellspacing="0" align="center">
         <tr>
            <th width="80" align="center"><input type="checkbox" name="all" id="all" onclick="allChk(this.checked)"></th> <!-- 클릭시 전체 선택 -->
            <th width="300" align="center"></th> <!-- 상품 이미지 --> 
            <th width="500" align="center">주문 상품 정보</th> <!-- 상품 타이틀 + 선택 옵션 + 옵션변경 버튼  --> 
            <th width="200" align="center">수량</th>
            <td width="80" align="center"></td>  <!-- 취소 버튼 -->
         </tr>
         
         <c:set var="list1" value="${listO}"/>  <!-- 주문리스트vo -->
         <c:set var="list2" value="${listP}"/>  <!-- 상품정보 vo -->
         <!-- 주문금액 합계를 위한 변수 선언 -->
         <c:set var = "sum" value="0"/>
         
         <!-- 리스트에 글이 하나도 없을시 table에 아래 멘트 기재 -->
         <c:if test="${list1.size() == 0}">
            <tr>   
               <td colspan="5" align="center">
                  <strong>장바구니에 저장된 상품이 없습니다.</strong>
               </td>
            </tr>
         </c:if>
         
         <c:if test="${list1.size() !=0}">
            <c:forEach var="list2" items="${list2}">
               <c:forEach var = "list1" items="${list1}" varStatus="status">
                  <tr>
                     <!-- 1.항목 체크박스 -->
                     <td align="center">
                        <input type="checkbox" name="chk" class="chk" value="${list1.orderList_idx}"/>
                     </td>
                     <!-- 2.상품 이미지 -->
                     <td align="center">
                        <img src="${list2.product_imgPath}"/>
                     </td>
                     <!-- 3.상품 이름 -->
                     <td align="center">
                        <strong>${list2.product_name}</strong><br/>
                     <!--4.옵션(색상/사이즈) -->
                        <span>${list1.orderList_color}</span> / <span>${list1.orderList_size}</span> SIZE
                        
                     </td>
                     <!--5.상품 주문개수 -->
                     <td align="center">
                        <select name="amount" id="${status.current.orderList_idx}" value="${list1.orderList_stock}">
                           <!--db에서 가지고 온 재고수에 해당되는 option에 select 해주기-->
                           <option value="1" <c:if test="${list1.orderList_stock eq 1}">selected</c:if>>1</option> 
                           <option value="2" <c:if test="${list1.orderList_stock eq 2}">selected</c:if>>2</option> 
                           <option value="3" <c:if test="${list1.orderList_stock eq 3}">selected</c:if>>3</option> 
                           <option value="4" <c:if test="${list1.orderList_stock eq 4}">selected</c:if>>4</option> 
                           <option value="5" <c:if test="${list1.orderList_stock eq 5}">selected</c:if>>5</option> 
                        </select>
                        
                        <!-- c:forEach의 varStatus 속성 이용 => 버튼의 value 값을 해당 턴의 idx로 세팅  -->
                        <button type="button" onclick="stockChange(this.value)" value="${status.current.orderList_idx}">적용</button>
                     </td>
                     <td>
                     <!--6.취소 버튼(X) -->
                        <button type="button" name="cxl" onclick="boxCxl(this.value)" value="${list1.orderList_idx}">X</button>
                     </td>
                  </tr>
                  <!-- 총 결제 금액 계산 : sum 변수에 상품 가격을 반복해서 합산한다. -->
                  <c:set var = "sum" value="${sum+(list1.orderList_stock*list2.product_price)}"/>
               </c:forEach>
            </c:forEach>
         </c:if>
         
         <tr>
            <td colspan="6" align="right">
               <input type="button" onclick="chkCount()" value="선택상품 삭제"/>
               <input type="button" onclick="deleteAll()" value="전체상품 삭제"/>
            </td>
         </tr>
      </table>
<form>  
  
<h1>=======================================================================</h1>

 <form role="form" method="post" autocomplete="off" align="center" name="f">
  <input type="hidden" name="amount" value="${sum}" />
  
   <table align="center">
  <div class="inputArea">
  <tr>
  	<td>수령인</td>
  	<td> <input type="text" name="orderRec" id="orderRec" pattern="^[가-힣]+$" required="required" placeholder="한/영"/></td>
  </tr>
  <tr>
  	<td>수령인 연락처</td>
  	<td>
  	<input type="text" name="orderPhon" id="orderPhon" pattern="^[0-9]{3}" required="required" maxlength="3"/>-
  	<input type="text" name="orderPhon" id="orderPhon" pattern="^[0-9]{4}" required="required" maxlength="4"/>-
  	<input type="text" name="orderPhon" id="orderPhon" pattern="^[0-9]{4}" required="required" maxlength="4"/>
  	</td>
  </tr>
  <tr>
  	<td>이메일</td>
  	<td>
  	 <input type="text" name="email1" id="email1" pattern="^([\w-]+(?:\.[\w-]+)*)" required="required" />@
  	 <input type="text" name="email2" id="email2" pattern="((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)" value="naver.com" required="required" />
  	<select id="e0" onchange="emailSet()">
               <option id="e1" value="naver.com" selected>naver.com</option>
               <option id="e2" value="google.com">google.com</option>
               <option id="e3" value="daum.net">daum.net</option>
               <option>직접입력</option>
     </select>
  	</td>
  </tr>
  <tr>
  	<td>우편번호</td>
  	<td><input type="text" name="userAddr1" id="userAddr1"/><button>우편번호</button></td>
  </tr>
  <tr>
  	<td>주소</td>
  	<td><input type="text" name="userAddr2" id="userAddr2" pattern="^[ㄱ-ㅎ|가-힣|0-9|\s*]+$" required="required" /></td>
  </tr>
  <tr>
  	<td>상세주소</td>
  	<td><input type="text" name="userAddr3" id="userAddr3" pattern="^[ㄱ-ㅎ|가-힣|0-9|\s*]+$" required="required" /></td>
  </tr>
  <tr>
  	<td>결제방식</td>
  	<td>
  		<input type = "radio" name="card" checked="checked">카드결제
  		<input type = "radio" name="card">핸드폰결제
  	</td>
  </tr>
  <tr>
  	<td>선택</td>
  	<td text-align: left;>
  		<button type="submit" class="order_btn"  onclick="chk(this.form)">주문</button>
   <button type="button" class="cancel_btn" onclick="location.href='/controller'">주문취소</button> 
   </td>
  </tr>
  </div>
 </table>
 </form> 


<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>