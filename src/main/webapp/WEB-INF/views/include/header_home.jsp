<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/fa3667321f.js" crossorigin="anonymous"></script>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%-- <jsp:include page="/WEB-INF/views/include/bs4.jsp"/> --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	.header-left{
	   float: left;
	   margin-top: 5px;
	}
	
	.header-right{
	   float: right;
	   margin-top: 30px;
	}
</style>
<script>
	function page() {
		alert("마이페이지는 로그인 후 이용가능합니다.");
		location.href = "${ctp}/member/memLogin";
	}
</script>
<!-- 상단 부분-->
<header class="w3-container w3-black w3-large" style="background-color: black;">
	<div class=header-left style="padding: 0px 0px 0px 45px; background-color: black; margin: 0 auto;">
		<br/><a href="${ctp}/">
		<img src ="${ctp}/images/로고.png" width="50%" alt ="로고"></a><br/>
	</div>
	<div style="font-size:13px; font-family: 'Noto Sans KR', sans-serif; color:white; background-color: black;" class="header-right">
		<a href="${ctp}/qa/qaMain"><img src ="${ctp}/images/돋보기.png" width="8%" alt ="돋보기"></a>&ensp;&ensp;
		<c:if test="${sLevel ne 1 && sLevel ne 0}">
			<a href="${ctp}/member/memLogin">로그인</a>&ensp;
		</c:if>
		<c:if test="${sLevel eq 1 || sLevel eq 0}">
			${sName}님 좋은 하루 되세요.&ensp;
			<font style="color: #545454;">|</font>&ensp;
			<a href="${ctp}/member/memLogout">로그아웃</a>&ensp;
		</c:if>
		<c:if test="${sLevel ne 1 && sLevel ne 0}">
			<font style="color: #545454;">|</font>&ensp;
			<a href="${ctp}/member/memJoin">회원가입</a>&ensp;
		</c:if>
		<font style="color: #545454;">|</font>&ensp;
	   <c:if test="${sLevel == 0 || sLevel == 1}">
			<a href="${ctp}/dbShop/dbMyOrder?mid=${sMid}">마이페이지</a>&ensp;
			<font style="color: #545454;">|</font>&ensp;
	   </c:if>
		 <c:if test="${sLevel ne 0 && sLevel ne 1}">
	    	<a href="#" onclick="page()">마이페이지</a>
	    	<font style="color: #545454;">|</font>&ensp;
	   </c:if>
		<a href="${ctp}/dbShop/dbCartList">장바구니</a>&ensp;
	    	<font style="color: #545454;"></font>&ensp;
	</div>
</header>

