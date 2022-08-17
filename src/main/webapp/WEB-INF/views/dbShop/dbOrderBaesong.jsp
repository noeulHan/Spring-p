<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbOrderBaesong.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
</head>
<style>
	body { font-family: 'Noto Sans KR', sans-serif; 
	}
</style>
<body>
<div class="container">
<p><br/></p>
	<div class="text-center" style="font-family:'Gantari', sans-serif; font-size: 15pt; font-weight: bold;">E FASHION MALL</div><hr/>
  <div class="text-center" style="font-family: 'Noto Sans KR', sans-serif;">배송조회</div><br/>
  <div style="font-family: 'Noto Sans KR', sans-serif;">
	  <p>주문자 : ${vo.name}</p>
	  <p>연락처 : ${vo.tel}</p>
	  <p>주소 : ${vo.address}</p>
	  <p>배송메세지 : ${vo.message}</p>
	  <p>결제수단 : ${vo.payment}</p>
	  <p>주문번호 : ${vo.orderIdx}</p>
  </div>
  <hr/>
  <p><input type="button" class="btn btn-outline-secondary btn-sm" value="창닫기" onclick="window.close()"/></p>
</div>
</body>
</html>