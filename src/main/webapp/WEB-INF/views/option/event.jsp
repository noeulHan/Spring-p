<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>event.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<script>
'use strict'
function fCheck() {
	/*
	if(${sLevel ne 0 && sLevel ne 1}) {
		  alert("당첨자 확인은 로그인 후 확인 가능합니다.");
		  location.href = "${ctp}/member/memLogin";
		}
	*/
	alert("당첨자 확인은 로그인 후 확인 가능합니다.");
  location.href = "${ctp}/member/memLogin";
}

function openCloseToc() {
   if(document.getElementById('toc-content').style.display === 'block') {
     document.getElementById('toc-content').style.display = 'none';
     document.getElementById('toc-toggle').textContent = '확인';
   } else {
     document.getElementById('toc-content').style.display = 'block';
     document.getElementById('toc-toggle').textContent = '숨기기';
   }
 }
</script>
<style>
#eventD {
	border-radius: 30%;
}

#toc-content {
  width: 100%;
  padding: 50px 50px;
  text-align: center;
  background-color: #ccc;
  margin-top: 20px;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/><P>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/option/event"><font style="font-size: 14px;">EVENT</font></a>  
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;">EVENT</font></div><br/>
	<span class=text-left style="margin: 0px 0px 0px 130px;">
		<a href="${ctp}/option/event"><font style="font-size: 16px;"><b>진행중</b></font></a>  
		<font style="color:#aaa; font-size: 16px;"><b>&emsp;|&emsp;</b></font>
		<a href="${ctp}/option/event2"><font style="font-size: 	16px; color: #aaa;"><b>당첨자발표</b></font></a>
	</span>  
<div style="padding-left: 120px; padding-right: 120px; margin-bottom: 0px;">
	<hr style="border-top: 1px solid; background: transparent;" class="text-center"><br/>
</div>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event1-1"><img src="${ctp}/images/option/이벤트1.jpg" alt="이벤트1" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">8월 주말 스페셜 혜택</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.09.10</font>
	    </div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event1-2"><img src="${ctp}/images/option/이벤트2.jpg" alt="이벤트2" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">[단독진행]  </font><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">ARENA x FUNDING</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.09.15</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event1-3"><img src="${ctp}/images/option/이벤트3.jpg" alt="이벤트3" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">앱으로 떠나는 E캉스</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.09.13</font></div>
	 	</div>
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event1-4"><img src="${ctp}/images/option/이벤트4.jpg" alt="이벤트4" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">E패션몰 8월 출석체크</font>
	  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.08.20</font></div>
		  </div>
	</div>
</div><br/><br/>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event2-1"><img src="${ctp}/images/option/이벤트5.jpg" alt="이벤트5" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">8월의 혜택</font>
	  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.08.31</font>
	  	</div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event2-2"><img src="${ctp}/images/option/이벤트6.jpg" alt="이벤트6" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">8월 스마일페이 즉시할인 이벤트</font>
	  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.08.15</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event2-3"><img src="${ctp}/images/option/이벤트7.jpg" alt="이벤트7" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">카카오톡 플러스친구 이벤트</font>
	  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.03.01 ~ 2023.02.28</font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event2-4"><img src="${ctp}/images/option/이벤트8.jpg" alt="이벤트8" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family:'Noto Sans KR', sans-serif;">타미힐피거 프로그램 'MY TOMMY'</font>
	  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.05.20 ~ 2022.08.31</font></div>
	  </div>
	</div>
</div><br/><br/>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event3-1"><img src="${ctp}/images/option/이벤트9.jpg" alt="이벤트9" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">NEW E</font><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">패션몰 멤버십 혜택</font>
	  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;"></font></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/option/event3-2"><img src="${ctp}/images/option/이벤트10.jpg" alt="이벤트10" style="width:100%"></a><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">첫 방문자를 위한 </font><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">E Package</font></div>
	  	<br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;"></font>
	  </div>
	  <div class="w3-quarter">
	    <img src="${ctp}/images/option/공백.jpg" alt="공백" style="width:100%"><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;"></font></div>
	  </div>
	  <div class="w3-quarter">
	    <img src="${ctp}/images/option/공백.jpg" alt="공백" style="width:100%"><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;"></font></div>
	  </div>
	</div>
</div><br/><br/>
<p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>