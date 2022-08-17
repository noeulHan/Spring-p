<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memUpdate.jsp</title>
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
  	
    // 회원가입폼 체크후 서버로 전송하기
    function fCheck() {
      let regPwd = /(?=.*[0-9a-zA-Z]).{4,24}/;
      let regName = /^[가-힣a-zA-Z]+$/;
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      let regURL = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
      
      let submitFlag = 0;		// 전송체크버튼으로 값이 1이면 체크완료되어 전송처리한다.
    	
    	let pwd = myForm.pwd.value;
    	let name = myForm.name.value;
    	let email1 = myForm.email1.value;
    	let email2 = myForm.email2.value;
      let email = email1 + '@' + email2;
      let tel1 = myForm.tel1.value;
      let tel2 = myForm.tel2.value;
      let tel3 = myForm.tel3.value;
      let tel = myForm.tel1.value + "-" + myForm.tel2.value + "-" + myForm.tel3.value;
    	
    	
    	// 기타 추가로 체크해야 할 항목들을 모두 체크하세요.....
    	if(!regPwd.test(pwd)) {
        alert("비밀번호는 4~24 자리로 작성해주세요.");
        myForm.pwd.focus();
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
        else {
	    	  submitFlag = 1;
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
  		/* 
  		let postcode = myForm.postcode.value + " ";
  		let roadAddress = myForm.roadAddress.value + " ";
  		let detailAddress = myForm.detailAddress.value + " ";
  		let extraAddress = myForm.extraAddress.value + " ";
  		 */
  		let postcode = myForm.postcode.value;
  		let roadAddress = myForm.roadAddress.value;
  		let detailAddress = myForm.detailAddress.value;
  		let extraAddress = myForm.extraAddress.value;
  		myForm.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
  		

  	
    	
  		// 전송전에 모든 체크가 끝나서 submitFlag가 1이되면 서버로 전송한다.
    	if(submitFlag == 1) {
	  			// 묶여진 필드(email/tel)를 폼태그안에 hidden태그의 값으로 저장시켜준다.
	  			myForm.email.value = email;
	  			myForm.tel.value = tel;
	  			
	  			myForm.submit();
    		}
  
    	else {
    		alert("회원가입 실패~~");
    	}
    }
    
  </script>
 <style>
#float1 {
	float: left;
}
#float2 {
	float: left;
}
#float3 {
  clear: both;
}
#div1 {
  border-radius: 20px;
}
#div2 {
  border-radius: 20px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/dbShop/dbMyOrder"><font style="font-size: 14px; color: #aaa;">마이페이지  ></font></a>
	<a href="${ctp}/member/memPwdCheck"><font style="font-size: 14px;">회원정보 수정</font></a>  
</div><br/>
<div style="width: 1500px; margin: 0 auto;" class="text-center">
	<div style="width: 100%;">
		<div class="text-center" id="float1" style="width:20%;"><br/>
		<br/><div style="font-size: 25px; font-family: 'Gantari', sans-serif;"><b>MYPAGE</b></div><br/><br/>
		<div>
			<font style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px;">쇼핑정보</font><br/><br/>
			<a href="${ctp}/dbShop/dbMyOrder"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">주문/배송</font></a><br/><br/>
			<a href="${ctp}/qa3/qaMain5"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">1:1 문의내역</font></a><br/><br/>
			<a href="${ctp}/dbShop/dbMyOrder4"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">이벤트 응모내역</font></a>
		</div><br/><br/><br/><br/>
		<div>
			<font style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px;">회원정보</font><br/><br/>
			<a href="${ctp}/member/memPwdCheck"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">회원정보 수정</font></a><br/><br/>
			<a href="${ctp}/dbShop/dbMyOrder2"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">환불계좌 관리</font></a><br/><br/>
			<a href="${ctp}/dbShop/dbMyOrder3"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">회원 탈퇴</font></a>
		</div>
	</div>
	<div class="float33" id="float2" style="width:80%; height:1000px; padding:30px;">
	<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; font-size: 30px; padding-left: 50px;"><b>회원정보 수정</b></div><br/>
	  <div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; color:#777777; font-size: 20px; padding-left: 50px;">
	  	회원정보
		</div><hr/>
	  <form name="myForm" method="post" action="${ctp}/member/memUpdateOk" enctype="Multipart/form-data">
	  	<table style="font-family: 'Noto Sans KR', sans-serif;">
	  		<tr>
	  			<td width="45%"><b>아이디</b></td>
	  			<td class="text-left">${sMid}</td>
	  		</tr>
	  		<tr><td><br/></td></tr>
	  		<tr>
	  			<td><label for="pwd"><b>비밀번호</b></label></td>
	  			<td><input type="password" class="form-control" id="pwd" name="pwd" value="${sPwd}" required autofocus /></td>
	  		</tr>
	  		<tr><td><br/></td></tr>
	  		<tr>
	  			<td><label for="name"><b>성명</b></label></td>
	  			<td><input type="text" class="form-control" id="name" value="${vo.name}" name="name" required /></td>
	  		</tr>
	  		<tr><td><br/></td></tr>
	  		<tr>
	  			<td><label for="name"><b>생일</b></label></td>
	  			<td><input type="date" class="form-control" id="birthday" value="${fn:substring(vo.birthday,0,10)}" name="birthday" required /></td>
	  		</tr>
	  		<tr><td><br/></td></tr>
	  		<tr>
	  			<td><label for="email1"><b>이메일</b></label></td>
	  			<td>
		  			<div class="input-group mb-3">
						  <c:set var="emails" value="${fn:split(vo.email,'@')}"/>
						  <c:set var="email1" value="${emails[0]}"/>
						  <c:set var="email2" value="${emails[1]}"/>
						  <input type="text" class="form-control" value="${email1}" id="email1" name="email1" required />
						  <div class="input-group-append">
						    <select name="email2" class="custom-select">
							    <option value="naver.com" 	<c:if test="${email2=='naver.com'}">selected</c:if>>naver.com</option>
							    <option value="daum.net"	<c:if test="${email2=='daum.net'}">selected</c:if>>daum.net</option>
							    <option value="gmail.com"		<c:if test="${email2=='gmail.com'}">selected</c:if>>gmail.com</option>
							    <option value="nate.com"		<c:if test="${email2=='nate.com'}">selected</c:if>>nate.com</option>
							    <option value="google.co.kr"		<c:if test="${email2=='google.co.kr'}">selected</c:if>>google.co.kr</option>
							  </select>
						  </div>
						</div>
	  			</td>
	  		</tr>
	  		<tr><td><br/></td></tr>
	  		<tr>
	  			<td style="padding-bottom: 120px;"><span><b>전화번호</b></span></td>
	  			<td>
	  				<c:set var="tel" value="${fn:split(vo.tel,'-')}"/>
						  <c:set var="tel1" value="${tel[0]}"/>
						  <c:set var="tel2" value="${tel[1]}"/>
						  <c:set var="tel3" value="${tel[2]}"/>
				      <select name="tel1" class="custom-select">
						    <option value="010"	${tel1=="010" ? selected : ""}>010</option>
						    <option value="02"	${tel1=="02"  ? selected : ""}>서울</option>
						    <option value="031"	${tel1=="031" ? selected : ""}>경기</option>
						    <option value="032"	${tel1=="032" ? selected : ""}>인천</option>
						    <option value="041"	${tel1=="041" ? selected : ""}>충남</option>
						    <option value="042"	${tel1=="042" ? selected : ""}>대전</option>
						    <option value="043"	${tel1=="043" ? selected : ""}>충북</option>
				        <option value="051"	${tel1=="051" ? selected : ""}>부산</option>
				        <option value="052"	${tel1=="052" ? selected : ""}>울산</option>
				        <option value="061"	${tel1=="061" ? selected : ""}>전북</option>
				        <option value="062"	${tel1=="062" ? selected : ""}>광주</option>
						  </select>-
						  <input type="text" name="tel2" value="${tel2}" size=4 maxlength=4 class="form-control"/>-
		      		<input type="text" name="tel3" value="${tel3}" size=4 maxlength=4 class="form-control"/>
	  			</td>
	  		</tr>
	  		<tr><td><br/></td></tr>
	  		<tr>
	  			<td style="padding-bottom: 70px;"><label for="address"><b>주소</b></label></td>
	  			<td>
						<input type="hidden" name="address" id="address">
						<c:set var="address" value="${fn:split(vo.address,'/')}"/>
					  <c:set var="postcode" value="${address[0]}"/>
					  <c:set var="roadAddress" value="${address[1]}"/>
					  <c:set var="detailAddress" value="${address[2]}"/>
					  <c:set var="extraAddress" value="${address[3]}"/>
						<div class="input-group mb-1">
							<input type="text" name="postcode" id="sample6_postcode" value="${postcode}" placeholder="우편번호" class="form-control">
							<div class="input-group-append">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-secondary">
							</div>
						</div>
						<input type="text" name="roadAddress" id="sample6_address" value="${roadAddress}" size="50" class="form-control mb-1">
						<div class="input-group mb-1">
							<input type="text" name="detailAddress" id="sample6_detailAddress" value="${detailAddress}" class="form-control"> &nbsp;&nbsp;
							<div class="input-group-append">
								<input type="text" name="extraAddress" id="sample6_extraAddress" value="${extraAddress}" class="form-control">
							</div>
						</div>
	  			</td>
	  		</tr>
	  		<tr><td><br/></td></tr>
	  		<tr>
	  			<td style="padding-bottom: 70px;"><label for="content"><b>한줄소개</b></label></td>
	  			<td><textarea rows="4" class="form-control" id="content" name="content">${vo.content}</textarea></td>
	  		</tr>
	  	</table>
	  	<br/>
	    <button type="button" class="btn btn-secondary-outline" style="font-family: 'Noto Sans KR', sans-serif; background-color:#c2935f; color: white; width: 200px; height: 50px;" onclick="fCheck()">회원정보 수정</button><br/>
	    <input type="hidden" name="email"/>
	    <input type="hidden" name="tel"/>
	    <input type="hidden" name="mid" value="${sMid}"/>
	  </form>
  <p><br/></p>
</div>
	</div>
</div>
<div id="float3"></div> 
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>