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
		<a href="${ctp}/option/event"><font style="font-size: 	16px; color: #aaa;"><b>진행중</b></font></a>
		<font style="color:#aaa; font-size: 16px;"><b>&emsp;|&emsp;</b></font>
		<a href="${ctp}/option/event2"><font style="font-size: 16px;"><b>당첨자발표</b></font></a>  
	</span>  
<div style="padding-left: 120px; padding-right: 120px; margin-bottom: 0px;">
	<hr style="border-top: 1px solid; background: transparent;" class="text-center"><br/>
</div>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	   <img src="${ctp}/images/option/당첨자1.jpg" alt="이벤트1" style="width:100%"><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">[당첨발표] 라스트 땡큐 이벤트</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.05.27 ~ 2022.05.31</font></div><br/>
	   <div class="text-left" id="eventD">
		    <c:if test="${sLevel ne 0 && sLevel ne 1}">
		    	<img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%" onclick="fCheck()"/>
		    </c:if>
		    <c:if test="${sLevel == 0 || sLevel == 1}">
		    	<a href="#" data-toggle="modal" data-target="#myModal"><img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%"/></a>
		    </c:if>
	    </div>
	  </div>
	  <div class="w3-quarter">
	    <img src="${ctp}/images/option/당첨자2.jpg" alt="이벤트2" style="width:100%"><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">[당첨발표] Thank you, So May!</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.05.02 ~ 2022.05.31</font></div><br/>
	    <div class="text-left" id="eventD">
		    <c:if test="${sLevel ne 0 && sLevel ne 1}">
		    	<img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%" onclick="fCheck()"/>
		    </c:if>
		    <c:if test="${sLevel == 0 || sLevel == 1}">
		    	<a href="#" data-toggle="modal" data-target="#myModal"><img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%"/></a>
		    </c:if>
	    </div>
	  </div>
	  <div class="w3-quarter">
	   <img src="${ctp}/images/option/당첨자3.jpg" alt="이벤트3" style="width:100%"><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">[당첨발표] 스프링 랜덤 혜택</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.03.15 ~ 2022.03.24</font></div><br/>
	    <div class="text-left" id="eventD">
		    <c:if test="${sLevel ne 0 && sLevel ne 1}">
		    	<img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%" onclick="fCheck()"/>
		    </c:if>
		    <c:if test="${sLevel == 0 || sLevel == 1}">
		    	<a href="#" data-toggle="modal" data-target="#myModal"><img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%"/></a>
		    </c:if>
	    </div>
	  </div>
	  <div class="w3-quarter">
	   <img src="${ctp}/images/option/당첨자4.jpg" alt="이벤트4" style="width:100%"><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">[당첨발표] READY FOR SPRING</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.03.04 ~ 2022.03.15</font></div><br/>
		   <div class="text-left" id="eventD">
			    <c:if test="${sLevel ne 0 && sLevel ne 1}">
			    	<img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%" onclick="fCheck()"/>
			    </c:if>
			    <c:if test="${sLevel == 0 || sLevel == 1}">
			    	<a href="#" data-toggle="modal" data-target="#myModal"><img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%"/></a>
			    </c:if>
		    </div>
	  </div>
	</div>
</div><br/><br/>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	 <img src="${ctp}/images/option/당첨자5.jpg" alt="이벤트1" style="width:100%"><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">[당첨발표] 2월 스윗 럭키드로우</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.02.14 ~ 2022.02.20</font></div><br/>
	    <div class="text-left" id="eventD">
		    <c:if test="${sLevel ne 0 && sLevel ne 1}">
		    	<img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%" onclick="fCheck()"/>
		    </c:if>
		    <c:if test="${sLevel == 0 || sLevel == 1}">
		    	<a href="#" data-toggle="modal" data-target="#myModal"><img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%"/></a>
		    </c:if>
	    </div>
	  </div>
	  <div class="w3-quarter">
	 <img src="${ctp}/images/option/당첨자6.jpg" alt="이벤트2" style="width:100%"><br/><br/>
	    <div class="text-left"><font style="font-weight: 500; font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">[당첨발표] E패션몰 기프트샵</font>
	    <br/><font style="font-size: 12pt; color: #777777; font-family: 'Gantari', sans-serif;">2022.02.07 ~ 2022.02.28</font></div><br/>
	  <div class="text-left" id="eventD">
		    <c:if test="${sLevel ne 0 && sLevel ne 1}">
		    	<img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%" onclick="fCheck()"/>
		    </c:if>
		    <c:if test="${sLevel == 0 || sLevel == 1}">
		    	<a href="#" data-toggle="modal" data-target="#myModal"><img src="${ctp}/images/option/당첨자확인.jpg" alt="당첨자확인버튼" style="width:23%"/></a>
		    </c:if>
	    </div>
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
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header" style="size:20pt; text-align: center; font-family: 'Noto Sans KR', sans-serif;">
        <h4 class="modal-title"><font style="font-weight: bold; ">당첨자 확인</font></h4>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body" style="size:20pt; text-align: center; font-family: 'Noto Sans KR', sans-serif;">
        <p>${sName}님! 확인 버튼을 누르시면 당첨 여부를 알려드립니다. <br/><br/>
       	 &emsp;&emsp;${sMid}&emsp;&emsp;&emsp;<button type="button" class="btn btn-dark" id="toc-toggle" onclick="openCloseToc()">&emsp;확인&emsp;</button>
        </p>
      </div>
     	<div id="toc-content" style="font-family: 'Noto Sans KR', sans-serif; display: none;">죄송합니다. 다음 기회를 노려주세요.</div>
      <div class="modal-footer">
      	<!-- modal창을 통한 이동시는 url패턴을 이용해서 이동해야 한다. -->
      </div>
    </div>
  </div>
</div>
<p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>