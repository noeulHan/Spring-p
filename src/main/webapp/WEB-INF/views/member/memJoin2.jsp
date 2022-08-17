<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memJoin2.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <script>
  	'use strict';
  	let idCheckSw = 0;
  	let nickCheckSw = 0;
  	
    // 회원가입폼 체크후 서버로 전송하기
    function fCheck() {
    	let regMid = /^[a-z0-9_]{4,20}$/;
      let regPwd = /(?=.*[a-zA-Z])(?=.*?[#?!@$%^&*-]).{6,24}/;
      let regNickName = /^[가-힣]+$/;
      let regName = /^[가-힣a-zA-Z]+$/;
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      let regURL = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
      
      let submitFlag = 0;		// 전송체크버튼으로 값이 1이면 체크완료되어 전송처리한다.
    	
    	let mid = myForm.mid.value;
    	let email1 = myForm.email1.value;
    	let email2 = myForm.email2.value;
      let email = email1 + '@' + email2;
    	let pwd = myForm.pwd.value;
			let pwd1 = myForm.pwd1.value;
    	let name = myForm.name.value;
      let tel1 = myForm.tel1.value;
      let tel2 = myForm.tel2.value;
      let tel3 = myForm.tel3.value;
      let tel = myForm.tel1.value + "-" + myForm.tel2.value + "-" + myForm.tel3.value;
     
    	if(!regMid.test(mid)) {
        alert("아이디는 영문 소문자와 숫자, 언더바(_)만 사용가능합니다.(길이는 4~20자리까지 허용)");
        myForm.mid.focus();
        return false;
      }
    	
    	if (pwd == "") {
    		alert("비밀번호를 입력하세요.");
    		myForm.pwd1.focus();
    		return false;
    	}
    	else if (pwd1 == "") {
    		alert("재확인 할 비밀번호를 입력하세요.");
    		myForm.pwd1.focus();
    		return false;
    	}
    	else if(pwd != pwd1) {
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
				myForm.pwd.focus();
				 if(!regPwd.test(pwd)) {
	        alert("비밀번호는 1개이상의 문자와 특수문자 조합의 6~24 자리로 작성해주세요.");
	        myForm.pwd.focus();
	        return false;
	     }
				 return false;
    	}		 
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myForm.name.focus();
        return false;
      }
      else if(!regEmail.test(email)) {
          alert("이메일 형식에 맞지않습니다.");
          myForm.email1.focus();
          return false;
        }
      else if(tel2 == "" || tel3 == "") {
    	  alert("전화번호를 입력하세요");
    	  return false;
      }
    	
      if(tel2 != "" || tel3 != "") {
	      if(!regTel.test(tel)) {
	        alert("전화번호 형식에 맞지않습니다.(000-0000-0000)");
	        myForm.tel2.focus();
	        return false;
	      }
	      
	      else {
	    	  submitFlag = 1;
	      }
      }
    	
   // 전송전에 '주소'를 하나로 묶어서 전송처리 준비한다.
		let postcode = myForm.postcode.value + "";
		let roadAddress = myForm.roadAddress.value + "";
		let detailAddress = myForm.detailAddress.value + "";
		let extraAddress = myForm.extraAddress.value + "";
		myForm.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
      
  		// 전송전에 모든 체크가 끝나서 submitFlag가 1이되면 서버로 전송한다.
    	if(submitFlag == 1) {
    		if(idCheckSw == 0) {
    			alert("아이디 중복체크버튼을 눌러주세요.");
    		}
    		else {
	  			// 묶여진 필드(tel)를 폼태그안에 hidden태그의 값으로 저장시켜준다.
	  			myForm.tel.value = tel;
	  			myForm.email.value = email;
	  			
	  			myForm.submit();
    		}
    	}
    	else {
    		alert("회원가입 실패");
    	}
    }
    
    // id중복체크
    function idCheck() {
    	let mid = $("#mid").val();
    	if(mid == "" || $("#mid").val().length<4 || $("#mid").val().length>=20) {
    		alert("아이디를 정확히 입력해주세요.");
    		myForm.mid.focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/member/memIdCheck",
    		data : {mid : mid},
    		success:function(res) {
    			if(res == "1") {
    				alert("이미 사용중인 아이디 입니다.");
    				$("#mid").focus();
    			}
    			else {
    				alert("사용 가능한 아이디 입니다.");
    				idCheckSw = 1;	// 아이디 검색버튼을 클릭한 경우는 idCheckSw는 1이다.
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
	    
	 .find-btn{
			text-align: center;
		}
		.find-btn1{
			display :inline-block;
		}
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="container borderless" style="width:50%"><br/><br/>
<form name="myForm" method="post" action="${ctp}/member/memJoin3"><br/><br/>
	  <div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 35pt; color:black;">통합회원가입</font></div><br/>
	     <p style="color: #777777; font-size:19px" class="text-center">
	     <b>간편하게 신규가입하고 다양한 혜택을 누려보세요!</b><br/>
				<font style="font-size: 15px"> ! <font color="#d42c2c">*</font>표시는 필수입력입니다.</font>
			</p><br/>
	   <div>
	 	<table style="margin-left: auto; margin-right: auto;">
		<tr>
				<td id="1" class="text-center">
						<img class="icon" src="${ctp}/images/member/유저아이콘.jpg" style="margin-right: 100px;"><br/>
						<span><font style="color: #777777; margin-right: 100px;">가입방법</font></span><br/>
				</td>
				<td id="2" class="text-center">
		      	<img class="icon" src="${ctp}/images/member/연필아이콘1.jpg" style="margin-right: 100px;" width="100%"><br/>
		        <strong><font style="margin-right: 100px;">정보입력</font></strong>
				</td>
				<td id="3" class="text-center">
		      	<img class="icon" src="${ctp}/images/member/숫자아이콘3.jpg"><br/>
		        <span><font style="color: #777777;">가입완료</font></span>
				</td>
			</tr>
		</table>
		</div>
		<br/><br/><br/>
	    <div class="form-group">
		    <div class="form-group">
	    	<div class="text-left"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 17pt; color:black;">회원정보</font></div><br/>
	      <label for="name"><b>성명  </b><font color="#d42c2c">*</font></label>
	      <input type="text" style="height:60px;font-size:17px;" class="w3-input" id="name" placeholder="성명을 입력하세요." name="name" required autofocus />
	   	 </div>
	     <div class="form-group">
	      <span for="birthday"><b>생일  </b><font color="#d42c2c">*</font></span>
	      <c:set var="now" value="<%=new java.util.Date() %>"/>
	      <fmt:formatDate var="birthday" value="${now}" pattern="yyyy-MM-dd"/>
	    </div>
			<div class="form-group">
				<input type="date" name="birthday" value="${birthday}" class="form-control w3-input"/>
	    </div>
	     <div class="form-group w3-input">
	      <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text"><b>전화번호 </b><font color="#c81e1e" class="font-weight-bold">*</font></span> &nbsp;&nbsp;
				      <select name="tel1" class="custom-select">
						    <option value="010" selected>010</option>
						    <option value="02">서울</option>
						    <option value="031">경기</option>
						    <option value="032">인천</option>
						    <option value="041">충남</option>
						    <option value="042">대전</option>
						    <option value="043">충북</option>
				        <option value="051">부산</option>
				        <option value="052">울산</option>
				        <option value="061">전북</option>
				        <option value="062">광주</option>
						  </select>-
		      </div>
		      <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
		      <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
		    </div> 
	    </div><br/><br/>
	    <div class="text-left"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 17pt; color:black;">개인정보입력</font></div><br/>
	      <label for="mid"><b>아이디  </b><font color="#d42c2c">*</font>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	      <input type="button" value="아이디 중복체크" class="btn btn-outline-secondary btn-sm" onclick="idCheck()"/></label>
	      <input type="text" style="height:60px;font-size:17px;" class="w3-input input-sm" name="mid" id="mid" placeholder="아이디를 입력하세요."/>
	      <ul style="color: #bfbdbd; font-size: 10pt;">
		    	<li>아이디는 4~20자리 영문 소문자와 숫자, 언더바(_)만 사용가능합니다.</li>
		    </ul>
	    </div>
	    <div class="form-group">
	      <label for="pwd"><b>비밀번호  </b><font color="#d42c2c">*</font></label>
	      <input type="password" style="height:60px;font-size:17px;" class="w3-input" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
	      <ul style="color: #bfbdbd; font-size: 10pt;">
		    	<li>비밀번호는 1개이상의 문자와 특수문자 조합의 6~24 자리로 작성해주세요.</li>
		    </ul>
	    </div>
	    <div class="form-group">
	      <label for="pwd"><b>비밀번호 확인  </b><font color="#d42c2c">*</font></label>
	      <input type="password" style="height:60px;font-size:17px;" class="w3-input" id="pwd1" placeholder="다시 비밀번호를 입력하세요." name="pwd1" required />
	    </div>
	   
	     <div class="form-group">
      <label for="email1"><b>이메일  </b><font color="#d42c2c">*</font></label>
				<div class="input-group mb-3">
				  <input type="text" class="w3-input" style="width:750px;height:60px;font-size:17px;" placeholder="Email을 입력하세요." id="email1" name="email1" required />
				  <div class="input-group-append">
				    <select name="email2" class="custom-select">
					    <option value="naver.com" selected>naver.com</option>
					    <option value="daum.net">daum.net</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value="nate.com">nate.com</option>
					    <option value="google.co.kr">google.co.kr</option>
					  </select>
				  </div>
				</div>
	  </div>
	   
	     <div class="form-group w3-input">
      <label for="address"><b>주소  </b><font color="#d42c2c">*</font></label>
			<div class="input-group mb-3">
				<input type="text" name="postcode" id="sample6_postcode" style="width:300px;height:60px;font-size:17px;" placeholder="우편번호" class="form-control w3-input">
				<div class="input-group-append">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-secondary"/>
				</div>
			</div>
			<input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" style="height:60px;font-size:17px;" class="form-control w3-input mb-1">
			<div class="input-group mb-1">
				<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" style="height:60px;font-size:17px;" class="form-control w3-input"> &nbsp;&nbsp;
				<div class="input-group-append">
					<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" style="height:60px;font-size:17px;" class="form-control w3-input">
				</div><br/>
			</div>
    </div><br/>
   <div class="text-left"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 17pt; color:black;">선택입력사항</font></div><br/>
	    <div class="form-group w3-input">
	      <label for="content"><b>한줄소개</b></label>
	      <textarea rows="5" class="form-control" id="content" name="content" placeholder="자기소개를 입력하세요."></textarea>
	    </div><br/><br/>
	    <div class="find-btn">
		    <button type="reset" id="button1" class="btn btn-outline-secondary navbar-btn find-btn1" style="WIDTH: 150pt; HEIGHT: 50pt; font-family: 'Noto Sans KR', sans-serif;">다시입력</button>&nbsp;&nbsp;&nbsp;&nbsp;
		    <button type="button" id="button2" class="btn navbar-btn find-btn1" onclick="fCheck()" style="WIDTH: 150pt; HEIGHT: 50pt; background-color: #97a0d9; color: white;font-family: 'Noto Sans KR', sans-serif;">회원가입</button>
			</div>
	    <input type="hidden" name="tel"/>
	    <input type="hidden" name="email"/>
	    <input type="hidden" name="address"/>
	  </form>
  </div>
  <br/>
  <p><br/></p>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>