<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>paymentResult.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script>
	  function nWin(orderIdx) {
	  	var url = "${contextPath}/dbShop/dbOrderBaesong?orderIdx="+orderIdx;
	  	window.open(url,"dbOrderBaesong","width=350px,height=400px");
	  }
  </script>
	<style>
	td, th {padding: 5px}
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />>
<p><br></p>
<div class="container" style="width: 1000px;">
  <div>결제내역</div>
  <hr/>
  <p>주문 물품명 : ${sPayMentVo.name}</p>
  <p>주문금액 : ${sPayMentVo.amount}(실제구매금액:${orderTotalPrice})</p>
  <p>주문자 메일주소 : ${sPayMentVo.buyer_email}</p>
  <p>주문자 성명 : ${sPayMentVo.buyer_name}</p>
  <p>주문자 전화번호 : ${sPayMentVo.buyer_tel}</p>
  <p>주문자 주소 : ${sPayMentVo.buyer_addr}</p>
  <p>주문자 우편번호 : ${sPayMentVo.buyer_postcode}</p>
  <p>결제 고유ID : ${sPayMentVo.imp_uid}</p>
  <p>결제 상점 거래 ID : ${sPayMentVo.merchant_uid}</p>
  <p>결제 금액 : ${sPayMentVo.paid_amount}</p>
  <p>카드 승인번호 : ${sPayMentVo.apply_num}</p>
  <hr/>
  <h2>주문완료</h2>
  <hr/>
  <table class="table table-bordered">
    <tr style="text-align:center;background-color:#ccc;">
      <th>상품이미지</th>
      <th>주문일시</th>
      <th>주문내역</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${sOrderVos}">
      <tr>
        <td style="text-align:center;">
          <img src="${ctp}/dbShop/product/${vo.thumbImg}" width="100px"/>
        </td>
        <td style="text-align:center;"><br/>
          <p>주문번호 : ${vo.orderIdx}</p>
          <p>총 주문액 : <fmt:formatNumber value="${vo.totalPrice}"/>원</p>
          <p><input type="button" value="배송지정보" onclick="nWin('${vo.orderIdx}')"></p>
        </td>
        <td align="left">
	        <p><br/>모델명 : <span style="color:orange;font-weight:bold;">${vo.productName}</span><br/> &nbsp; &nbsp; <fmt:formatNumber value="${vo.mainPrice}"/>원</p><br/>
	        <c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
	        <c:set var="optionPrices" value="${fn:split(vo.optionPrice,',')}"/>
	        <c:set var="optionNums" value="${fn:split(vo.optionNum,',')}"/>
	        <p>
	          - 주문 내역
	          <c:if test="${fn:length(optionNames) > 1}">(옵션 ${fn:length(optionNames)-1}개 포함)</c:if><br/>
	          <c:forEach var="i" begin="1" end="${fn:length(optionNames)}">
	            &nbsp; &nbsp; ㆍ ${optionNames[i-1]} / <fmt:formatNumber value="${optionPrices[i-1]}"/>원 / ${optionNums[i-1]}개<br/>
	          </c:forEach> 
	        </p>
	      </td>
        <td style="text-align:center;"><br/>결제완료<br/>(배송준비중)</td>
      </tr>
    </c:forEach>
  </table>
  <hr/>
  <meta http-equiv="refresh" content="3;url=${ctp}/dbShop/dbCartList">
	<div class="text-center">
	<img src="${ctp}/images/member/축하.jpg" width="50%"/></div>
	<div class="text-center">
  <div class="spinner-border text-muted"></div><br/>
  <font style="color: #aaa; font-size: 15px; font-family: 'Noto Sans KR', sans-serif;">3초 후 장바구니 창으로 자동 이동합니다.</font></div><br/>
  <p class="text-center"><a href="${ctp}/dbShop/dbProductList" class="btn btn-secondary">계속쇼핑하기</a> &nbsp;
    <a href="${ctp}/dbShop/dbMyOrder" class="btn btn-secondary">구매내역보기</a>
  </p>
  <hr/>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>