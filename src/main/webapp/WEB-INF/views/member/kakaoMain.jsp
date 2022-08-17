<!-- 메일화면을 만들지 않았을때 테스트로 다녀갈 jsp파일입니다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="ctp" value="${pageContext.request.contextPath}"/>
  <title>kakaoMain.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script>
    location.href = "${ctp}/member/memKakaoLogin?nickName=${nickName}&mid=${email}";
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 kakaoMain.jsp 입니다.</h2>
  <hr/>
  <p>
    닉네임 : ${nickname}<br/>메일주소 : ${email}<br/>
  </p>
  <hr/>
  <p>
    <a href="${ctp}/kakao/kakaoLogout" class="btn btn-danger">Logout</a>
  </p>
</div>
<p><br/></p>
</body>
</html>