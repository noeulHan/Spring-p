<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>qaList.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
</head>
<body>
<p><br/></p>
<div class="container" style="width: 1400px;">
   <div style="font-family: 'Noto Sans KR', sans-serif; font-size: 15pt;">1:1 문의 답변</div><hr/>
   <div class="w3-row-padding w3-padding-16 w3-center">
	  	<div class="w3-third">
	  		<div style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px;">전체문의</div>  
	  		<div style="color: #c2935f; font-size: 40px;"><u>${cnt}</u></div>
		  </div>
	  	<div class="w3-third">
	  		<div style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px;">답변완료</div>
	  		<div style="color: #c2935f; font-size: 40px;"><u>${cnt2}</u></div>
		  </div>
	  	<div class="w3-third">
	  		<div style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px;">답변대기</div>
	  		<div style="color: #c2935f; font-size: 40px;"><u>${cnt-cnt2}</u></div>
		  </div>
	</div>
  	<form name="tempForm">
		  <table class="table table-borderless">
		    <tr>
		      <td colspan="3"></td>
		    </tr>
		  </table>
		  <table class="table table-hover" style="font-family: 'Noto Sans KR', sans-serif;">
		    <tr class="text-center">
		      <th>NO.</th>
		      <th>제목</th>
		      <th>작성일</th>
		      <th>이메일</th>
		    </tr>
		    <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
		    <c:set var="cnt" value="0"/>
		    <c:set var="tempSw" value="0"/>
		    <c:forEach var="vo" items="${vos}">
		      <c:if test="${cnt != 0}"><c:set var="tempPreQnaIdx" value="${fn:substring(vos[cnt-1].qnaIdx,0,fn:indexOf(vo.qnaIdx,'_'))}"/></c:if>
		      <c:if test="${cnt == 0}"><c:set var="tempPreQnaIdx" value="${fn:substring(vo.qnaIdx,0,fn:indexOf(vo.qnaIdx,'_'))}"/></c:if>
		      <c:set var="tempQnaIdx" value="${fn:substring(vo.qnaIdx,0,fn:indexOf(vo.qnaIdx,'_'))}"/>
			    <tr>
			      <td class="text-center">${curScrStartNo}</td>
			      <td style="text-align:left;">
			        <a href="qnaContent?pag=${pageVO.pag}&idx=${vo.idx}&title=${vo.title}">${vo.title}</a> <!-- 비밀글이 아니면 모두가 볼 수 있다. -->
			      </td>
			      <td class="text-center">
			        <c:if test="${vo.diffTime <= 24}">${fn:substring(vo.WDate,11,19)}</c:if>
			        <c:if test="${vo.diffTime > 24}">${fn:substring(vo.WDate,0,10)}</c:if>
			      </td>
			      <td class="text-center">${vo.email}</td>
			    </tr>
			    <%-- <tr><td colspan="4"><div id="qna${vo.idx}"></div></td></tr> --%>
			    <c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
			    <c:set var="cnt" value="${cnt+1}"/>
	        <c:set var="tempSw" value="0"/>
		    </c:forEach>
		    <tr><td colspan="4" class="p-0"></td></tr>
		  </table>
	  </form>
	  <br/>
	</div>
	<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center" style="font-family: 'Noto Sans KR', sans-serif;">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="qaMain5?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="qaMain5?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-left"></i></a></li>class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="qaMain5?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-dark bg-white border-secondary" style="border: 0px; font-weight: bold;">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='qaMain5?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary" style="border: 0px;">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="qaMain5?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-right"></i></a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="qaMain5?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-forward"></i></a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->  
</div>
<p><br/></p>
</body>
</html>