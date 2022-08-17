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
<style>
  table {
    font-family: 'Noto Sans KR', sans-serif;
  }
</style>
<script>
	'use strict';
  function fCheck() {
  	let title = myForm.title.value;
  	let content = myForm.content.value;
  	
  	if(title.trim() == "") {
  		alert("게시글 제목을 입력하세요");
  		myForm.title.focus();
  	}
  	/* 
  	else if(content.trim() == "") {
  		alert("글내용을 입력하세요");
  		myForm.content.focus();
  	}
  	 */
  	else {
  		/* myForm.oriContent.value = document.getElementById("oriContent").innerHTML; */
  		myForm.submit();
  	}
  }
</script>
</head>
<body>
<%-- <c:if test="${sLevel != 0}"> --%>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<%-- </c:if> --%>
<p><br/></p>
<div class="container"><br/>
 <form name="myForm" method="post">
  <div class="text-center"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 30pt; color:black;">NOTICE</font></div><br/>
  <br/>
  <table class="table table-borderless m-0" class="text-center">
    <tr>
    	<th>제목</th>
    	<td><input type="text" name="title" value="${vo.title}" class="form-control" autofocus required /></td>
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
    	 <td><textarea rows="6" name="content" id="CKEDITOR" class="form-control" required>${vo.content}</textarea></td>
    </tr>
    <tr>
	      <td colspan="2" class="text-center">
	        <input type="button" value="글수정하기" onclick="fCheck()" class="btn btn-outline-secondary"/> &nbsp;
	        <input type="reset" value="다시입력" class="btn btn-outline-secondary"/> &nbsp;
	        <input type="button" value="돌아가기" onclick="location.href='${ctp}/qa/qaMain3?pag=${pag}&pageSize=${pageSize}';" class="btn btn-outline-secondary"/>
	      </td>
	    </tr>
	  </table>
	  <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
	  <input type="hidden" name="idx" value="${vo.idx}"/>
	  <input type="hidden" name="pag" value="${pag}"/>
	  <input type="hidden" name="pageSize" value="${pageSize}"/>
	  <%-- <input type="hidden" name="oriContent"/>
	  <div id="oriContent" style="display:none;">${vo.content}</div> --%>
  </form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>