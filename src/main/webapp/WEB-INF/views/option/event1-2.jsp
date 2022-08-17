<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>event1-2.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/><P>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/option/event"><font style="font-size: 14px; color: #aaa;">EVENT  ></font></a>  
	<a href="${ctp}/option/event1-2"><font style="font-size: 14px;">[단독진행] ARENA x FUNDING</font></a>  
</div><br/><br/>
<div style="padding-left: 120px; padding-right: 120px; margin-bottom: 0px;">
	<font style="font-size: 12pt; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.09.15</font>
</div>	
<br/><img src="${ctp}/images/option/이벤트상세2.jpg" width="100%"/><br/><br/><br/>
<div class="text-center"><a href="${ctp}/option/event"><button type="button" class="btn btn-outline-secondary" style="font-family: 'Noto Sans KR', sans-serif; width: 200px; height: 50px;">목록으로 가기</button></a></div><br/><br/><br/> 
<p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>