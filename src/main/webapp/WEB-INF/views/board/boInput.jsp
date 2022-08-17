<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boInput.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
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
<div class="container">
  <form name="myForm" method="post" enctype="multipart/form-data">
	  <table class="table table-borderless">
	    <tr>
	      <td><h2>라이브 글 올리기</h2></td>
	    </tr>
	  </table>
	  <table class="table">
	    <tr>
	      <th>글쓴이</th>
	      <td>${sName}</td>
	    </tr>
	    <tr>
	      <th>글제목</th>
	      <td><input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control" autofocus required /></td>
	    </tr>
	    <tr>
	      <th>이메일</th>
	      <td><input type="text" name="email" placeholder="이메일을 입력하세요" value="${vo.email}" class="form-control"/></td>
	    </tr>
	    <tr>
	      <th>파일</th>
	      <td>
      		<input type="file" name="file" id="file" multiple="multiple" class="form-control-file border" accept=".jpg,.gif,.png,.zip,.ppt,.pptx,.hwp,.pdf"/>
      	</td>
	    </tr>
	    <tr>
	      <th>글내용</th>
	      <td><textarea rows="6" name="content" id="CKEDITOR" class="form-control" required></textarea></td>
	      <script>
	      	CKEDITOR.replace("content",{
	      		height:500,
	      		filebrowserUploadUrl : "${ctp}/imageUpload",
	      		uploadUrl : "${ctp}/imageUpload"
	      	});
	      </script>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-center">
	        <input type="button" value="글올리기" onclick="fCheck()" class="btn btn-outline-secondary"/> &nbsp;
	        <input type="reset" value="다시입력" class="btn btn-outline-secondary"/> &nbsp;
	        <input type="button" value="돌아가기" onclick="location.href='${ctp}/board/boList';" class="btn btn-outline-secondary"/>
	      </td>
	    </tr>
	  </table>
	  <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
	  <input type="hidden" name="mid" value="${sMid}"/>
  </form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>