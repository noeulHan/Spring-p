<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memMain.jsp</title>
  <%-- <jsp:include page="/WEB-INF/views/include/bs4.jsp"/> --%>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
    	/* var conditionOrderStatus = document.getElementById("conditionOrderStatus").value; */
    	
    	if((startDateJumun - endDateJumun) > 0) {
    		alert("주문일자를 확인하세요!");
    		return false;
    	}
    	
    	startJumun = moment(startDateJumun).format("YYYY-MM-DD");
    	endJumun = moment(endDateJumun).format("YYYY-MM-DD");
    	location.href="${ctp}/dbShop/myOrderStatus?startJumun="+startJumun+"&endJumun="+endJumun+"&pag=${pageVo.pag}";
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
	<a href="${ctp}/dbShop/dbMyOrder"><font style="font-size: 14px;">주문/배송</font></a>  
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
			<c:set var="conditionOrderStatus" value="${conditionOrderStatus}"/>
			<c:set var="orderStatus" value="${orderStatus}"/>
		  <c:set var="condition" value="전체 조회"/>
		  <c:if test="${conditionDate=='7'}"><c:set var="condition" value="일주일 이내 조회"/></c:if>
		  <c:if test="${conditionDate=='15'}"><c:set var="condition" value="보름 이내 조회"/></c:if>
		  <c:if test="${conditionDate=='30'}"><c:set var="condition" value="한달 이내 조회"/></c:if>
		  <c:if test="${conditionDate=='90'}"><c:set var="condition" value="석달 이내 조회"/></c:if>
		  <c:if test="${conditionDate=='180'}"><c:set var="condition" value="여섯달 이내 조회"/></c:if>
		  <div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; font-size: 30px; padding-left: 50px;"><b>주문/배송</b></div>
		  <div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; color:#777777; font-size: 20px; padding-left: 50px;">
		  	주문내역 및 배송상태를 조회하실 수 있으며, 취소/교환/반품 신청이 가능합니다.
			</div>
		  <hr/>
		  <div style="background-color: #f8f3f0;">
			  <table class="table table-borderless" style="padding-left: 50px; font-family: 'Noto Sans KR', sans-serif;" >
			    <tr>
			      <td style="text-align:left;">&emsp;&emsp;&emsp;&emsp;기간 &emsp;&emsp;&emsp;
						  <c:choose>
						    <c:when test="${conditionDate == '7'}"><c:set var="conditionDate" value="7"/></c:when>
						    <c:when test="${conditionDate == '15'}"><c:set var="conditionDate" value="15"/></c:when>
						    <c:when test="${conditionDate == '30'}"><c:set var="conditionDate" value="1"/></c:when>
						    <c:when test="${conditionDate == '90'}"><c:set var="conditionDate" value="3"/></c:when>
						    <c:when test="${conditionDate == '180'}"><c:set var="conditionDate" value="6"/></c:when>
						    <c:otherwise><c:set var="conditionDate" value="전체"/></c:otherwise>
						  </c:choose>
			        <input type="button" style="border: 0px solid;" value="7일" onclick="orderCondition(7)"/>
			        <input type="button" style="border: 0px solid;" value="15일" onclick="orderCondition(15)"/>
			        <input type="button" style="border: 0px solid;" value="1개월" onclick="orderCondition(30)"/>
			        <input type="button" style="border: 0px solid;" value="3개월" onclick="orderCondition(90)"/>
			        <input type="button" style="border: 0px solid;" value="6개월" onclick="orderCondition(180)"/>
			      </td>
			     <%--  <td style="text-align:right;">주문상태조회(전체기간중에서):
			        <select name="orderStatus" id="orderStatus">
			          <option value="결제완료" ${orderStatus == '결제완료' ? 'selected' : ''}>결제완료</option>
			          <option value="배송중"  ${orderStatus == '배송중' ? 'selected' : ''}>배송중</option>
			          <option value="배송완료"  ${orderStatus == '배송완료' ? 'selected' : ''}>배송완료</option>
			          <option value="구매완료"  ${orderStatus == '구매완료' ? 'selected' : ''}>구매완료</option>
			          <option value="반품처리"  ${orderStatus == '반품처리' ? 'selected' : ''}>반품처리</option>
			        </select>
			      </td> --%>
			      <td style="text-align:left;">
			        <c:if test="${startJumun == null}">
			          <c:set var="startJumun" value="<%=new java.util.Date() %>"/>
				        <c:set var="startJumun"><fmt:formatDate value="${startJumun}" pattern="yyyy-MM-dd"/></c:set>
			        </c:if>
			        <c:if test="${endJumun == null}">
			          <c:set var="endJumun" value="<%=new java.util.Date() %>"/>
				        <c:set var="endJumun"><fmt:formatDate value="${endJumun}" pattern="yyyy-MM-dd"/></c:set>
			        </c:if>
			        <input type="date" name="startJumun" id="startJumun" value='${startJumun}'/> ~ <input type="date" name="endJumun" id="endJumun" value='${endJumun}'/>&ensp;
			        <input type="button" class="btn btn-dark btn-sm" value="조 회 " onclick="myOrderStatus()"/>
			      </td>
			    </tr>
			  </table>
			 </div>
		  <table class="table" style="border:0px solid; font-family: 'Noto Sans KR', sans-serif;">
		    <tr style="text-align:center; color: #474747;">
		      <th></th>
		      <th>상품</th>
		      <th>총금액</th>
		      <th>주문일시</th>
		      <th>배송지</th>
		    </tr>
		    <tr>
		    	<td colspan="4" class="text-center"><c:if test="${productVos.length == 0}">오늘 구매하신 상품이 없습니다.</c:if></td>
		    </tr>
		    <c:forEach var="vo" items="${vos}">
		      <tr>
		        <td style="text-align:center;"><br/><img src="${ctp}/data/dbShop/product/${vo.thumbImg}" class="thumb" width="100px"/></td>
		        <td align="left">
			        <div><br/><span>주문번호 : ${vo.orderIdx}</span><br/><span style="color:#c2935f; font-weight:bold;">${vo.productName}</span><br/> &nbsp; &nbsp;</div>
			        <c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
			        <c:set var="optionPrices" value="${fn:split(vo.optionPrice,',')}"/>
			        <c:set var="optionNums" value="${fn:split(vo.optionNum,',')}"/>
			        <div>
			          <c:forEach var="i" begin="1" end="${fn:length(optionNames)}">
			            &nbsp; &nbsp; ㆍ ${optionNames[i-1]} / <fmt:formatNumber value="${optionPrices[i-1]}"/>원 / ${optionNums[i-1]}개<br/>
			          </c:forEach>
			        </div>
			      </td>
		        <td style="text-align:center;">
		          <%-- <p>총 주문액 : <fmt:formatNumber value="vo.totalPrice"/>원</p> --%>
		          <p style="font-size:15pt; margin-top: 60px;"><fmt:formatNumber value="${vo.totalPrice}"/>원</p>
		        </td>
		        <td style="text-align:center; margin-top: 35px;"><br/>
		          ${fn:substring(vo.orderDate,0,10)}<br/><br/>
		          <font style="font-weight: bold;">${vo.orderStatus}</font><br/>
		          <c:if test="${vo.orderStatus eq '결제완료'}">(배송준비중)</c:if>
		        </td>
		        <td>
		          <p style="font-size:15pt; margin-top: 60px;"><input type="button" class="btn btn-outline-secondary btn-sm" value="배송지정보" onclick="nWin('${vo.orderIdx}')"></p>
		        </td>
		      </tr>
		      <tr><td colspan="4" class="p-0"></td></tr>
		    </c:forEach>
		  </table>
		</div>
	</div>
</div>
<div id="float3"></div> 
</div>
<!-- 블록 페이징처리 시작(BS4 스타일적용) -->
<c:if test="${stateFlag == 'D'}">
	<div class="container" style="padding: 0px 0px 0px 300px;">
		<ul class="pagination justify-content-center" style="font-family: 'Noto Sans KR', sans-serif;">
			<c:if test="${pageVo.totPage != 0}">
			  <c:if test="${pageVo.pag != 1}">
			    <li class="page-item"><a href="${ctp}/dbShop/myOrderStatus?pag=1&startJumun=${startJumun}&endJumun=${endJumun}&stateFlag=D" title="첫페이지" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
			  </c:if>
			  <c:if test="${pageVo.curBlock > 0}">
			    <li class="page-item"><a href="${ctp}/dbShop/myOrderStatus?pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}&startJumun=${startJumun}&endJumun=${endJumun}&stateFlag=D" title="이전블록" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-left"></i></a></li>
			  </c:if>
			  <c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}">
			    <c:if test="${i == pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item"><a href='${ctp}/dbShop/myOrderStatus?pag=${i}&startJumun=${startJumun}&endJumun=${endJumun}&stateFlag=D' class="page-link text-dark bg-white border-secondary" style="border: 0px; font-weight: bold;">${i}</a></li>
			    </c:if>
			    <c:if test="${i != pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item"><a href='${ctp}/dbShop/myOrderStatus?pag=${i}&startJumun=${startJumun}&endJumun=${endJumun}&stateFlag=D' class="page-link text-secondary" style="border: 0px;">${i}</a></li>
			    </c:if>
			  </c:forEach>
			  <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
			    <li class="page-item"><a href="${ctp}/dbShop/myOrderStatus?pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}&startJumun=${startJumun}&endJumun=${endJumun}&stateFlag=D" title="다음블록" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-right"></i></a></li>
			  </c:if>
			  <c:if test="${pageVo.pag != pageVo.totPage}">
			    <li class="page-item"><a href="${ctp}/dbShop/myOrderStatus?pag=${pageVo.totPage}&startJumun=${startJumun}&endJumun=${endJumun}&stateFlag=D" title="마지막페이지" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-forward"></i></a></li>
			  </c:if>
			</c:if>
		</ul>
	</div>
</c:if>
<c:if test="${stateFlag == 'S'}">
	<div class="container" style="padding: 0px 0px 0px 300px;">
		<ul class="pagination justify-content-center" style="font-family: 'Noto Sans KR', sans-serif;">
			<c:if test="${pageVo.totPage != 0}">
			  <c:if test="${pageVo.pag != 1}">
			    <li class="page-item"><a href="${ctp}/dbShop/orderCondition?pag=1&conditionDate=${conditionDate}&stateFlag=S" title="첫페이지" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
			  </c:if>
			  <c:if test="${pageVo.curBlock > 0}">
			    <li class="page-item"><a href="${ctp}/dbShop/orderCondition?pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}&conditionDate=${conditionDate}&stateFlag=S" title="이전블록" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-left"></i></a></li>
			  </c:if>
			  <c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}">
			    <c:if test="${i == pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item"><a href='${ctp}/dbShop/orderCondition?pag=${i}&conditionDate=${conditionDate}&stateFlag=S' class="page-link text-dark bg-white border-secondary" style="border: 0px; font-weight: bold;">${i}</a></li>
			    </c:if>
			    <c:if test="${i != pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item"><a href='${ctp}/dbShop/orderCondition?pag=${i}&conditionDate=${conditionDate}&stateFlag=S' class="page-link text-secondary" style="border: 0px;">${i}</a></li>
			    </c:if>
			  </c:forEach>
			  <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
			    <li class="page-item"><a href="${ctp}/dbShop/orderCondition?pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}&conditionDate=${conditionDate}&stateFlag=S" title="다음블록" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-right"></i></a></li>
			  </c:if>
			  <c:if test="${pageVo.pag != pageVo.totPage}">
			    <li class="page-item"><a href="${ctp}/dbShop/orderCondition?pag=${pageVo.totPage}&conditionDate=${conditionDate}&stateFlag=S" title="마지막페이지" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-forward"></i></a></li>
			  </c:if>
			</c:if>
		</ul>
	</div>
</c:if>
<c:if test="${stateFlag != 'S' && stateFlag != 'D'}">
	<div class="container" style="padding: 0px 0px 0px 300px;">
		<ul class="pagination justify-content-center" style="font-family: 'Noto Sans KR', sans-serif;">
			<c:if test="${pageVo.totPage != 0}">
			  <c:if test="${pageVo.pag != 1}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=1" title="첫페이지" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
			  </c:if>
			  <c:if test="${pageVo.curBlock > 0}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}" title="이전블록" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-left"></i></a></li>
			  </c:if>
			  <c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}">
			    <c:if test="${i == pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item"><a href='${ctp}/dbShop/dbMyOrder?pag=${i}' class="page-link text-dark bg-white border-secondary" style="border: 0px; font-weight: bold;">${i}</a></li>
			    </c:if>
			    <c:if test="${i != pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item"><a href='${ctp}/dbShop/dbMyOrder?pag=${i}' class="page-link text-secondary" style="border: 0px;">${i}</a></li>
			    </c:if>
			  </c:forEach>
			  <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}" title="다음블록" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-right"></i></a></li>
			  </c:if>
			  <c:if test="${pageVo.pag != pageVo.totPage}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=${pageVo.totPage}" title="마지막페이지" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-forward"></i></a></li>
			  </c:if>
			</c:if>
		</ul>
	</div>
</c:if>
<!-- 블록 페이징처리 끝 -->
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>