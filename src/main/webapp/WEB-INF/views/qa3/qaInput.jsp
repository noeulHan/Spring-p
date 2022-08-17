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
    function fCheck() {
    	var title = myform.title.value;
    	var content = myform.content.value;
    	var ansOK = myform.ansOK.value;
    	
    	if(title=="") {
    		alert("글제목을 입력하세요");
    		myform.title.focus();
    	}
    	else if(content=="") {
    		alert("글내용을 입력하세요");
    		myform.content.focus();
    	}
    	else {
    		myform.submit();
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
	<a href="${ctp}/qa3/qaMain5"><font style="font-size: 14px;">1:1 문의내역</font></a>  
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
	<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; font-size: 30px; padding-left: 50px;"><b>1:1 문의등록</b></div><br/><br/>
	<form name="myform" method="post">
	  <table class="table" style="border:0px solid; font-family:'Noto Sans KR', sans-serif;">
	    <tr style="height: 50px; margin: 0 auto;">
	      <th style="padding: 50px 0px 28px 0px;" width="15%">문의 유형</th>
	      <td style="padding: 50px 0px 28px 0px;" width="40%">
	      <div class="input-group-append">
					<select name="caseone" class="custom-select">
					  <option value="반품">반품</option>
					  <option value="교환">교환</option>
					  <option value="수정/취소">수정/취소</option>
					  <option value="배송">배송</option>
					  <option value="상품문의">상품문의</option>
					  <option value="회원혜택">회원혜택</option>
					  <option value="회원정보">회원정보</option>
					  <option value="주문/결제">주문/결제</option>
					  <option value="A/S">A/S</option>
					  <option value="모바일/APP">모바일/APP</option>
					  <option value="환불">환불</option>
					  <option value="기타">기타</option>
					</select>
				</div>
				</td>
				<td width="20%"></td>
	    </tr>
	    <tr>
	      <th style="padding: 28px 0px;">이메일</th>
	      <td style="padding: 28px 0px;"><input type="text" name="email" value="${email}" size="60" class="form-control" required/></td>
	    </tr>
	    <tr>
	      <th style="padding: 28px 0px;">문의 제목</th>
	      <td style="padding: 28px 0px;"><input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control" autofocus required /></td>
	    </tr>
	    <tr>
	      <th style="padding: 28px 0px;">문의 내용</th>
	      <td style="padding: 28px 0px;"><textarea rows="6" name="content" id="CKEDITOR" class="form-control" required></textarea></td>
	    </tr>
	    <tr>
	      <th style="padding: 28px 0px;">답변 알림 수신</th>
	      <td style="padding: 28px 0px;" class="text-left">&emsp;
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="ansOK" value="0" checked/>E-mail 수신 거부
				  </label>&emsp;&emsp;
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="ansOK" value="1"/>E-mail 수신 동의
				  </label>
	      </td>
	    </tr>
			<tr>
				<td colspan="2"><br/>
			    <ul class="text-left" style="color: #777777; font-family: 'Noto Sans KR', sans-serif; font-size: 14px; padding-left: 70px;">
					  <li style="margin-bottom: 10px;">정확한 답변 수신을 위해 문의 전에 회원정보를 업데이트 해주세요. (MY PAGE > 회원정보 > 회원정보 수정)</li>
					 	<li style="margin-bottom: 10px;">등록하신 문의에 답변이 완료된 경우 재문의가 불가하오니 서비스 이용에 참고 부탁드립니다.</li>
					</ul><br/><br/>
				</td>
			</tr>
	    <tr>
	      <td colspan="2" class="text-center" style="padding: 28px 0px;">
	        <input type="button" style="font-family: 'Noto Sans KR', sans-serif; width: 200px; height: 50px;" value="취소" onclick="location.href='${ctp}/qa3/qaMain5';" class="btn btn-dark"/>&nbsp;
	        <input type="button" class="btn btn-secondary-outline" style="font-family: 'Noto Sans KR', sans-serif; background-color:#c2935f; color: white; width: 200px; height: 50px;" value="등록" onclick="fCheck()"/>
	      </td>
	    </tr>
	  </table>
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