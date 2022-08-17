<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boList.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
  <script>
    'use strict';
    function partCheck() {
    	let sw = partForm.part.value;
    	location.href = "${ctp}/boList.bo?sw="+sw;
    }
    
    function pageCheck() {
    	let pageSize = $("#pageSize").val();
    	location.href = "boList.bo?pag=${pag}&pageSize="+pageSize;
    }
    
    // 검색기 처리
    function searchCheck() {
    	let searchString = $("#searchString").val();
    	
    	if(searchString.trim() == "") {
    		alert("검색어를 입력하세요!");
    		searchForm.searchString.focus();
    	}
    	else {
    		searchForm.submit();
    	}
    }
    
    function live() {
			alert("지금은 E-LIVE 시간이 아닙니다. 08/17 20:00에 진행됩니다.")
	}
  </script>
  <style>
	#frame {
		height:1000px;
	}
	#frame2 {
		float:left;
		width:365px;
	}
	
	@keyframes blink-effect {
  50% {
    opacity: 0;
	  }
	}
	
	.blink {
	  animation: blink-effect 0.8s step-end infinite;
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class=text-left style="margin: 0px 0px 0px 120px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/board/boList"><font style="font-size: 14px;">LIVE</font></a>  
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;">E-LIVE</font></div><br/>
<img src="${ctp}/images/hlive.jpg" width="100%" onclick="live()"/><br/><br/><br/><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;">E-LIVE REPLAY</font></div><br/>
  <br/>
  <table class="table table-borderless">
    <tr>
      <td class="text-right" style="padding-right: 100px;">
      	<c:if test="${sLevel == 0}"><a href="${ctp}/board/boInput" class="btn btn-outline-secondary btn-l">write</a></c:if>
      </td>
    </tr>
  </table>
  <div id="frame" class="text-center" style="height: 1300px; margin: 0 auto;">
    <c:forEach var="vo" items="${vos}">
	  <div id="frame2" class="text-center" style="padding: 0px 0px 30px 60px; margin: 0 auto;'">
	        <img src="${ctp}/data/board/${vo.FName}" width="315px" height="563px"/>
	        <a href="boContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}"><font size="4px" class="font-weight-bold"><br/>&ensp;<font style="font-family: 'Noto Sans KR', sans-serif;">${vo.title}</font></font></a><br>&ensp;
	        <font style="color: #ccc; size:8px;"><i class="fa-solid fa-user-large"></i>&ensp;${vo.readNum} / <i class="fa-solid fa-heart"></i>&ensp;${vo.good}<br><a href="boContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}"></a></font>
		      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
		</div>
    </c:forEach>
  </div>

<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}">
	    <li class="page-item"><a href="boList.bo?pag=1&pageSize=${pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${curBlock > 0}">
	    <li class="page-item"><a href="boList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
	    <c:if test="${i <= totPage && i == pag}">
	      <li class="page-item active"><a href="boList.bo?pag=${i}&pageSize=${pageSize}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= totPage && i != pag}">
	      <li class="page-item"><a href='boList.bo?pag=${i}&pageSize=${pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}">
	    <li class="page-item"><a href="boList.bo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pag != totPage}">
	    <li class="page-item"><a href="boList.bo?pag=${totPage}&pageSize=${pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->
<br/>
<%-- <!-- 검색기 처리 시작 -->
<div class="container text-center">
	<form name="searchForm" method="post" action="boSearch.bo">
	  <select name="search" onchange=searchChange()">
	    <option value="title">글제목</option>
	    <option value="name">글쓴이</option>
	    <option value="content">글내용</option>
	  </select>
	  <input type="text" name="searchString" id="searchString"/>
	  <input type="button" value="검색" onclick="searchCheck()"/>
	  <input type="hidden" name="pag" value="${pag}"/>
	  <input type="hidden" name="pageSize" value="${pageSize}"/>
	</form>
</div>
<!-- 검색기 처리 끝 --> --%>
</table>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>