<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- 구분선 --> 
<nav class="sticky-top" style="padding: 0px 0px 15px 70px; background-color: black; margin: 0 auto;">
		<ul id="nav2" class="nav justify-content-left bg-black" style="background-color: black; color:white; font-family: 'Noto Sans KR', sans-serif;"> 
		<%-- <li class="nav-item"> <a class="nav-link" href="${ctp}/fashionMain.in">FASHION</a> </li>  --%>
		<li class="nav-item"> <a class="nav-link" href="${ctp}/">홈</a></li> 
		<li class="nav-item"> <a class="nav-link" href="${ctp}/member/magazine">매거진</a></li> 
		<li class="nav-item"> <a class="nav-link" href="${ctp}/dbShop/season">기획전</a></li> 
		<li class="nav-item"> <a class="nav-link" href="${ctp}/dbShop/dbProductList">브랜드</a></li> 
		<li class="nav-item"> <a class="nav-link" href="${ctp}/dbShop/dbProductList2">카테고리</a></li> 
		<li class="nav-item"> <a class="nav-link" href="${ctp}/option/event">이벤트</a></li> 
		<li class="nav-item"> <a class="nav-link" href="${ctp}/board/boList">라이브</a></li> 
		<li class="nav-item"> <a class="nav-link" href="${ctp}/qa/qaMain">고객센터</a></li>
		<c:if test="${sLevel == 0}">
    	<a href="${ctp}/admin/adMenu" class="w3-bar-item w3-button">&emsp;&emsp;&emsp;관리자메뉴</a>
    </c:if>
	</ul>
	
</nav>