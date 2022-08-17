<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memMain.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
  <script>
    // 배송지 정보보기
    function nWin(orderIdx) {
    	var url = "${ctp}/dbShop/dbOrderBaesong?orderIdx="+orderIdx;
    	window.open(url,"dbOrderBaesong","width=390px,height=430px");
    }
    
    $(document).ready(function() {
    	// 주문 상태별 조회 : 전체/결제완료/배송중~~
    	$("#orderStatus").change(function() {
	    	var orderStatus = $(this).val();
	    	location.href="${ctp}/dbShop/orderStatus?orderStatus="+orderStatus+"&pag=${pageVo.pag}";
    	});
    });
    
    // 날짜별 주문 조건 조회(오늘/일주일이내/보름이내~~)
    function orderCondition(conditionDate) {
    	location.href="${ctp}/dbShop/orderCondition?conditionDate="+conditionDate+"&pag=${pageVo.pag}";
    }
    
    // 날찌기간에 따른 조건검색
    function myOrderStatus() {
    	var startDateJumun = new Date(document.getElementById("startJumun").value);
    	var endDateJumun = new Date(document.getElementById("endJumun").value);
    	var conditionOrderStatus = document.getElementById("conditionOrderStatus").value;
    	
    	if((startDateJumun - endDateJumun) > 0) {
    		alert("주문일자를 확인하세요!");
    		return false;
    	}
    	
    	startJumun = moment(startDateJumun).format("YYYY-MM-DD");
    	endJumun = moment(endDateJumun).format("YYYY-MM-DD");
    	location.href="${ctp}/dbShop/myOrderStatus?startJumun="+startJumun+"&endJumun="+endJumun+"&conditionOrderStatus="+conditionOrderStatus+"&pag=${pageVo.pag}";
    }
  </script>
  <script>
	  function memDeleteCheck() {
		  let ans = confirm("탈퇴 하시겠습니까? 확인을 누르시면 바로 탈퇴처리 됩니다.");
		  if(!ans) return false;
		  else location.href = "${ctp}/member/memDeleteOk";
	  }
	</script>
  
  <style>
    #leftHistory {
      float: left;
      width: 50%;
    }
    #leftHistory {
      float: right;
      width: 50%;
    }
    #clearHistory {
      clear: both;
    }
  </style>
  <style>
	.profile {
	    width: 140px;
	    height: 140px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin : 20px;
	    }
	    
	.profile1 {
	    width: 50px;
	    height: 50px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin : 5px;
	    }
	    
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
	<a href="${ctp}/dbShop/dbMyOrder3"><font style="font-size: 14px;">회원 탈퇴</font></a>  
</div><br/>
<div style="width: 1500px; margin: 0 auto;" class="text-center">
 	<div style="width: 100%;">
		<div class="text-center" id="float1" style="width:20%; height:1000px;"><br/><br/>
			<div style="font-size: 25px; font-family: 'Gantari', sans-serif;"><b>MYPAGE</b></div><br/><br/>
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
		<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; font-size: 30px; padding-left: 50px;"><b>회원 탈퇴</b></div><br/>
		  <div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; color:#777777; font-size: 20px; padding-left: 50px;">
		  	그동안 E패션몰을 이용해 주셔서 대단히 감사합니다.
			</div><br/><br/><br/><br/><br/><br/><br/>
			<button class="btn btn-secondary-outline" style="font-family: 'Noto Sans KR', sans-serif; background-color:#c2935f; color: white; width: 200px; height: 50px;" onclick="memDeleteCheck()">회원 탈퇴</button>
		</div>
	</div>
</div>
<div id="float3"></div> 
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>