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
  <title>dbProductList.jsp</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
</head>
<style>
a { text-decoration:none !important }
a:hover { text-decoration:none !important }
</style>
<body>
<p><br/></p>
<div style="padding: 0px 180px; font-family: 'Noto Sans KR', sans-serif; font-size: 11pt;">
  <span>[<a href="${ctp}/dbShop/dbShopList">전체보기</a>]</span> /
  <c:forEach var="subTitle" items="${subTitleVos}" varStatus="st">
  	<span>[<a href="${ctp}/dbShop/dbShopList?part=${subTitle.categorySubName}">${subTitle.categorySubName}</a>]</span>
	  <c:if test="${!st.last}"> / </c:if>
  </c:forEach>
  <hr/>
  <div class="row">
    <div class="col">
	    <div style="font-family: 'Noto Sans KR', sans-serif; font-size: 15pt;">선택한 카테고리 : <b>${part}</b></div>
    </div>
    <%-- <div class="col text-right">
		  <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/dbShop/dbCartList';">장바구니보러가기</button>
    </div> --%>
  </div>
  <div class="col text-right" style="font-family: 'Noto Sans KR', sans-serif; font-size: 15pt;">
		<button type="button" class="btn btn-primary-outline" style="background-color: #c2935f; color: white;" onclick="location.href='${ctp}/dbShop/dbProduct';">상품등록</button>
  </div>
  <hr/>
  <c:set var="cnt" value="0"/>
  <div class="row">
    <c:forEach var="vo" items="${productVos}">
      <div class="col">
        <div style="text-align:center">
          <a href="${ctp}/dbShop/dbShopContent?idx=${vo.idx}">
            <img src="${ctp}/dbShop/product/${vo.FSName}" width="300px" height="400px"/>
            <div><font size="2">${vo.categoryMainName}</font></div>
            <div><font size="2">${vo.productName}</font></div>
            <div><font size="2" color="#c2935f;"><fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>원</font></div>
          </a>
        </div>
      </div>
      <c:set var="cnt" value="${cnt+1}"/>
      <c:if test="${cnt%4 == 0}">
        </div>
        <div class="row mt-5">
      </c:if>
    </c:forEach>
    <div class="container">
      <c:if test="${fn:length(productVos) == 0}"><h3>제품 준비 중입니다.</h3></c:if>
    </div>
  </div>
  <hr/>
  <div class="text-center">
  <ul class="pagination justify-content-center" style="font-family: 'Noto Sans KR', sans-serif;">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbShopList?pag=1&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbShopList?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-left"></i></a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="${ctp}/dbShop/dbShopList?pag=${i}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-dark bg-white border-secondary" style="border: 0px; font-weight: bold;">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='${ctp}/dbShop/dbShopList?pag=${i}&pageSize=${pageVO.pageSize}&part=${part}' class="page-link text-secondary" style="border: 0px;">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbShopList?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-right"></i></a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbShopList?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-forward"></i></a></li>
	  </c:if>
  </ul>
</div>
</div>
<p><br/></p>
</body>
</html>