<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memInfor.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
  <br/>
  <table class="table">
    <tr><td>아이디 : ${vo.mid}</td></tr>
    <tr><td>성명 : ${vo.name}</td></tr>
    <tr><td>생일 : ${vo.birthday}</td></tr>
    <tr><td>전화번호 : ${vo.tel}</td></tr>
    <tr><td>주소 : ${vo.address}</td></tr>
    <tr><td>이메일 : ${vo.email}</td></tr>
    <tr><td>자기소개 : <br/>${fn:replace(vo.content,newLine,'<br/>')}</td></tr>
    <tr><td>등급 : ${sStrLevel}</td></tr>
    <tr><td>가입일자 : ${vo.startDate}</td></tr>
    <tr><td>마지막방문일자 : ${vo.lastDate}</td></tr>
    <tr><td>오늘방문횟수 : ${vo.todayCnt}</td></tr>
  </table>
  <hr/>
  <p>
    <input type="button" value="돌아가기" onclick="history.back()" class="btn btn-secondary"/>
  </p>
</div>
<p><br/></p>
<c:if test="${sLevel != 0}">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</c:if>
</body>
</html>