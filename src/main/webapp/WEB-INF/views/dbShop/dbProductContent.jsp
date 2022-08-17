<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbProductContent.jsp(상품정보 상세보기)</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
  <script>
  	'use strict';
  	
  	let idxArray = new Array();		/* 배열의 개수 지정없이 동적배열로 잡았다. */
    
    $(function(){
    	$("#selectOption").change(function(){						// <option value="0:기본품목_${productVo.mainPrice}">기본품목</option>
    		let selectOption = $(this).val();							// <option value="${vo.idx}:${vo.optionName}_${vo.optionPrice}">${vo.optionName}</option>
    		let idx = selectOption.substring(0,selectOption.indexOf(":")); 																	// 현재 옵션의 고유번호(기본품목은 0으로 처리했다)
    		let optionName = selectOption.substring(selectOption.indexOf(":")+1,selectOption.indexOf("_")); // 옵션명
    		let optionPrice = selectOption.substring(selectOption.indexOf("_")+1); 													// 옵션가격
    		let commaPrice = numberWithCommas(optionPrice);																									// 콤마붙인 가격
    		// 앞에서 하나의 개체를 모두 
    		
    		if($("#layer"+idx).length == 0 && selectOption != "") {
    		  idxArray[idx] = idx;		// 옵션항목의 고유번호에 따른 해당위치의 배열방에 현재상품의 고유번호(idx)를 저장처리하고 있다. 즉, idx가 5번이면 idxArray[5]번방에 5를 기억시키고 있다.
    		  /*
    		    옵션을 추가할때마다 품목(옵션)명(optionName)과 현재가격(statePrice),
    		  */
    		  
	    		let str = '';
	    		str += '<div class="layer row" id="layer'+idx+'"><div class="col">'+optionName+'</div>';
	    		str += '<input type="number" class="text-center numBox" id="numBox'+idx+'" name="optionNum" onchange="numChange('+idx+')" value="1" min="1"/> &nbsp;';
	    		str += '<input type="text" id="imsiPrice'+idx+'" class="price" value="'+commaPrice+'" readonly />';
	    		str += '<input type="hidden" id="price'+idx+'" value="'+optionPrice+'"/> &nbsp;';			/* 변동되는 가격을 재계산하기위해 price+idx 아이디를 사용하고 있다. */
	    		str += '<input type="button" class="btn btn-sm" onclick="remove('+idx+')" value="X"/>';
	    		str += '<input type="hidden" name="statePrice" id="statePrice'+idx+'" value="'+optionPrice+'"/>';		/* 현재상태에서의 변경된 상품(옵션)의 가격이다. */
	    		str += '<input type="hidden" name="optionIdx" value="'+idx+'"/>';
	    		str += '<input type="hidden" name="optionName" value="'+optionName+'"/>';
	    		str += '<input type="hidden" name="optionPrice" value="'+optionPrice+'"/>';
	    		str += '</div>';
	    		$("#product1").append(str);
	    		onTotal();
    	  }
    	  else {
    		  alert("이미 선택한 옵션입니다.");
    	  }
    	});
    });
    
    // 등록(추가)시킨 옵션 상품 삭제하기
    function remove(idx) {
  	  $("div").remove("#layer"+idx);
  	  onTotal();
    }
    
    // 상품의 총 금액 (재)계산하기
    function onTotal() {
  	  let total = 0;
  	  for(let i=0; i<idxArray.length; i++) {
  		  if($("#layer"+idxArray[i]).length != 0) {
		  	  //alert(idxArray[i]);
  		  	total +=  parseInt(document.getElementById("price"+idxArray[i]).value);
  		  	document.getElementById("totalPriceResult").value = total;	/* 재계산된 총금액을 myForm폼의 totalPriceResult아이디(name='totalPrice')에 담아서 값을 넘겨주려고 한다. */
  		  }
  	  }
  	  document.getElementById("totalPrice").value = numberWithCommas(total);	/* 출력목적으로 만들어 놓은 totalPrice아이디의 text박스에 콤마를 표시하여 보여주고 있다. */
    }
    
    // 수량 변경시 처리하는 함수
    function numChange(idx) {
    	let price = document.getElementById("statePrice"+idx).value * document.getElementById("numBox"+idx).value;	// 수량박스
    	document.getElementById("imsiPrice"+idx).value = numberWithCommas(price);		// 화면에 콤마처리해서 보여주기위해 사용한 가격(보여주기위한 용도로만 사용한다)
    	document.getElementById("price"+idx).value = price;													// price아이디는 개별품목(옵션 등)의 상품가격으로, 수량에따라 변동처리된 상품가격을 hidden으로 담아서 넘기려한다.
    	onTotal();		// 수량이 변동될때마다 다시 총상품금액을 계산시켜주고 있다.
    }
    
    // 장바구니 호출시 수행함수
    function cart() {
    if('${sMid}' == "") {
    	alert("로그인 후 이용 가능합니다.");
			location.href = "${ctp}/member/memLogin";
    }
   	 else if(document.getElementById("totalPrice").value==0) {
    		alert("옵션을 선택해주세요");
    		return false;
    	}
    	else {
    		document.myForm.submit();
    	}
    }
    
    // 직접 주문하기
    function order() {
    	let totalPrice = document.getElementById("totalPrice").value;
    	if('${sMid}' == "") {
    		alert("로그인 후 이용 가능합니다.");
    		location.href = "${ctp}/member/memLogin";
    	}
    	else if(totalPrice=="" || totalPrice==0) {
    		alert("옵션을 선택해주세요");
    		return false;
    	}
    	else {
    		document.getElementById("flag").value = "order";
    		document.myForm.submit();
    	}
    }
    
    // 천단위마다 콤마를 표시해 주는 함수
    function numberWithCommas(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
    }
    
    function cp() {
    	if('${sMid}' == "") {
				alert("쿠폰은 로그인 후 다운 가능합니다.");
				location.href = "${ctp}/member/memLogin";
    	}
    	else {
    		location.href = "#";
    	}
	}
  </script>
  <style>
    .layer  {
      border:0px;
      width:100%;
      padding:10px;
      margin-left:1px;
      background-color:#eee;
    }
    .numBox {width:40px}
    .price  {
      width:160px;
      background-color:#eee;
      text-align:right;
      font-size:1.2em;
      border:0px;
      outline: none;
    }
    .totalPrice {
      text-align:right;
      margin-right:10px;
      color:#f63;
      font-size:1.5em;
      font-weight: bold;
      border:0px;
      outline: none;
    }
    
    input::-webkit-inner-spin-button {
  appearance: none;
  -moz-appearance: none;
  -webkit-appearance: none;
	}
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important
    background-color: transparent;
    text-decoration: underline;
    color: black;
    }
    
	#productImgR {
	border-radius: 40px 0px 0px 0px
}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" /><br/>
<div class=text-left style="margin: 0px 0px 0px 80px;">
<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
<a href="#"><font style="font-size: 14px; color: #aaa;">${productVo.categoryMainName}  ></font></a>  
<a href="#"><font style="font-size: 14px; font-family: 'Noto Sans KR', sans-serif;">${productVo.productName}</font></a>
</div>
<p><br/></p>
<div class="texdt-center" style="margin:0 auto; width: 1500px;">
  <div class="row">
    <div class="col p-3 text-center">
		  <!-- 상품메인 이미지 -->
		  <div style="width: 900px;">
		    <img src="${ctp}/dbShop/product/${productVo.detail}" width="100%"/>
		  </div>
		</div>
		<div class="col p-3 text-left">
		  <!-- 상품 기본정보 -->
		  <div style="padding: 0px; margin: 0 auto;">	
		  	<h3 style="padding: 0px; margin: 0 auto;"><font style="font-size: 18px; font-family: 'Gantari', sans-serif;">${productVo.categoryMainName} ></font></h3>
		  	<div style="padding: 0px; margin: 0 auto;" class="text-right"><font style="font-size: 18px; font-family: 'Gantari', sans-serif;"><i class="fa-solid fa-heart"></i></font></div>
		  	<h3><font style="font-size: 16px; font-family: 'Noto Sans KR', sans-serif;">${productVo.productCode}</font></h3>
		    <h4><font style="font-size: 28px; font-weight:bold; font-family: 'Noto Sans KR', sans-serif;">${productVo.productName}</font></h4>
		    <h3><font style="color:#c2935f; font-weight:bold; font-family: 'Noto Sans KR', sans-serif;"><fmt:formatNumber value="${productVo.mainPrice}"/>원</font>&emsp;<font style="font-family: 'Noto Sans KR', sans-serif; font-size:11pt; color: #474747;">회원/멤버십 쿠폰가</font>
		    	<i class="fa-solid fa-circle-question fa-0.5x" style="color:#bbb;"></i>&emsp;
		    <input type="button" class="btn btn-dark btn-sm" value="쿠폰다운로드" style="background-color: #474747;" onclick="cp()"/></h3>
		  </div><hr/>
		  <!-- 상품주문을 위한 옵션정보 출력 -->
		  <div class="form-group">
		    <form name="optionForm" style="font-family: 'Noto Sans KR', sans-serif;">  <!-- 옵션의 정보를 보여주기위한 form -->
		      <select size="1" class="form-control" id="selectOption">
		        <option selected style="font-family: 'Noto Sans KR', sans-serif;" value="" disabled selected>상품옵션선택</option>
		        <option value="0:기본옵션_${productVo.mainPrice}">기본품목</option>
		        <c:forEach var="vo" items="${optionVos}">
		          <option style="font-family: 'Noto Sans KR', sans-serif;" value="${vo.idx}:${vo.optionName}_${vo.optionPrice}">${vo.optionName}</option>
		        </c:forEach>
		      </select>
		    </form>
		  </div>
		  <br/>
		  <div>
			  <form name="myForm" method="post">  <!-- 실제 상품의 정보를 넘겨주기 위한 form -->
			    <input type="hidden" name="mid" value="${sMid}"/>
			    <input type="hidden" name="productIdx" value="${productVo.idx}"/>
			    <input type="hidden" name="productName" value="${productVo.productName}"/>
			    <input type="hidden" name="mainPrice" value="${productVo.mainPrice}"/>
			    <input type="hidden" name="thumbImg" value="${productVo.FSName}"/>
			    <input type="hidden" name="totalPrice" id="totalPriceResult"/>	<!-- 계산된 총금액(totalPrice)을 넘겨주기위해서사용중. -->
			    <input type="hidden" name="flag" id="flag"/>			<!-- 장바구니담지않고 직접주문시에 flag='order'을 넘겨주기위한 변수 -->
			    <!-- 위쪽에서 메인상품의 기본정보와 아래쪽에서는 선택한 옵션의 정보를 같이 넘겨주려 준비중이다. -->
			    <div id="product1"></div>
			  </form>
		  </div>
		  <!-- 상품의 총가격(옵션포함가격) 출력처리 -->
		  <div>
		    <hr/>
		    <div class="text-left"><font size="4pt" color="black" style="font-family: 'Noto Sans KR', sans-serif;">합계</font></div>
		    <p class="text-right">
		    	<!-- 아래의 id와 class이름인 totalPrice는 출력용으로 보여주기위해서만 사용한것으로 값의 전송시와는 관계가 없다. -->
	        <b><input type="text" class="totalPrice text-right" style="font-family: 'Noto Sans KR', sans-serif; color: #474747;" id="totalPrice" value="<fmt:formatNumber value='0'/>" readonly /></b>
		    </p>
		  </div>
		  <br/>
		  <!-- 장바구니보기/주문하기/계속쇼핑하기 처리 -->
		  <div class="text-center">
		    <button class="btn btn-dark" style="font-family: 'Noto Sans KR', sans-serif; width: 200px; height: 60px;" onclick="cart()">장바구니</button>&nbsp;
		    <button class="btn btn-secondary-outline" style="font-family: 'Noto Sans KR', sans-serif; background-color:#c2935f; color: white; width: 200px; height: 60px;" onclick="order()">바로구매</button>&nbsp;
		  </div>
		  <div>
		  	<table style="font-family: 'Noto Sans KR', sans-serif; font-size: 10pt; padding: 10px; margin: 40px 20px 40px 20px;">
		  		<tr>
		  			<td width="25%" style="padding:7px 0px;">배송비</td>
		  			<td>80,000 이상 구매시 무료(도서산간추가 3000원)</td>
		  		</tr>
		  		<tr>
		  			<td style="padding:7px 0px;">EL마일리지</td>
		  			<td>최대 1% 적립 <i class="fa-solid fa-circle-question fa-0.5x" style="color:#bbb;"></i></td>
		  		</tr>
		  		<tr>
		  			<td style="padding:7px 0px;">E포인트</td>
		  			<td>0.1% 적립 <i class="fa-solid fa-circle-question fa-0.5x" style="color:#bbb;"></i></td>
		  		</tr>
		  	</table>
		  </div>
		</div>
  </div>
  <br/><br/><br/><br/><br/>
  <!-- 상품 상세설명 보여주기 -->
  <hr/>
  <div id="content" class="text-center"><br/>
  	<img src="${ctp}/images/K-675.jpg"/>
    ${productVo.content}
  </div><br/><br/>
</div>
<div class="text-center">
	<img src="${ctp}/images/home/K-674.jpg" width="65%">
</div><br/><br/><br/>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>