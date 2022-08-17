<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memIdPwdSearch.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
 <script>
  	'use strict';
  	
  	$(document).ready(function(){
  		$(".titleTab").click(function(){
  			$("#demo").html('');
  		});
  		
  		$("#idTab").click(function(){
  			$("#idEmail").val('');
  		});
  		
  		$("#pwdTab").click(function(){
  			$("#passwordSearch").show();
  			$("#pwdMid").val('');
  			$("#pwdEmail").val('');
  		});
  		
  		$("#noticeTab").click(function(){
  			$("#passwordSearch").hide();
  		});
  	});  	
  	
	// 비밀번호 검색하기
    function pwdSearch() {
    	let mid = $("#pwdMid").val();
    	let email = $("#pwdEmail").val();
    	
    	if(mid == "") {
    		alert("아이디를 입력하세요");
    		$("#pwdMid").focus();
    		return false;
    	}
    	else if(email == "") {
    		alert("이메일 주소를 입력하세요");
    		$("#pwdEmail").focus();
    		return false;
    	}
    	else {
    	  location.href = "${ctp}/member/memIdPwdSearchPOk?mid="+mid+"&toMail="+email;
    	}
    	
    }
    
  	// 신규비밀번호 등록
  	function pwdInputCheck() {
  		let mid = $("#pwdMid").val();
  		let newPwd1 = $("#newPwd1").val();
  		let newPwd2 = $("#newPwd2").val();
  		
  		if(newPwd1.trim() == "") {
  			alert("신규 비밀번호를 입력하세요");
  			$("#newPwd1").focus();
  			return false;
  		}
  		else if(newPwd2.trim() == "") {
  			alert("신규 비밀번호 확인란를 입력하세요");
  			$("#newPwd2").focus();
  			return false;
  		}
  		else if(newPwd1 != newPwd2) {
  			alert("신규비밀번호가 틀립니다. 확인하세요.");
  			$("#newPwd2").focus();
  			return false;
  		}
  		
  		$.ajax({
    		type   : "post",
    		url    : "${ctp}/memPwdUpdate",
    		data   : {
    			mid  : mid,
    			pwd: newPwd1
    		},
    		success: function(data) {
    			if(data == "1") {
    				alert("신규비밀번호가 등록되었습니다.");
    				location.href = "memLogin.mem";
    			}
    			else {
    				alert("신규비밀번호 등록 실패");
    			}
    		},
    		error : function() {
    			alert("전송오류");
    		}
    	});
  	}
</script>
<style>
.icon {
    width: 65px;
    height: 65px; 
    border-radius: 70%;
    overflow: hidden;
    margin : 5px;
    font-family: 'Noto Sans KR', sans-serif;
    }
#join1 {
    border-radius: 10%;
    border:1px solid;
    border-color: #e2e2e2;
    overflow: hidden;
    }
#join2 {
    border-radius: 10%;
    border:1px solid;
    border-color: #e2e2e2;
    overflow: hidden;
    }
#join1:hover {
	box-shadow: 1px 1px 20px #ccc;
	}
#join2:hover {
	box-shadow: 1px 1px 20px #ccc;
	}
	
a { text-decoration:none !important }
a:hover { text-decoration:none !important }

</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" /><br/>
<p><br/></p>
<div class="container borderless" style="width:50%"><br/><br/>
<form>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 35pt; color:black;">비밀번호 재설정</font></div><br/>
   <p style="color: #777777; font-size:19px" class="text-center">
	    <b>회원가입시에 등록하셨던 <u>이메일 주소와 이름</u>을 입력해주세요.</b> <br/><br/>
<br/><br/>
<div  class=text-center style="margin: 50px;">
 <img id="join1" src="${ctp}/images/member/이메일인증.jpg" style="margin-right: 50px;">
</div>
<div class="input-group" style="text-align: right;">
	<input type="text" name="mid" id="pwdMid" style="width:800px; height:60px; font-size:17px;" class="w3-input" placeholder="아이디를 입력하세요."><br/>
	<input type="text" name="email" id="pwdEmail" style="width:800px; height:60px; font-size:17px;" class="w3-input" placeholder="이메일 주소를 입력하세요.">
	<input type="button" id="passwordBtn" value="비밀번호 찾기" onclick="pwdSearch()" class="btn btn-outline-secondary input-group-append m-1"/>
</div><br/>
<ul style="color: #aaaaaa;">
	<li>이메일 주소로 새로운 임시 비밀번호가 전송됩니다.</li>
</ul>
<br/><br/>
<div class="text-right" style="font-family: 'Noto Sans KR', sans-serif; font-size: 11pt; color: #777777;">
	<span class="col"><a href="memLogin.mem">돌아가기</a> | <a href="${ctp}/member/memIdPwdSearch">아이디 찾기</a></span>
</div>
<br/><br/><br/>
</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>