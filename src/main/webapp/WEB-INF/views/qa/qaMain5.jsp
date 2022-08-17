<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memUpdate.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
 <style>
#float1 {
	float: left;
}
#float2 {
	float: left;
}
#float3 {
  clear: both;
}
#div1 {
  border-radius: 20px;
}
#div2 {
  border-radius: 20px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/dbShop/dbMyOrder"><font style="font-size: 14px; color: #aaa;">마이페이지  ></font></a>
	<a href="${ctp}/qa3/qaMain5"><font style="font-size: 14px;">1:1 문의내역</font></a>  
</div><br/>
<div style="width: 1500px; margin: 0 auto;" class="text-center">
	<div style="width: 100%;">
		<div class="text-center" id="float1" style="width:20%;"><br/>
		<br/><div style="font-size: 25px; font-family: 'Gantari', sans-serif;"><b>MYPAGE</b></div><br/><br/>
		<div>
			<font style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px;">쇼핑정보</font><br/><br/>
			<a href="${ctp}/dbShop/dbMyOrder"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">주문/배송</font></a><br/><br/>
			<a href="${ctp}/qa3/qaMain5"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">1:1 문의내역</font></a><br/><br/>
			<a href="${ctp}/dbShop/dbMyOrder4"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">이벤트 응모내역</font></a>
		</div><br/><br/><br/><br/>
		<div>
			<font style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px;">회원정보</font><br/><br/>
			<a href="${ctp}/member/memPwdCheck"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">회원정보 수정</font></a><br/><br/>
			<a href="${ctp}/dbShop/dbMyOrder2"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">환불계좌 관리</font></a><br/><br/>
			<a href="${ctp}/dbShop/dbMyOrder3"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 13px; color: #777777;">회원 탈퇴</font></a>
		</div>
	</div>
	<div class="float33" id="float2" style="width:80%; height:1000px; padding:30px;">
	<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; font-size: 30px; padding-left: 50px;"><b>1:1 문의내역</b>&emsp;<a href="${ctp}/qa3/qaInput?qnaSw=q"><font style="font-size:11pt; font-family: 'Noto Sans KR', sans-serif;">1:1 문의하기 ></font></a><hr/></div><br/>
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
		    </tr>
		    <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
		    <c:set var="cnt" value="0"/>
		    <c:set var="tempSw" value="0"/>
		    <c:forEach var="vo" items="${vos}">
		      <c:if test="${cnt != 0}"><c:set var="tempPreQnaIdx" value="${fn:substring(vos[cnt-1].qnaIdx,0,fn:indexOf(vo.qnaIdx,'_'))}"/></c:if>
		      <c:if test="${cnt == 0}"><c:set var="tempPreQnaIdx" value="${fn:substring(vo.qnaIdx,0,fn:indexOf(vo.qnaIdx,'_'))}"/></c:if>
		      <c:set var="tempQnaIdx" value="${fn:substring(vo.qnaIdx,0,fn:indexOf(vo.qnaIdx,'_'))}"/>
			    <tr>
			      <td>${curScrStartNo}</td>
			      <td style="text-align:left;">
			        <a href="qnaContent?pag=${pageVO.pag}&idx=${vo.idx}&title=${vo.title}">${vo.title}</a> <!-- 비밀글이 아니면 모두가 볼 수 있다. -->
			      </td>
			      <td>
			        <c:if test="${vo.diffTime <= 24}">${fn:substring(vo.WDate,11,19)}</c:if>
			        <c:if test="${vo.diffTime > 24}">${fn:substring(vo.WDate,0,10)}</c:if>
			      </td>
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
	</div><p><br/></p>
</div>
<div id="float3"></div> 
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>