<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memJoin.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <style>
	.icon {
	    width: 65px;
	    height: 65px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin : 5px;
	    font-family: 'Noto Sans KR', sans-serif;
	    }
	#join1 {
	    border-radius: 10%;
	    border:1px solid;
	    border-color: #e2e2e2;
	    overflow: hidden;
	    }
	#join2 {
	    border-radius: 10%;
	    border:1px solid;
	    border-color: #e2e2e2;
	    overflow: hidden;
	    }
	#join1:hover {
		box-shadow: 1px 1px 20px #ccc;
		}
	#join2:hover {
		box-shadow: 1px 1px 20px #ccc;
		}
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="container borderless" style="width:50%"><br/><br/>
	  <div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 35pt; color:black;">통합회원가입</font></div><br/>
	    <p style="color: #777777; font-size:19px" class="text-center">
			    <b>간편하게 신규가입하고 다양한 혜택을 누려보세요!</b> <br/><br/>
	   <div>
	 	<table style="margin-left: auto; margin-right: auto;">
		<tr>
				<td id="1" class="text-center">
						<img class="icon" src="${ctp}/images/member/유저아이콘.jpg" style="margin-right: 100px;"><br/>
						<strong><font style="margin-right: 100px;">가입방법</font></strong><br/>
				</td>
				<td id="2" class="text-center">
		      	<img class="icon" src="${ctp}/images/member/숫자아이콘2.jpg" style="margin-right: 100px;"><br/>
		        <span><font style="color: #777777; margin-right: 100px;">정보입력</font></span>
				</td>
				<td id="3" class="text-center">
		      	<img class="icon" src="${ctp}/images/member/숫자아이콘3.jpg"><br/>
		        <span><font style="color: #777777;">가입완료</font></span>
				</td>
			</tr>
		</table>
		</div>
		<br/><br/><br/>
    <span class="text-left"><h1><b>본인인증</b></h1></span>
    <div style="text-align: right;"><h5><b>네이버, 카카오 간편가입으로 10초 만에 가입완료!</b></h5></div>
    <div  class=text-center style="margin: 50px;">
	    <a href="${ctp}/member/memJoin2"><img id="join1" src="${ctp}/images/member/일반인증.jpg" style="margin-right: 50px;"></a>
	    <a href="https://kauth.kakao.com/oauth/authorize?client_id=47a8628946e7c2ba0c980cc9799fa8c7&redirect_uri=http://localhost:9090/javagreenS_hne/kakao/kakaoMain&response_type=code">
	    <!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=47a8628946e7c2ba0c980cc9799fa8c7&redirect_uri=http://49.142.157.251:9090/javagreenS_hne/kakao/kakaoMain&response_type=code"> -->
	   	 <img id="join2" src="${ctp}/images/member/카카오인증.jpg" style="margin-left: 50px;">
	   	</a>
    </div>
    <ul style="color: #aaaaaa;">
    	<li>E.Point 회원가입은 만 14세 이상만 가입 가능합니다.</li>
    	<li>네이버 간편 가입은 네이버 인증서 발급 회원만 가능합니다.</li>
    </ul><br/><br/>
    <a href="https://www.h-point.co.kr/introduce/benefit.nhd"><img class=text-center width="100%" src="${ctp}/images/member/회원가입혜택.png"></a><br/><br/><br/>
</div>
<p><br/></p>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>