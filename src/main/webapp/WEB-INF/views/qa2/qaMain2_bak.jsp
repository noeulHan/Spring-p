<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>qaMain2.jsp</title>
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
<style>
.accordion {
  background-color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
  font-family: 'Noto Sans KR', sans-serif; 
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
  font-family: 'Noto Sans KR', sans-serif; 
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br></p>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/qa/qaMain"><font style="font-size: 14px;">고객센터</font></a>  
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25pt; color:black;">고객센터</font></div><br/>
<div class="pill-nav text-center">
  <a href="${ctp}/qa/qaMain" style="font-family: 'Gantari', sans-serif; margin-left: 70px;" href="#home">HOME</a>
  <a href="${ctp}/qa2/qaMain2" class="active" style="font-family: 'Gantari', sans-serif;">FAQ</a>
  <a href="${ctp}/qa/qaMain3" style="font-family: 'Noto Sans KR', sans-serif;">공지사항</a>
  <a href="${ctp}/qa/qaMain4" style="font-family: 'Noto Sans KR', sans-serif;">입점/제휴 문의</a>
</div><br/><br/>
<div class="container" style="padding: 0px; margin: 0px auto;">
<div class="text-rigth" style="margin: 0px auto;">&emsp;<c:if test="${sLevel==0}"><a href="${ctp}/qa2/qaInput" class="btn btn-outline-secondary btn-sm">write</a></c:if></div>
  <ul class="nav nav-tabs nav-justified">
    <li class="nav-item">
      <a class="nav-link active" href="${ctp}/qa2/qaMain2" style="font-family: 'Noto Sans KR', sans-serif;"><b>전체</b></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/" style="font-family: 'Noto Sans KR', sans-serif;"><b>상품</b></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/" style="font-family: 'Noto Sans KR', sans-serif;"><b>주문/결제</b></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/" style="font-family: 'Noto Sans KR', sans-serif;"><b>교환/반품</b></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/" style="font-family: 'Noto Sans KR', sans-serif;"><b>환불/배송</b></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/" style="font-family: 'Noto Sans KR', sans-serif;"><b>회원/혜택</b></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/" style="font-family: 'Noto Sans KR', sans-serif;"><b>포인트/쿠폰</b></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/" style="font-family: 'Noto Sans KR', sans-serif;"><b>모바일App</b></a>
    </li>
  </ul>
</div>
<div class="container" style="font-family: 'Noto Sans KR', sans-serif;">
	<table class="table table-hover text-center">
	  <tr style="font-family: 'Noto Sans KR', sans-serif; font-size:9pt;">
	  	<th width="10%">종류</th>
	  	<th>제목</th>
	  </tr>
	  <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
	  <c:forEach var="vo" items="${vos}">
	    <tr height="56px;">
	      <td style="padding: 28px 0px;"><font style="color: #c2935f;"><b>${vo.caseone}</b></font></td>
	      <td  style="padding: 28px 0px;" class="text-left"><font style="color: black;"><a href="qaContent?idx=${vo.idx}&pag=${pageVO.pag}&pageSize=${pageVO.pageSize}">${vo.title}</a></font></td>
	    </tr>
	  </c:forEach>
	  <tr><td colspan="4" class="p-0"></td></tr>
	</table>
</div>
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="qaMain2?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="qaMain2?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="qaMain2?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='qaMain2?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="qaMain2?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="qaMain2?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->
<br/>
<!-- 검색기 처리 시작 -->
<div class="container text-center">
	<form name="searchForm" method="post" action="qaSearch" style="font-family: 'Noto Sans KR', sans-serif;">
	  <select name="search" onchange="searchChange()">
	    <option value="title">글제목</option>
	    <option value="content">글내용</option>
	  </select>
	  <input type="text" name="searchString" id="searchString"/>
	  <input type="button" class="btn btn-outline-secondary btn-sm" value="검색" onclick="searchCheck()"/>
	  <input type="hidden" name="pag" value="${pageVO.pag}"/>
	  <input type="hidden" name="pageSize" value="${pageVO.pageSize}"/>
	</form>
</div><br/><br/><br/><br/>
<!-- 검색기 처리 끝 -->

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active1");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>