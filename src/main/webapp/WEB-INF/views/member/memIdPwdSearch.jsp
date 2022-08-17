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
  	
   // 아이디 검색하기
   function idSearch() {
      let email = $("#idEmail").val();
      
      if(email == "") {
         alert("이메일 주소를 입력하세요");
         $("#idEmail").focus();
         return false;
      }
      
      $.ajax({
         type   : "post",
          url    : "${ctp}/member/memIdSearchOk", 
         data   : {email : email},
         success: function(data) {
            if(data == "") {
               alert("등록된 자료가 없습니다.");
               document.getElementById('demo').innerHTML="";
            }
            else {
               alert("일치하는 정보의 아이디는 "+data+" 입니다.");
               document.getElementById('demo').innerHTML="찾으시는 아이디는 <font color='blue'><b>"+data+"</b></font> 입니다.";

            }
         },
         error : function() {
            alert("전송오류~~");
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
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 35pt; color:black;">아이디 찾기</font></div><br/>
   <p style="color: #777777; font-size:19px" class="text-center">
	    <b>회원가입시에 등록하셨던 <u>이메일 주소</u>를 입력해주세요.</b> <br/><br/>
<br/><br/>
<div  class=text-center style="margin: 50px;">
 <img id="join1" src="${ctp}/images/member/이메일인증.jpg" style="margin-right: 50px;">
</div>
<div class="input-group" style="text-align: right;">
	<input type="text" name="email" id="idEmail" style="width:800px; height:60px; font-size:17px;" class="w3-input" placeholder="이메일 주소를 입력하세요.">
	<input type="button" value="아이디 찾기" onclick="idSearch()" class="btn btn-outline-secondary input-group-append m-1"/>
</div> 
<br/><br/>

<div class="text-right" style="font-family: 'Noto Sans KR', sans-serif; font-size: 11pt; color: #777777;">
	<span class="col"><a href="memLogin.mem">돌아가기</a> | <a href="${ctp}/member/memIdPwdSearchP">비밀번호 찾기</a></span>
</div>
<br/><br/><br/>
</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>