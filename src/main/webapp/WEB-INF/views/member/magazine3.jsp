<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>magazine3.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
body {
  font-family: 'Gantari', sans-serif;
}

.pill-nav a {
  display: inline-block;
  color: #aaa;
  text-align: center;
  padding: 14px;
  text-decoration: none;
  font-size: 17px;
  border-radius: 5px;
  margin-left: 50px;
  margin-right: 50px;
  font-weight: bold;
}

.pill-nav a.active {
  color: black;
  
}

a { text-decoration:none !important }
a:hover { text-decoration:none !important }
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" /><br/>
<div class=text-left style="margin: 0px 0px 0px 80px;">
<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
<a href="${ctp}/member/magazine"><font style="font-size: 14px; color: #aaa;">MAGAZINE  ></font></a>  
<a href="${ctp}/member/magazine"><font style="font-size: 14px;">LOOKBOOK</font></a>
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;">MAGAZINE</font></div><br/>
<div class="pill-nav text-center">
  <a href="${ctp}/member/magazine" style="font-family: 'Gantari', sans-serif; margin-left: 70px;">NEW</a>
  <a href="${ctp}/member/magazine2" style="font-family: 'Gantari', sans-serif;">STYLE</a>
  <a href="${ctp}/member/magazine3" class="active" style="font-family: 'Gantari', sans-serif;" href="#home">LOOKBOOK</a>
</div><br/>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-5"><img src="${ctp}/images/magazine/??????2-1.jpg" alt="??????2-1" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">TOMMY JEANS 22SUPF<br/>LOOKBOOK</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-6"><img src="${ctp}/images/magazine/??????2-2.jpg" alt="??????2-2" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">TOMMY HILFIGER WOMEN<br/>22SUPF LOOKBOOK</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-7"><img src="${ctp}/images/magazine/??????2-3.jpg" alt="??????2-3" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">TOMMY HILFIGER MEN 22<br/>SUPF LOOKBOOK</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-8"><img src="${ctp}/images/magazine/??????2-4.jpg" alt="??????2-4" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">JSNY | 22 S/S LOOKBOOK</font></div>
	  </div>
	</div>
</div><br/><br/>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-9"><img src="${ctp}/images/magazine/??????3-1.jpg" alt="??????3-1" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">Since 1922 ?????????</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-10"><img src="${ctp}/images/magazine/??????3-2.jpg" alt="??????3-2" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">NBA | 22 S/S LOOKBOOK<br/>LOOKBOOK</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-11"><img src="${ctp}/images/magazine/??????3-3.jpg" alt="??????3-3" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">CHAMPION | SUMMER<br/>LOOKBOOK 2</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-12"><img src="${ctp}/images/magazine/??????3-4.jpg" alt="??????3-4" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">CHAMPION | SUMMER<br/>LOOKBOOK</font></div>
	  </div>
	</div>
</div><br/><br/>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-13"><img src="${ctp}/images/magazine/??????4-1.jpg" alt="??????4-1" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">SJYP 22SS LOOKBOOK</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-14"><img src="${ctp}/images/magazine/??????4-2.jpg" alt="??????4-2" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">CK x NO:ZE</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-15"><img src="${ctp}/images/magazine/??????4-3.jpg" alt="??????4-3" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">Havaianas | 1st LOOKBOOK</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-16"><img src="${ctp}/images/magazine/??????4-4.jpg" alt="??????4-4" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">DKNY 22SS LOOKBOOK 2</font></div>
	  </div>
	</div>
</div>
<br/><br/><br/><br/>
<p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>