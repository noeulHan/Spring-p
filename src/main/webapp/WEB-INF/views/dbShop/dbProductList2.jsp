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
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
</head>
<style>
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
<script>
$(function(){
 $('.slider-left').slick({
      slide: 'div',
      centerMode: true,
      centerPadding: '210px',
      dots : true,
      autoplay: true, // 자동 넘김 여부
      infinite: true, //반복설정
      speed: 1000, //슬라이드 속도
      autoplaySpeed : 1700,   // 자동 넘김시 슬라이드 시간
      vertical : false,  // 세로 방향 슬라이드 옵션
      prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        
      nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀
      slidesToShow: 3, //보여질 슬라이드 수
      slidesToScroll: 1 //넘겨질 슬라이드 수
    });
 })
</script>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div style="padding: 0px 180px;">

<%-- <div style="color: #e4e4e4; font-family: 'Gantari', sans-serif; background-color: black; padding:0px 100px 15px 100px;">
	  <span><a href="${ctp}/dbShop/dbProductList2">ALL </a>⠀|⠀</span>
	  <c:forEach var="subTitle" items="${subTitleVos}" varStatus="st">
	  	<span><a href="${ctp}/dbShop/dbProductList2?part=${subTitle.categorySubName}">${subTitle.categorySubName}</a></span>
		  <c:if test="${!st.last}">⠀|⠀</c:if>
	  </c:forEach><br/>
	</div>
<p><br/></p> --%>
<div class="row">
  <div class="col">
    <div class="text-center" style="font-family: 'Noto Sans KR', sans-serif; padding: 0px; margin: 50px 0px 0px 0px;"><font color="#c39869;" style="font-size: 15pt;"><b>${part}</b></font><br/>
   	<font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;">SALES LIST</font><br/><br/>
  </div>
</div>
    <%-- <div class="col text-right">
		  <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/dbShop/dbCartList';">장바구니보러가기</button>
    </div> --%>
</div>
<hr/><br/><br/>
<div class="slider-left" id="slider-left">
  <c:forEach var="vo" items="${productVos}">
	<div style="text-align:left; font-size:9pt; font-family: 'Noto Sans KR', sans-serif; margin-left: 10px; margin-right: 10px;">
  <a href="${ctp}/dbShop/dbProductContent?idx=${vo.idx}">
    <img height="518px;" style="margin-bottom: 5px;" src="${ctp}/dbShop/product/${vo.FSName}" width="315px;" id="productImgR"/>
    <div><font size="2">${vo.productName}</font></div>
    <div><font size="2"><fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>원</font></div>
  </a>
 </div>
</c:forEach>
</div><br/><br/><br/><br/>
<div style="font-family: 'Noto Sans KR', sans-serif; padding:0px 220px 15px 100px;">
	<table>
		<tr>
			<td width="20%"><span><a href="${ctp}/dbShop/dbProductList2"><b>ALL<b/></a></span><br/></td>
			<td></td>
		</tr>
		<tr>
			<td><span><b>남성 & 여성</b></span></td>
			<td colspan="3">
				<span><a href="${ctp}/dbShop/dbProductList2?part=티셔츠">티셔츠</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=아우터">아우터</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=니트/스웨터">니트/스웨터</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=데님">데님</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=셔츠">셔츠</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=팬츠">팬츠</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=셔츠/블라우스">셔츠/블라우스</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=원피스">원피스</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=스커트">스커트</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=수트정장">수트정장</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=수영복">수영복</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=스포츠웨어">스포츠웨어</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=언더웨어">언더웨어</a></span>
			</td>
		</tr>
		<tr>
			<td><span><b>골프</b></span></td>
			<td colspan="3">
				<span><a href="${ctp}/dbShop/dbProductList2?part=골프 아우터">아우터</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=골프 상의">상의</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=골프 하의">하의</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=골프화">골프화</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=골프 가방">골프 가방</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=골프 악세서리">골프 악세서리</a></span>
			</td>
		</tr>
		<tr>
			<td><span><b>잡화</b></span></td>
			<td>
				<span><a href="${ctp}/dbShop/dbProductList2?part=가방">가방</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=신발">신발</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=악세서리">악세서리</a></span>
			</td>
			<td><span><b>키즈</b></span></td>
			<td>
				<span><a href="${ctp}/dbShop/dbProductList2?part=남아">남아</a>⠀|⠀</span>
				<span><a href="${ctp}/dbShop/dbProductList2?part=여아">여아</a></span>
			</td>
		</tr>
	</table>
</div><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p>
  <c:set var="cnt" value="0"/>
  <div class="row">
    <c:forEach var="vo2" items="${productVos2}">
      <div class="col" style="width:295px; height:505px; margin-bottom: 30px;">
        <div style="width:295px; height:505px; text-align:left; font-size:9pt; font-family: 'Noto Sans KR', sans-serif; margin-left: 0px; margin-right: 0px;">
          <a href="${ctp}/dbShop/dbProductContent?idx=${vo2.idx}">
            <img style="margin-bottom: 5px;" src="${ctp}/dbShop/product/${vo2.FSName}" width="100%" id="productImgR"/>
            <div><font color="#c39869;" size="2" style="font-weight: bold;">${vo2.categoryMainName}</font></div>
            <div><font size="2">${vo2.productName}</font></div>
            <div><font size="2"><fmt:formatNumber value="${vo2.mainPrice}" pattern="#,###"/>원</font></div>
          </a><br/><br/><br/><br/><br/>
        </div>
      </div>
      <c:set var="cnt" value="${cnt+1}"/>
      <c:if test="${cnt%4 == 0}">
   </div>
        <div class="row mt-5">
      </c:if>
    </c:forEach>
    <c:if test="${!empty productVos2}">
	    <div class="container">
	      <c:if test="${fn:length(productVos2) == 0}"><h3>제품 준비 중입니다.</h3></c:if>
	    </div>
	  </c:if>
  </div>
  <c:if test="${empty productVos2}">
  <c:set var="cnt" value="0"/>
  <div class="row">
    <c:forEach var="vo" items="${productVos}">
      <div class="col">
        <div style="width:295px; height:505px; text-align:left; font-size:9pt; font-family: 'Noto Sans KR', sans-serif; margin-left: 0px; margin-right: 0px;">
          <a href="${ctp}/dbShop/dbProductContent?idx=${vo.idx}">
            <img style="margin-bottom: 5px;" src="${ctp}/dbShop/product/${vo.FSName}" width="100%" id="productImgR"/>
            <div><font color="#c39869;" size="2">${vo.categoryMainName}</font></div>
            <div><font size="2">${vo.productName}</font></div>
            <div><font size="2"><fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>원</font></div>
          </a>
        </div>
      </div><hr/>
      <c:set var="cnt" value="${cnt+1}"/>
      <c:if test="${cnt%4 == 0}">
        </div>
        <div class="row mt-5">
      </c:if>
    </c:forEach>
    <c:if test="${!empty productVos}">
	    <div class="container">
	      <c:if test="${fn:length(productVos) == 0}"><h3>제품 준비 중입니다.</h3></c:if>
	    </div>
  	</c:if>
  </div>
  </c:if>
  <hr/>
   <div class="text-center">
  <ul class="pagination justify-content-center" style="font-family: 'Noto Sans KR', sans-serif;">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbProductList2?pag=1&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbProductList2?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-left"></i></a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item"><a href="${ctp}/dbShop/dbProductList2?pag=${i}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-dark bg-white border-secondary" style="border: 0px; font-weight: bold;">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='${ctp}/dbShop/dbProductList2?pag=${i}&pageSize=${pageVO.pageSize}&part=${part}' class="page-link text-secondary" style="border: 0px;">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbProductList2?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-right"></i></a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbProductList2?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-forward"></i></a></li>
	  </c:if>
  </ul>  
</div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>