<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>paymentOk.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		IMP.init('imp50517039');
		
		IMP.request_pay({
		    pg : 'html5_inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${payMentVo.name}',
		    amount : ${payMentVo.amount}, //판매 가격
		    buyer_email : '${payMentVo.buyer_email}',
		    buyer_name : '${payMentVo.buyer_name}',
		    buyer_tel : '${payMentVo.buyer_tel}',
		    buyer_addr : '${payMentVo.buyer_addr}',
		    buyer_postcode : '${payMentVo.buyer_postcode}'
		}, function(rsp) {
			  var paySw = 'no';
		    if ( rsp.success ) {
		        paySw = 'yes';
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
				    alert(msg);
		    }
		    if(paySw == 'no') {
		    	location.href='${ctp}/';
		    }
		    else {
					var temp = "";
					temp += '?name=${payMentVo.name}';
					temp += '&amount=${payMentVo.amount}';
					temp += '&buyer_email=${payMentVo.buyer_email}';
					temp += '&buyer_name=${payMentVo.buyer_name}';
					temp += '&buyer_tel=${payMentVo.buyer_tel}';
					temp += '&buyer_addr=${payMentVo.buyer_addr}';
					temp += '&buyer_postcode=${payMentVo.buyer_postcode}';
					temp += '&imp_uid=' + rsp.imp_uid;
					temp += '&merchant_uid=' + rsp.merchant_uid;
					temp += '&paid_amount=' + rsp.paid_amount;
					temp += '&apply_num=' + rsp.apply_num;
					
					//temp += '&orderIdx=${orderVo.orderIdx}';
					
					location.href='${ctp}/dbShop/paymentResult'+temp;
		    }
		});
	</script>
	  <style>
  	body{
  		font-family: 'Noto Sans KR', sans-serif;
  	}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br></p>
<div class="text-center" style="padding:0px 300px; height: 1000px; margin: 0px auto;">
  <div style="padding-top: 200px;">현재 결제가 진행중입니다.</div><br/><br/>
  <div class="spinner-border text-muted"></div>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>