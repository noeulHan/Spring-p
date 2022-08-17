<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>magazine2.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<script>
 $(function(){
   $(".s_box li:last").prependTo(".s_box");
   // $(".s_box").animate({marginLeft:"-=1200px"},1000, function(){
   // });
   $(".btn_next").click(function(){
     $(".s_box").animate({marginLeft:"-=1200px"},1000,function(){
       $(".s_box li:first").appendTo(".s_box");
       $(".s_box").stop().css("margin-left","-1200px");
     });
   });
   $(".btn_prev").click(function(){
     $(".s_box").animate({marginLeft:"+=1200px"},2000,function(){
       $(".s_box li:last").prependTo(".s_box");
       $(".s_box").stop().css("margin-left","-1200px");
     });
   });
   //강제 반복실행
   setInterval(function(){
     $(".btn_next").trigger("click");
   },3000);
 });
</script>
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
</style>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  ul,
  li {
    list-style: none;
  }
  .visual {
    width: 1200px;   /*총 넓이*/
    height: 1180px;   /*총 높이*/
    /* background: maroon; */
    margin: 0 auto;
    overflow: hidden;
    position: relative;
  }
  .visual .s_box {
    width: 3600px;
    margin-left: -1200px;
  }
  .visual li {
    width: 1200px;
    height: 1180px;
    float: left;
    transform: translateY();
    /* outline: 1px solid black; */
  }
  .visual li img {
    width: 100%;
    display: block;
  }
  .btn_prev,
  .btn_next {
    width: 100px;
    height: 100px;
    position: absolute;
    z-index: 10;
    color: white;
    text-shadow:gray;
    top: 50%;
    transform: translateY(0%);
    text-align: center;
    line-height: 0px;
  }
  .btn_next {
      right: 0;
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
<a href="${ctp}/member/magazine"><font style="font-size: 14px;">STYLE</font></a>
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;">MAGAZINE</font></div><br/>
<div class="pill-nav text-center">
  <a href="${ctp}/member/magazine" style="font-family: 'Gantari', sans-serif; margin-left: 70px;">NEW</a>
  <a href="${ctp}/member/magazine2" class="active" style="font-family: 'Gantari', sans-serif;" href="#home">STYLE</a>
  <a href="${ctp}/member/magazine3" style="font-family: 'Gantari', sans-serif;">LOOKBOOK</a>
</div>

<%-- <div class="w3-content w3-display-container text-center">
  <img class="mySlides" src="${ctp}/images/magazine/스타일11.jpg" style="width:150%;">
  <img class="mySlides" src="${ctp}/images/magazine/스타일22.jpg" style="width:150%">
  <img class="mySlides" src="${ctp}/images/magazine/스타일33.jpg" style="width:150%">
  <img class="mySlides" src="${ctp}/images/magazine/스타일44.jpg" style="width:150%">
  <img class="mySlides" src="${ctp}/images/magazine/스타일55.jpg" style="width:150%">
  <img class="mySlides" src="${ctp}/images/magazine/스타일55.jpg" style="width:150%">

  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
</div> --%>

<div class="visual">
  <ul class="s_box">
      <li><a href="${ctp}/member/magazine2-1"><img src="${ctp}/images/magazine/스타일11.jpg" width="120%" alt="1"><br/><img src="${ctp}/images/magazine/글씨11.jpg" width="120%" alt="1"></a></li>
      <li><a href="${ctp}/member/magazine2-2"><img src="${ctp}/images/magazine/스타일22.jpg" alt="2"><img src="${ctp}/images/magazine/글씨22.jpg" width="120%" alt="2"></a></li>
      <li><a href="${ctp}/member/magazine2-3"><img src="${ctp}/images/magazine/스타일33.jpg" alt="3"><img src="${ctp}/images/magazine/글씨33.jpg" width="120%" alt="3"></a></li>
      <li><a href="${ctp}/member/magazine2-4"><img src="${ctp}/images/magazine/스타일44.jpg" alt="4"><img src="${ctp}/images/magazine/글씨44.jpg" width="120%" alt="4"></a></li>
      <li><a href="${ctp}/member/magazine2-5"><img src="${ctp}/images/magazine/스타일55.jpg" alt="5"><img src="${ctp}/images/magazine/글씨55.jpg" width="120%" alt="5"></a></li>
      <li><a href="${ctp}/member/magazine2-6"><img src="${ctp}/images/magazine/스타일66.jpg" alt="6"><img src="${ctp}/images/magazine/글씨66.jpg" width="120%" alt="6"></a></li>
  </ul>
  <div class="btn_prev"><i class="fa-solid fa-chevron-left fa-3x"></i></div>
  <div class="btn_next"><i class="fa-solid fa-chevron-right fa-3x"></i></div>
</div><br/><br/>
<div class="w3-row text-center" >
	<div id="style1" class="w3-third">
		<a href="${ctp}/member/magazine2-1"><img src="${ctp}/images/magazine/스타일1.jpg" style="width:80%; margin: 0px; padding: 0px;"/><br/><img src="${ctp}/images/magazine/글씨1.jpg" style="width:80%;" class="text-center"/></a><br/><br/><br/>
		<a href="${ctp}/member/magazine2-4"><img src="${ctp}/images/magazine/스타일4.jpg" style="width:80%; margin: 0px; padding: 0px;"/><br/><img src="${ctp}/images/magazine/글씨4.jpg" style="width:80%;" class="text-center"/></a><br/><br/><br/>
		<a href="${ctp}/member/magazine2-7"><img src="${ctp}/images/magazine/스타일7.jpg" style="width:80%; margin: 0px; padding: 0px;"/><br/><img src="${ctp}/images/magazine/글씨7.jpg" style="width:80%;" class="text-center"/></a><br/><br/><br/>
	</div>
	<div id="style2" class="w3-third">
		<a href="${ctp}/member/magazine2-2"><img src="${ctp}/images/magazine/스타일2.jpg" style="width:80%"/><br/><img src="${ctp}/images/magazine/글씨2.jpg" style="width:80%;" class="text-center"/></a><br/><br/><br/>
		<a href="${ctp}/member/magazine2-5"><img src="${ctp}/images/magazine/스타일5.jpg" style="width:80%"/><br/><img src="${ctp}/images/magazine/글씨5.jpg" style="width:80%;" class="text-center"/></a><br/><br/><br/>
		<a href="${ctp}/member/magazine2-8"><img src="${ctp}/images/magazine/스타일8.jpg" style="width:80%"/><br/><img src="${ctp}/images/magazine/글씨8.jpg" style="width:80%;" class="text-center"/></a><br/><br/><br/>
	</div>
	<div id="style3" class="w3-third">
		<a href="${ctp}/member/magazine2-3"><img src="${ctp}/images/magazine/스타일3.jpg" style="width:80%"/><br/><img src="${ctp}/images/magazine/글씨3.jpg" style="width:80%;" class="text-center"/></a><br/><br/><br/>
		<a href="${ctp}/member/magazine2-6"><img src="${ctp}/images/magazine/스타일6.jpg" style="width:80%"/><br/><img src="${ctp}/images/magazine/글씨6.jpg" style="width:80%;" class="text-center"/></a><br/><br/><br/>
		<a href="${ctp}/member/magazine2-9"><img src="${ctp}/images/magazine/스타일9.jpg" style="width:80%"/><br/><img src="${ctp}/images/magazine/글씨9.jpg" style="width:80%;" class="text-center"/></a><br/><br/><br/>
	</div>
</div>
<p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>