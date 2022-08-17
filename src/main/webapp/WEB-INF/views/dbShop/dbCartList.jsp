<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbCartList</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
  <script>
    'use strict'
    function cartReset() {
    	let ans = confirm("주문을 취소하시겠습니까?");
    	if(ans) location.href = "cartReset";
    }
  </script>
   <script>
    'use strict';
    
    // 체크박스를 선택/해제시에 호출되어 계산(재계산)처리하는 함수이다.
    // 체크된 박스의 개별 상품합계금액을 total변수에 누적처리후 #total아이디에 콤마처리후 출력시켜주고 있다.
    // 또한, total변수값이 50000원이 넘거나, 선택한 상품이 없으면 배송비는 0이다. 그렇지 않으면 2500원의 배송비가 붙는다. 
    function onTotal(){
      let total = 0;
      let maxIdx = document.getElementById("maxIdx").value;
      for(let i=1;i<=maxIdx;i++){
        if($("#totalPrice"+i).length != 0 && document.getElementById("idx"+i).checked){  
          total = total + parseInt(document.getElementById("totalPrice"+i).value); 
        }
      }
      document.getElementById("total").value=numberWithCommas(total);
      
      if(total>=80000||total==0){
        document.getElementById("baesong").value=0;
      } else {
        document.getElementById("baesong").value=2500;
      }
      let lastPrice=parseInt(document.getElementById("baesong").value)+total;		// lastPrice는 배송비를 합산해준 총주문금액변수이다.
      document.getElementById("lastPrice").value = numberWithCommas(lastPrice);  // 화면에 보여주는 주문 총금액(콤마처리했다.)
      document.getElementById("orderTotalPrice").value = numberWithCommas(lastPrice);  // 값을 넘겨주는 '주문 총 금액'변수(orderTotalPrice) : 콤마처리하지 않았다. 정수값으로 넘겨야 400에러 막는다.
    }

    /* 상품을 선택하였을때 모든 상품이 선택되었다면 all체크버튼을 true로 만들고자 한다.
    	 예를들어서, 2개의 상품이 있을때 2번짹상품 1개만 선택했다면, 1번째상품은 #idx+i의 길이가 아니지만 체크되지않아서 false를 만족하므로 cnt가 1이 증가한다.
    	 즉, cnt가 0이 아닐경우는 여러상품중에서 선택하지 않은 상품이 있다는 것이다. 따라서 모든 상품이 선택되어 있다면 #idx+i의 길이가 0이 아니면서 true이므로 cnt는 처음값인 0을 가지게 된다. 따라서 51번행을 수행하기에 all체크버튼을 켜주게 된다.
    */
    function onCheck(){
      let maxIdx = document.getElementById("maxIdx").value;

      let cnt=0;
      for(let i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked==false){
          cnt++;
          break;
        }
      }
      if(cnt!=0){
        document.getElementById("allcheck").checked=false;
      } 
      else {
        document.getElementById("allcheck").checked=true;
      }
      onTotal();		/* 상품을 선택/취소했을때 수행하기에 다시 재개산(onTotal())처리한다. */
    }
    
    // all체크버튼을 클릭하면 모든 상품에 대하여 check버튼을 true 또는 false로 만들고 있다.
    function allCheck(){
      let maxIdx = document.getElementById("maxIdx").value;
      if(document.getElementById("allcheck").checked){
        for(let i=1;i<=maxIdx;i++){
          if($("#idx"+i).length != 0){
            document.getElementById("idx"+i).checked=true;
          }
        }
      }
      else {
        for(let i=1;i<=maxIdx;i++){
          if($("#idx"+i).length != 0){
            document.getElementById("idx"+i).checked=false;
          }
        }
      }
      onTotal();	/* 다시 재계산한다. */
    }
    
    // cart에 들어있는 개별 품목 삭제하기
    function cartDelete(idx){
    	/* 
    	if(!document.getElementById("idx"+idx).checked) {
    		alert("현재 상품을 삭제하시려면 현상품의 체크박스에 체크해주세요.");
    		return false;
    	}
    	 */
      let ans = confirm("선택하신 상품을 장바구니에서 제거 하시겠습니까?");
      if(!ans) return false;
      
      $.ajax({
        type : "post",
        url  : "${ctp}/dbShop/dbCartDelete",
        data : {idx : idx},
        success:function() {
          location.reload();
        },
        error : function() {
        	alert("전송에러!");
        }
      });
    }
    
    // 주문하기 버튼을 클릭할때 수행한다.
    function order(){
      //구매하기위해 체크한 장바구니에만 아이디가 check상태인 필드의 값을 1로 셋팅(체크박스가 1인것, 즉 true값인것만 넘어가게된다.). 체크하지 않은것은 check아이디필드의 기본값은 0이다.
      let maxIdx = document.getElementById("maxIdx").value;
      for(let i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked){	// 구매한 상품이면 true이다.
          document.getElementById("checkItem"+i).value="1";
        }
      }
      //배송비넘기기(배송비만 따로 넘기고자한다면 아래내용을 적어준다.)
      document.myForm.baesong.value=document.getElementById("baesong").value;
      
      if(document.getElementById("lastPrice").value==0){		// 계산된 최종금액이 0원이면 주문할수 없다.
        alert("장바구니에서 주문처리할 상품을 선택해주세요!");
        return false;
      } 
      else {
        document.myForm.submit();
      }
    }
    
    // 천단위마다 쉼표 표시하는 함수
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
  </script>
  
<style>
  .totSubBox {
    background-color:#ddd;
    border : none;
    width : 95px;
    text-align : center;
    font-weight: bold;
    padding : 5 0px;
    color : brown;
  }
  
  td {
    padding : 5px;
  }
  
  body {
   font-family: 'Noto Sans KR', sans-serif;
  }
  
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/dbShop/dbCartList"><font style="font-size: 14px; font-family: 'Noto Sans KR', sans-serif;">장바구니</font></a>  
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25pt; color:black;">장바구니</font></div><br/>
<div style="padding-left: 350px; padding-right: 350px; margin-bottom: 0px;">
	<hr style="padding-left: 350px; padding-right: 350px; margin-bottom: 0px; border-top: 1px solid; background: transparent;" class="text-center"><br/>
</div>
<form name="myForm" method="post">
		<table class="borderless text-center" style="font-family: 'Noto Sans KR', sans-serif; color:#414141; font-size:11pt; margin: auto; width:60%">
		  <tr>
		    <th><input type="checkbox" id="allcheck" onClick="allCheck()" class="m-2"/></th>
		    <th colspan="2" width="50%">상품정보</th>
		    <th colspan="2" width="20%">총상품금액</th>
		    <th colspan="2">선택</th>
		  </tr>
		  <!-- 장바구니 목록출력 -->
		  <c:set var="maxIdx" value="0"/>
		  <c:forEach var="listVo" items="${cartListVos}">
		    <tr align="center">
		      <td><input type="checkbox" name="idxChecked" id="idx${listVo.idx}" value="${listVo.idx}" onClick="onCheck()" /></td>
		      <td><a href="${ctp}/dbShop/dbProductContent?idx=${listVo.productIdx}"><img src="${ctp}/dbShop/product/${listVo.thumbImg}" width="120px"/></a></td>
		      <td width="30%" align="left">
		        <p class="contFont"><br/>
		        	<span>${listVo.cateMainName}</span><br/>
		          <span style="color:#c2935f;font-weight:bold;"><a href="${ctp}/dbShop/dbProductContent?idx=${listVo.productIdx}">${listVo.productName}</a></span><br/>
		          <span class="container"><b><fmt:formatNumber value="${listVo.mainPrice}"/>원</b></span>
		        </p>
		        <c:set var="optionNames" value="${fn:split(listVo.optionName,',')}"/>
		        <c:set var="optionPrices" value="${fn:split(listVo.optionPrice,',')}"/>
		        <c:set var="optionNums" value="${fn:split(listVo.optionNum,',')}"/>
		        <p style="font-size:12px">
		          <c:forEach var="i" begin="0" end="${fn:length(optionNames)-1}">
		            &nbsp;&nbsp;ㆍ${optionNames[i]} / <fmt:formatNumber value="${optionPrices[i]}"/>원 / ${optionNums[i]}개<br/>
		          </c:forEach> 
		        </p>
		      </td>
		      <td>
		      </td>
		      <td width="30%" align="right">
		        <div class="text-center">
			        <b>총 : <fmt:formatNumber value="${listVo.totalPrice}" pattern='#,###원'/></b><br/><br/>
			      <%--   <span style="color:#270;font-size:12px" class="buyFont">구매일자 : ${fn:substring(listVo.cartDate,0,10)}</span> --%>
			        <input type="hidden" id="totalPrice${listVo.idx}" value="${listVo.totalPrice}"/>
		        </div>
		      </td>
		      <td>
		        <button type="button" onClick="cartDelete(${listVo.idx})" class="btn btn-outline-secondary btn-sm m-1">해당품목 삭제</button>
		        <input type="hidden" name="checkItem" value="0" id="checkItem${listVo.idx}"/>	<!-- 구매체크가 되지 않은 품목은 '0'으로 체크된것은 '1'로 처리하고자 한다. -->
		        <input type="hidden" name="idx" value="${listVo.idx }"/>
		        <input type="hidden" name="thumbImg" value="${listVo.thumbImg}"/>
		        <input type="hidden" name="productName" value="${listVo.productName}"/>
		        <input type="hidden" name="mainPrice" value="${listVo.mainPrice}"/>
		        <input type="hidden" name="optionName" value="${optionNames}"/>
		        <input type="hidden" name="optionPrice" value="${optionPrices}"/>
		        <input type="hidden" name="optionNum" value="${optionNums}"/>
		        <input type="hidden" name="totalPrice" value="${listVo.totalPrice}"/>
		        <input type="hidden" name="mid" value="${sMid}"/>
		      </td>
		    </tr>
		    <c:set var="maxIdx" value="${listVo.idx}"/>	<!-- 가장 마지막 품목의 idx값이 가장 크다. -->
		  </c:forEach>
		</table>
		<div style="padding-left: 350px; padding-right: 350px; margin-bottom: 0px;">
			<hr style="color:#ccc; padding-left: 350px; padding-right: 350px; margin-bottom: 0px; border-top: 1px solid; background: transparent;" class="text-center"><br/>
		</div>	
	  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
	  <input type="hidden" name="orderTotalPrice" id="orderTotalPrice"/>
    <input type="hidden" name="baesong"/>
	</form>
	<%-- <c:if test="${listVo.idx==''}"> --%>
	<c:if test="${fn:length(cartListVos) == 0}">
		<div class="text-center" style="margin: 0 auto;">
			<img src="${ctp}/images/cartnull.jpg" width="30%"/>
		</div>
	</c:if>
	<div style="font-size:13px; color:#777777; padding: 0px 400px; font-family: 'Noto Sans KR', sans-serif;">* 80,000원 미만은 배송비(2,500)가 부과됩니다.</div>
	<br/>
	<div class="text-center" style="background-color: #f8f3f0; width: 1200px; height: 150px; margin: 0 auto;">
		<p><br/></p>
		<table class="table-borderless text-center" style="margin:auto; font-family: 'Noto Sans KR', sans-serif;">
		  <tr>
		    <th>상품금액</th>
		    <th></th>
		    <th></th>
		    <th>배송비</th>
		    <th></th>
		    <th></th>
		    <th>결제금액</th>
		  </tr>
		  <tr>
		    <td><input type="text" id="total" value="0" class="totSubBox" readonly/></td>
		    <td>원</td>
		    <td style="font-size: 20pt;">&emsp;+&emsp;</td>
		    <td>
	    	<input type="text" id="baesong" value="0" class="totSubBox" readonly/></td>
		    <td>원</td>
		    <td style="font-size: 20pt;">&emsp;=&emsp;</td>
		    <td><input type="text" id="lastPrice" value="0" class="totSubBox" readonly/></td>
		  </tr>
		</table>
	</div>
	<br/>
	<div class="text-center">
	  <button class="btn btn-dark" style="font-family: 'Noto Sans KR', sans-serif;" onClick="location.href='${ctp}/dbShop/dbProductList';">계속 쇼핑하기</button>&nbsp;&nbsp;&nbsp;
	  <button class="btn btn-secondary-outline" style="font-family: 'Noto Sans KR', sans-serif; background-color:#c2935f; color: white;" onClick="order()">선택상품 주문하기</button> 
	</div>
<p><br/></p><br/>
<ul style="color: #777777; padding-left: 350px; padding-right: 350px; font-family: 'Noto Sans KR', sans-serif; font-size: 14px;">
  <li style="margin-bottom: 10px;">장바구니에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li>
 	<li style="margin-bottom: 10px;">장바구니에 담은 상품이 판매종료가 되어 삭제 될 수 있습니다.</li>
 	<li style="margin-bottom: 10px;">입점 판매 상품은 장바구니에서 [입점 판매 상품]으로 표시됩니다.&emsp;<a href="#" data-toggle="modal" data-target="#myModal"><font style="color:#c2935f;"><u>입점 판매 상품 안내 보기 ></u></font></a></li>
</ul><br/>
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header" style="size:20pt; text-align: center; font-family: 'Noto Sans KR', sans-serif;">
        <h4 class="modal-title"><font style="font-weight: bold; ">입점 판매 상품 안내</font></h4>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body" style="size:20pt; text-align: center; font-family: 'Noto Sans KR', sans-serif;">
        <p class="text-left"><font style="font-size: 18px;">입점 판매 상품 구매 시, <br/>아래 내용을 참고해 주시기 바랍니다.</font></p>
      	<ul class="text-left" style="color: #777777; padding-left: 20px; font-family: 'Noto Sans KR', sans-serif; font-size: 13px;">
				  <li style="margin-bottom: 15px; margin-top: 10px">E 패션몰 입점 파트너 상품들은 장바구니에서 [입점 판매 상품]으로 표시됩니다.</li>
				  <li style="margin-bottom: 15px;">[입점 판매 상품]은 쿠폰 이름에 [입점 상품 전용 쿠폰]이 표기된 쿠폰만 사용 가능합니다. 자사 상품과 함께 주문 시 자사 상품 전용 쿠폰 사용은 가능하나 [입점 판매 상품]은 자동으로 할인에서 제외됩니다.(일부 쿠폰 제외)</li>
				  <li style="margin-bottom: 5px;">할인 적용 제외 자사 전용 쿠폰 예시<br/>&emsp;- 기간한정, 신데렐라 쿠폰, 룰렛 당첨 쿠폰, 무료배송/교환/반품 쿠폰 등 E패션몰 자사 브랜드 전용 쿠폰</li>
				</ul><br/>
			<hr style="padding-left: 50px; padding-right: 50px; margin-bottom: 0px; border-top: 1px solid; color:#ccc; background: transparent;" class="text-center"/>
     	<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif;"> 입점 판매 상품 관련 궁금하신 내용은 1:1 문의 또는 고객센터(1800-1234)로 문의해주시기 바랍니다.</div>
      </div>
      <div class="modal-footer">
      	<!-- modal창을 통한 이동시는 url패턴을 이용해서 이동해야 한다. -->
      </div>
    </div>
  </div>
</div>
<p><br/></p><p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>