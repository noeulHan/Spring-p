<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>qaInput.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <script>
    function fCheck() {
    	var title = myForm.title.value;
    	var content = myForm.content.value;
    	
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
    		myForm.submit();
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br></p>
<div class="container" style="width: 1000px;">
  <form name="myForm" method="post">
	  <table class="table table-borderless">
	    <tr>
	      <td><h2>notice</h2></td>
	    </tr>
	  </table>
	  <table class="table">
	    <tr>
	      <th>작성자</th>
	      <td>${sName}</td>
	    </tr>
	    <tr>
	      <th>분류</th>
	      <td>
	      
	      <div class="input-group-append">
					<select name="caseone" class="custom-select">
					  <option value="중요">*중요*</option>
					  <option value="공지">공지</option>
					  <option value="이벤트">이벤트</option>
					</select>
				</div>
				 </td>
	    </tr>
	    <tr>
	      <th>공지타이틀</th>
	      <td><input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control" autofocus required /></td>
	    </tr>
	    <tr>
	      <th>공지내용</th>
	      <td><textarea rows="6" name="content" id="CKEDITOR" class="form-control" required></textarea></td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-center">
	        <input type="button" value="글올리기" onclick="fCheck()" class="btn btn-outline-secondary"/> &nbsp;
	        <input type="reset" value="다시입력" class="btn btn-outline-secondary"/> &nbsp;
	        <input type="button" value="돌아가기" onclick="location.href='${ctp}/qa/qaMain3';" class="btn btn-outline-secondary"/>
	      </td>
	    </tr>
	  </table>
	  <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
	  <input type="hidden" name="mid" value="${sMid}"/>
	  <input type="hidden" name="nickName" value="${sNickName}"/>
  </form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>