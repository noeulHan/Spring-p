<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>season.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
  #img1 {
    filter: brightness(50%);
  }
  #img2 {
    filter: brightness(50%);
  }
</style>
<script>
	function imgClick() {
		alert("기간이 만료된 기획전입니다.");
	}
</script>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/><P>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/dbShop/season"><font style="font-size: 14px; font-family: 'Noto Sans KR', sans-serif;">기획전</font></a>  
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25pt; color:black;">기획전</font></div><br/>
<span class=text-left style="margin: 0px 0px 0px 130px;">
	</span>  
<div style="padding-left: 120px; padding-right: 120px; margin-bottom: 0px;">
	<hr style="border-top: 1px solid; background: transparent;" class="text-center"><br/>
</div>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	    <a href="${ctp}/dbShop/season1-1"><img src="${ctp}/images/season/6641_1PCE_PC_KOR_20220617150027.jpg" alt="기획1" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 16pt; font-family: 'Noto Sans KR', sans-serif;">22S/S 시즌 할인전<br/>봄여름 신상품 최대 50% 할인</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.06.20 ~ 2022.08.31</font>
	    </div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/dbShop/season1-2"><img src="${ctp}/images/season/6650_1PCE_PC_KOR_20220617150948.jpg" alt="기획2" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 16pt; font-family: 'Noto Sans KR', sans-serif;">22S/S 아레나 비치웨어 컬렉션<br/></font><font style="font-weight: 500; font-size: 16pt; font-family: 'Gantari', sans-serif;">ARENA in SUMMER</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.06.20 ~ 2022.08.31</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/dbShop/season1-3"><img src="${ctp}/images/season/7013_1PCE_PC_KOR_20220722163331.jpg" alt="기획3" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 16pt; font-family: 'Gantari', sans-serif;">SUMMER VACANCE<br/>CITY HOLLYDAY ITEM</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.09.13</font></div>
	 	</div>
	  <div class="w3-quarter">
	    <a href="${ctp}/dbShop/season1-5"><img src="${ctp}/images/season/7127_1PCE_PC_KOR_20220729174108.jpg" alt="이벤트9" style="width:100%"></a><br/><br/>
		    <div class="text-left"><font style="font-weight: 500; font-size: 16pt; font-family: 'Noto Sans KR', sans-serif;">데상트 우먼스 위크<br/>여성용 상품 추가 10% OFF</font>
		  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.08.25</font></div>
		 </div>
	</div>
</div><br/><br/><br/>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	    <a href="#" onclick="imgClick()"><img src="${ctp}/images/season/7027_1PCE_PC_KOR_20220715150715.jpg" alt="이벤트9" style="width:100%" id="img1"></a><br/><br/>
		    <div class="text-left"><font style="font-weight: 500; font-size: 16pt; font-family: 'Gantari', sans-serif;">TOMMY HILFIGET X TOMMY JEANS</font>
		  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.07.01 ~ 2022.07.20</font></div>
		  </div>
		  <div class="w3-quarter">
		    <a href="#" onclick="imgClick()"><img src="${ctp}/images/season/6799_1PCE_PC_KOR_20220701165526.jpg" alt="이벤트10" style="width:100%" id="img2"></a><br/><br/>
		    <div class="text-left"><font style="font-weight: 500; font-size: 16pt; font-family: 'Noto Sans KR', sans-serif;">8월의 주말 #OOTD<br/>160부터 170까지 직접 입어보기</font>
		  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.07.01 ~ 2022.07.20</font>
		  </div>
		  <div class="w3-quarter">
		    <img src="${ctp}/images/option/공백.jpg" alt="공백" style="width:100%"><br/><br/>
		    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;"></font></div>
		  </div>
		  <div class="w3-quarter">
		    <img src="${ctp}/images/option/공백.jpg" alt="공백" style="width:100%"><br/><br/>
		    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;"></font></div>
		  </div>
		</div>
	</div>
</div><br/>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>