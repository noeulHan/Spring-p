<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>adLeft.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
<script>
  function logoutCheck() {
  	parent.location.href = "${ctp}/member/memLogout";
  }
</script>
<style>
  body { background-color: #c39869;
  		   font-family: 'Noto Sans KR', sans-serif;
  }
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important
    background-color: transparent;
    text-decoration: underline;
    color: white;
    }
</style>
</head>
<body>
<br/>
<div class="container text-center" style="font-size:13px; color: white;"><br/>
  <%-- <h6 style="font-family: 'Gantari', sans-serif;"><a href="${ctp}/admin/adContent?part=lineChartVisitCount" target="adContent">ADMIN MENU</a></h6><br/> --%>
  <h6 style="font-family:'Gantari', sans-serif; font-size: 16pt; font-weight: bold;"><a href="${ctp}/study/googleChart2Recently?part=lineChartVisitCount" target="adContent"><br/>E FASHION MALL</a></h6><br/>
  <hr/>
  <p><br/><a href="${ctp}/admin/adMemberList" target="adContent">회원관리</a><br/><br/></p>
  <hr/>
  <p><br/><a href="${ctp}/board/boInput" target="adContent"><i class="fa-solid fa-l"></i> 라이브</a></p>
  <p><a href="${ctp}/qa2/qaInput" target="adContent">FAQ</a></p>
  <p><a href="${ctp}/qa/qaInput" target="adContent">공지사항</a></p>
  <p><a href="${ctp}/qa3/qaList" target="adContent">1:1문의</a></p>
  <hr/>
  <p><br/><a href="${ctp}/dbShop/dbCategory" target="adContent">카테고리 등록</a></p>
  <p><a href="${ctp}/dbShop/dbProduct" target="adContent">상품 등록</a></p>
  <p><a href="${ctp}/dbShop/dbOption" target="adContent">옵션 등록</a></p>
  <p><a href="${ctp}/dbShop/dbShopList" target="adContent">등록된 상품 조회</a></p>
  <p><a href="${ctp}/dbShop/adminOrderStatus" target="adContent">주문관리</a><br/><br/></p>
  <hr/>
  <p style="font-family: 'Gantari', sans-serif;"><br/><a href="${ctp}/" target="_top">HOME</a></p>
  <p style="font-family: 'Gantari', sans-serif;"><a href="javascript:logoutCheck()">LOGOUT</a><br/><br/></p>
</div>
</body>
</html>