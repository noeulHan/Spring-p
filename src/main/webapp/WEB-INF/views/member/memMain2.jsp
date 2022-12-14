<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memMain2.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <style>
    #leftHistory {
      float: left;
      width: 50%;
    }
    #leftHistory {
      float: right;
      width: 50%;
    }
    #clearHistory {
      clear: both;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
  <h2>회 원 전 용 방</h2>
  <hr/>
  <p><font color="blue">${sName}</font>님 로그인 중이십니다.</p>
  <p>현재 <font color="red">${sStrLevel}</font> 이십니다.</p>
  <p>누적 포인트 : <font color="blue">${vo.point}</font> 회</p>
  <p>최종 접속일 : <font color="blue">${fn:substring(vo.lastDate,0,19)}</font></p>
  <p>오늘 방문횟수 : <font color="blue">${vo.todayCnt}</font> 회</p>
  <hr/>
  <div id="leftHistory">
	  <h4>활동내역</h4>
	  방명록에 올린글수 : <font color="blue">${guestCnt}</font> 개<br/>
	  게시판에 올린글수 : <font color="blue">${boardCnt}</font> 개<br/>
	  자료실에 올린글수 : <font color="blue"></font> 개<br/>
  </div>
  <div id="rightHistory">
	  <h4>메세지내역</h4>
	  전체메세지 : <font color="blue">${totalMsgCnt}</font> 개<br/>
	  신규메세지 : <a href="${ctp}/wmMessage.wm"><font color="blue">${newMsgCnt}</font></a> 개<br/>
  </div>
  <div id="clearHistory"></div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>