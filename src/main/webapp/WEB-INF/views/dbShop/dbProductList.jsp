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
#menu3 > a { text-decoration:none !important }
#menu3 > a:hover { text-decoration:none !important
    background-color: transparent;
    text-decoration: none;
    color: black;
    }
    
#productImgR {
	border-radius: 40px 0px 0px 0px
}

.slick-prev {
    left: 0px;
            padding-bottom: 2px;
    &::before {
        content: "\f104";
    }
}

.slick-next {
    right: -25px;

    &::before {
        content: "\f105";
    }
}
#menu > a:hover { text-decoration:none !important
    background-color: transparent;
    text-decoration: none;
    color: #e4e4e4;
    }
#menu1 > a:hover { text-decoration:none !important
    background-color: transparent;
    text-decoration: none;
    color: #e4e4e4;
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
<div style="color: #e4e4e4; font-family: 'Gantari', sans-serif; background-color: black; padding:0px 100px 15px 100px;">
	  <span id="menu"><a href="${ctp}/dbShop/dbProductList">ALL </a>⠀|⠀</span>
	  <c:forEach var="mainTitle" items="${mainTitleVos}" varStatus="st">
	  	<span id="menu1"><a href="${ctp}/dbShop/dbProductList?part=${mainTitle.categoryMainName}">${mainTitle.categoryMainName}</a></span>
		  <c:if test="${!st.last}">⠀|⠀</c:if>
	  </c:forEach><br/>
	</div>
<p><br/></p>
<div id="menu3" style="padding: 0px 180px;">
<div class="text-center" style="padding: 0px; margin: 50px 0px 0px 0px;"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;"><font>
 <div class="text-center" style="padding-bottom: 0px;">
    <font color="#c39869;" style="font-size: 15pt;"><b>${part}</b></font>
 </div>
</font>SALES LIST</font></div><br/>
<hr/><br/><br/>
<div class="slider-left" id="slider-left">
  <c:forEach var="vo2" items="${productVos2}">
	<div style="text-align:left; font-size:9pt; font-family: 'Noto Sans KR', sans-serif; margin-left: 10px; margin-right: 10px;">
  <a href="${ctp}/dbShop/dbProductContent?idx=${vo2.idx}">
    <img height="518px;" style="margin-bottom: 5px;" src="${ctp}/dbShop/product/${vo2.FSName}" width="315px;" id="productImgR"/>
    <div><font size="2">${vo2.productName}</font></div>
    <div><font size="2"><fmt:formatNumber value="${vo2.mainPrice}" pattern="#,###"/>원</font></div>
  </a>
 </div>
</c:forEach>
</div><br/><br/><br/><br/>
<%-- 
<div class="text-center">
	<div>${movieVos.subTitle}</div>
	<div>${movieVos.mainTitle}</div>
	<iframe width="1080" height="600" src="https://www.youtube.com/embed/8euuDsQs7D4?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div> --%>
<c:if test="${part!='전체'}">
	<div class="text-center">
		<div><font style="font-size: 13pt;"><b>${movieVos.subTitle}</b></font></div>
		<div><font style="font-family: 'Gantari', sans-serif; font-size: 20pt;"><b>${movieVos.mainTitle}</b></font></div><br/>
		<iframe width="1080" height="600" src="${movieVos.mrink}?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div><br/><br/><br/><br/>
</c:if>
<p><br/></p>
  <c:set var="cnt" value="0"/>
  <div class="row">
    <c:forEach var="vo2" items="${productVos2}"><br/>
      <div class="col" style="width:295px; height:505px; margin-bottom: 30px;">
        <div style="width:295px; height:505px; text-align:left; font-size:9pt; font-family: 'Noto Sans KR', sans-serif; margin-left: 30px; margin-right: 0px;">
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

  <hr/>
  <div class="text-center">
  <ul class="pagination justify-content-center" style="font-family: 'Noto Sans KR', sans-serif;">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbProductList?pag=1&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbProductList?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-left"></i></a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item"><a href="${ctp}/dbShop/dbProductList?pag=${i}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-dark bg-white border-secondary" style="border: 0px; font-weight: bold;">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='${ctp}/dbShop/dbProductList?pag=${i}&pageSize=${pageVO.pageSize}&part=${part}' class="page-link text-secondary" style="border: 0px;">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbProductList?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-right"></i></a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="${ctp}/dbShop/dbProductList?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}&part=${part}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-forward"></i></a></li>
	  </c:if>
  </ul>  
</div>
</div>

<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>