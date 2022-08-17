<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memIdCheck.jsp</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		function sendCheck() {
			opener.window.document.myForm.mid.value	= '${mid}';
			opener.window.document.myForm.pwd1.focus;
			window.close();
		}
		
		//중복 아이디 다시 체크하기
		function idCheck() {
    	let mid = childForm.mid.value;
    	
    	if(mid=="") {
    		alert("아이디 입력란이 공백입니다.\n아이디를 입력해주세요.");
    		childForm.mid.focus();
    	}
    	else {
    		childForm.submit();
    	}
		}
	</script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h3>아이디 체크폼</h3>
	<c:if test = "${res == 1}">
	<h4><font color="blue">${mid}</font>이 아이디는 사용 가능합니다.</h4>
	<p><input type="button" class="btn btn-outline-secondary btn-sm" value="창닫기" onclick="sendCheck()"/></p>
	</c:if>
	<c:if test = "${res != 1}">
	<h4><font color="blue">${mid}</font> 이 아이디는 이미 사용중입니다. 다른 아이디를 입력해주세요.</h4>
	<form name="childForm" method="post" action="${ctp}/memIdCheck.mem">
		<p>
			<input type="text" name="mid"/>
			<input type="button" value="아이디 검색" class="btn btn-outline-secondary btn-sm" onclick="idCheck()"/>
		</p>
		</form>
	</c:if>
</div>
<p><br/><p>
</body>
</html>