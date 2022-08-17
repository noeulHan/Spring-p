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
<a href="${ctp}/member/magazine3"><font style="font-size: 14px; color: #aaa;">LOOKBOOK  ></font></a>
<a href="${ctp}/member/magazine3-10"><font style="font-size: 14px;">NBA | 22 S/S LOOKBOOK LOOKBOOK</font></a>
</div><br/>
<div class="text-left"><font style="margin-left:80px; font-family: 'Gantari', sans-serif; font-size: 17pt; color:black;">NBA | 22 S/S LOOKBOOK LOOKBOOK</font><br/><font style="margin-left:80px; font-family: 'Gantari', sans-serif; color:#777777; font-size: 12pt;">HOT SUMMER COLLECTION</font></div><br/>
<div class="text-center"><font style="margin-left:80px; font-family: 'Gantari', sans-serif; font-weight:bold; font-size: 27pt; color:black;">NBA | 22 S/S LOOKBOOK LOOKBOOK</font><br/><font style=" font-weight:bold; margin-left:80px; font-family: 'Gantari', sans-serif; font-size: 13pt;">HOT SUMMER COLLECTION</font></div><br/><br/>
<img src="${ctp}/images/magazine/룩북상세샷3-10.jpg" width="100%"/><br/><br/><br/>
<div class="text-center"><a href="${ctp}/member/magazine3"><button type="button" class="btn btn-outline-secondary" style="font-family: 'Noto Sans KR', sans-serif; width: 200px; height: 50px;">목록으로 가기</button></a></div><br/><br/><br/>
<p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>