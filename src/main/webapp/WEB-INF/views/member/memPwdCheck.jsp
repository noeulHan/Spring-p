<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memPwdCheck.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
  <form method="post" style="font-family: 'Noto Sans KR', sans-serif;">
    <div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; font-size: 30px; padding-left: 50px;"><b>회원정보 수정</b></div><br/>
		  <div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; color:#777777; font-size: 20px; padding-left: 50px;">
		  	회원님의 소중한 개인정보 보호를 위해<br/>
				비밀번호를 다시 한번 입력해주시기 바랍니다.
			</div><br/><br/><br/><br/>
	    <table class="table table-border">
	      <tr>
	        <th>비밀번호</th>
	        <td><input type="password" name="pwd" autofocus class="form-control" placeholder="비밀번호를 입력해주세요." required /></td>
	      </tr>
	      <tr>
	        <td colspan="2" class="text-center">
	        	<br/><br/><input type="submit" class="btn btn-secondary-outline" style="font-family: 'Noto Sans KR', sans-serif; background-color:#c2935f; color: white; width: 200px; height: 50px;" value="확 인">
	        </td>
	      </tr>
	    </table>
  </form>
</div>
<p><br/></p>
</div>
</div>
<div id="float3"></div> 
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>