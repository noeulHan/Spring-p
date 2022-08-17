<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>qaContent.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function qaDelCheck() {
	let ans = confirm("현 게시물을 삭제하시겠습니까?");
	if(ans) {
		location.href = "qaDeleteOk?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
	}
}
</script>
<style>
  table {
    font-family: 'Noto Sans KR', sans-serif;
  }
</style>
</head>
<body>
<%-- <c:if test="${sLevel != 0}"> --%>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<%-- </c:if> --%>
<p><br/></p>
<div class="container"><br/>
  <div class="text-center"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 30pt; color:black;">NOTICE</font></div><br/>
  <br/>
  <table class="table table-borderless m-0" class="text-center">
    <tr>
    	<th width="10%">제목</th>
    	<td colspan="4"><font style="color: #c2935f;"><b>${vo.caseone}</b>&emsp;</font>${vo.title}</td>
    </tr>
    <tr>
    	<th>작성자</th>
    	<td>관리자</td>
    </tr>
    <tr>
    	<th>작성일</th>
    	<td>${fn:substring(vo.WDate,0,11)}</td>  <!-- 2022.05.11 10:13:20.5 -->
    </tr>
    <tr>
    	<th>글내용</th>
    	<td colspan="3" style="height:220px">${fn:replace(vo.content,newLine,"<br/>")}</td>
    </tr>
    <tr>
    	<td colspan="4" class="text-center">
    	  <c:if test="${flag == 's'}">
    			<input type="button" value="돌아가기" onclick="location.href='qaSearch?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn" style="background-color: #c2935f; color: white;"/>
    		</c:if>
    	  <c:if test="${flag != 's'}">
    			<input type="button" value="돌아가기" onclick="location.href='qaMain3?pag=${pag}&pageSize=${pageSize}';" class="btn" style="background-color: #c2935f; color: white;"/>
    		</c:if>
    		<c:if test="${sLevel == 0}">
		    		<input type="button" value="수정하기" onclick="location.href='qaUpdate?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-outline-secondary"/>
	    		<input type="button" value="삭제하기" onclick="qaDelCheck()" class="btn btn-outline-secondary"/>
    		</c:if>
    	</td>
    </tr>
  </table>

  <!-- 이전글/다음글 처리 -->
  <table class="table table-borderless">
    <tr>
      <td>
        <c:if test="${!empty pnVos[1]}">
	        <i class="fa-solid fa-caret-up"></i> <a href="qaContent?idx=${pnVos[1].idx}&pag=${pag}&pageSize=${pageSize}">${pnVos[1].title}</a><br/>
        </c:if>
        <c:if test="${!empty pnVos[0]}">
        	<c:if test="${minIdx == vo.idx}"><i class="fa-solid fa-caret-up"></i> </c:if> 
        	<c:if test="${minIdx != vo.idx}"><i class="fa-solid fa-caret-down"></i> </c:if> 
        	<a href="qaContent?idx=${pnVos[0].idx}&pag=${pag}&pageSize=${pageSize}">${pnVos[0].title}</a><br/>
        </c:if>
      </td>
    </tr>
  </table>
	<br/>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>