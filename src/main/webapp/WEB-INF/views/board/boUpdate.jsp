<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boUpdate.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function fCheck() {
    	var title = myForm.title.value;
    	var content = myForm.content.value;
    	var pag = myForm.pag.value;
    	var pageSize = myForm.pageSize.value;
    	var fName = $("#fName").val();
    	
    	if(title.trim() == "") {
    		alert("게시글 제목을 입력하세요");
    		myForm.title.focus();
    	}
    	else if(content.trim() == "") {
    		alert("글내용을 입력하세요");
    		myForm.content.focus();
    	}
    	else {
    		if(fName == "") myForm.imsiFile.value = '${vo.fName}';
    		//alert("fName : " + myForm.imsiFile.value);
    		myForm.submit();
    	}
    }
    
    function imgDelete(fName) {
    	let ans = confirm("사진을 삭제할까요?");
    	if(!ans) return false;
    	let query = {
    			idx    : ${vo.idx},
    			fName : '${vo.fName}'
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/imageDelete.bo",
    		data  : query,
    		success:function(data) {
    			if(data == "imageDeleteOk") {
    				alert("이미지가 삭제되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("이미지가 삭제 실패!!");
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br></p>
<div class="container">
  <form name="myForm" method="post" action="${ctp}/boUpdateOk.bo" enctype="multipart/form-data">
	  <table class="table table-borderless">
	    <tr>
	      <td><h2>게시판 글 수정하기</h2></td>
	    </tr>
	  </table>
	  <table class="table">
	    <tr>
	      <th>글쓴이</th>
	      <td>${sName}</td>
	    </tr>
	    <tr>
	      <th>글제목</th>
	      <td><input type="text" name="title" value="${vo.title}" class="form-control" autofocus required /></td>
	    </tr>
	    <tr>
	      <th>첨부파일</th>
	      <td>
	        <c:if test="${not empty vo.fName}">
	          <img src="${ctp}/data/board/${vo.fName}" width="100px"/>
	          <input type="button" value="삭제" onclick="imgDelete('${vo.fName}')" class="btn btn-danger badge-danger btn-sm"/>
	          <%-- <input type="button" value="삭제" onclick="imgDelete('${vo.fName}')" class="badge badge-pill badge-danger"/>! --%>
	        </c:if>
	        <c:if test="${empty vo.fName}">첨부된 사진이 없습니다</c:if>
	        <input type="file" name="fName" id="fName" class="form-control-file border" accept=".jpg,.png"/>
	      </td>
	      <!-- <div class="form-group" id="fileInsert"></div> -->
	    </tr>
	    <tr>
	      <th>글내용</th>
	      <td><textarea rows="6" name="content" class="form-control" required>${vo.content}</textarea></td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-center">
	        <input type="button" value="수정하기" onclick="fCheck()" class="btn btn-secondary"/> &nbsp;
	        <input type="button" value="돌아가기" onclick="location.href='${ctp}/boList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary"/>
	        <input type="reset" value="다시입력" class="btn btn-secondary"/> &nbsp;
	      </td>
	    </tr>
	  </table>
	  <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
	  <input type="hidden" name="idx" value="${vo.idx}"/>
	  <input type="hidden" name="pag" value="${pag}"/>
	  <input type="hidden" name="pageSize" value="${pageSize}"/>
	  <input type="hidden" name="mid" value="${sMid}"/>
	  <input type="hidden" name="imsiFile"/>
  </form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>