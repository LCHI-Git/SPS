<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="/resources/js/IdCheckForm.js" />"></script>
<title>아이디 중복 체크</title>

<style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }       
        #chk{
            text-align :center;
        }       
		

</style>
   
</head>
<body onload="getPId()">

<div id="wrap">
    <br>
    <b><font size="4" color="gray">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm">
            <input type="text" name="userId" id="userId">
            <input type="button" value="중복확인" onclick="IdCheck()">
        </form>
        <div id="msg"></div>
        <br>
        <input id="cancelBtn" type="button" value="취소" onclick="window.close()">
        <input id="useBtn" type="button" value="사용하기" onclick="sendValue()">
    </div>
</div>  

<script>
//var k = document.getElementById("OverChk");
let error = '${OverChk}';
	if(error=="Overlapped"){
	document.getElementById("useBtn").style.visibility='hidden';
	msg.innerHTML ="이미 사용중인 ID입니다.";
	//$("#cancleBtn").css('visibility', 'visible');
	//$("#useBtn").css('visibility', 'hidden');
	
}  else if(error=="notOverlapped"){
	document.getElementById("useBtn").style.visibility='visible';
	msg.innerHTML="사용 가능한 아이디입니다.";
	//$("#cancleBtn").css('visibility', 'hidden');
	//$("#useBtn").css('visibility', 'visible');
	
} else if(error=="notOverlap1"){
	document.getElementById("useBtn").style.visibility='hidden';
	msg.innerHTML="";
}
	
function sendValue(){
	opener.document.loginForm.IdDuplication.value="idCheck";
	opener.document.loginForm.id.value = document.getElementById("userId").value;
		
	opener.chkForm = null;
	self.close();
	return true;
	}
function IdCheck(){
	
	var userId = document.getElementById("userId").value;
	
	if(!userId){
		alert("아이디를 입력하지 않았습니다.");
		return false;
	} else if((userId<"0" || userId > "9") && (userId <"A" || userId >"Z") && (userId<"a"|| userId>"z")){
		alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
		return false;
	}
	
	window.location.href='IdOverlapChk?userId='+userId;
	return true;
}
function getPId(){
	
	document.getElementById("userId").value = opener.document.loginForm.id.value;
	
		return true;
	
}
</script>  
</body>
</html>
</body>
</html>