<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>qaSearch.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
body {
  font-family: 'Gantari', sans-serif;
}

.pill-nav a {
  display: inline-block;
  color: #aaa;
  text-align: center;
  padding: 14px;
  text-decoration: none;
  font-size: 17px;
  border-radius: 5px;
  margin-left: 50px;
  margin-right: 50px;
  font-weight: bold;
}

.pill-nav a.active {
  color: black;
}

a { text-decoration:none !important }
a:hover { text-decoration:none !important }

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  ul,
  li {
    list-style: none;
  }
  .visual {
    width: 803px;   /*총 넓이*/
    height: 467px;   /*총 높이*/
    /* background: maroon; */
    margin: 0 auto;
    overflow: hidden;
    position: relative;
  }
  .visual .s_box {
    width: 803px;
    margin-left: 460px;
  }
  .visual li {
    width: 803px;
    height: 467px;
    float: left;
    transform: translateY();
    /* outline: 1px solid black; */
  }
  .visual li img {
    width: 100%;
    display: block;
  }
  .btn_prev,
  .btn_next {
    width: 100px;
    height: 100px;
    position: absolute;
    z-index: 10;
    color: white;
    text-shadow:gray;
    top: 50%;
    transform: translateY(0%);
    text-align: center;
    line-height: 0px;
  }
  .btn_next {
      right: 0;
  }
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class=text-left style="margin: 0px 0px 0px 80px;">
		<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
		<a href="${ctp}/qa/qaMain"><font style="font-size: 14px; color: #aaa;">고객센터  ></font></a>  
		<a href="${ctp}/qa/qaMain3"><font style="font-size: 14px;">공지사항</font></a>  
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25pt; color:black;">고객센터</font></div><br/>
<div class="pill-nav text-center">
  <a href="${ctp}/qa/qaMain" style="font-family: 'Gantari', sans-serif; margin-left: 70px;" href="#home">HOME</a>
  <a href="${ctp}/qa2/qaMain2" style="font-family: 'Gantari', sans-serif;">FAQ</a>
  <a href="${ctp}/qa/qaMain3" class="active" style="font-family: 'Noto Sans KR', sans-serif;">공지사항</a>
  <a href="${ctp}/qa/qaMain4" style="font-family: 'Noto Sans KR', sans-serif;">입점/제휴 문의</a>
</div>
<br/>
<div class="container" style="font-family: 'Noto Sans KR', sans-serif;">
  <div class="container">
	  <div style="font-family: 'Noto Sans KR', sans-serif;" class="text-center"><font style="color: #777777;"><b>${searchTitle}</b>(으)로 <b>"${searchString}"</b>(을)를 검색한 결과입니다.</font></div>
	  <br/>
		<table class="table table-borderless">
		  </table>
		  <table class="table table-hover text-center">
		    <tr style="font-family: 'Noto Sans KR', sans-serif; font-size:9pt;">
		    	<th>NO.</th>
		    	<th>분류</th>
		    	<th>제목</th>
		    	<th>등록일</th>
		    	<th></th>
		    </tr>
		    <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
		    <c:forEach var="vo" items="${vos}" varStatus="st">
		      <tr height="56px;">
		        <td style="padding: 28px 0px;"><font style="color: #777777;">${st.count}</font></td>
		        <td style="padding: 28px 0px;"><font style="color: #c2935f;"><b>${vo.caseone}</b></font></td>
		        <td  style="padding: 28px 0px;" class="text-left"><font style="color: black;"><a href="qaContent?idx=${vo.idx}&pag=${pageVO.pag}&pageSize=${pageVO.pageSize}">${vo.title}</a></font></td>
		        <td style="padding: 28px 0px;"><font style="color: #777777;">${fn:substring(vo.WDate,0,10)}</font></td>
		        <td><input type="button" class="btn" id="toc-toggle" onclick="openCloseToc()" value="✓"></td>
		      </tr>
		      <div id="toc-content" style="font-family: 'Noto Sans KR', sans-serif; display: none;"><br/>${fn:replace(vo.content,newLine,"<br/>")}</div>
		      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
		    </c:forEach>
		    <tr><td colspan="4" class="p-0"></td></tr>
		  </table>
		 </div>
</div>
<br/>
<div class="text-center"><input type="button" value="돌아가기" onclick="location.href='qaMain3?pag=${pag}&pageSize=${pageSize}';" class="btn" style="background-color:#c2935f; color: white;"/></div>
<p><br/></p><p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>