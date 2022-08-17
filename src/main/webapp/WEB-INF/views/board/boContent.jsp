<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boContent.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
  <script>
    function goodCheck() {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/boGoodCount",
    		data  : {idx : ${vo.idx}},
    		success:function() {
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류");
    		}
    	});
    }
    
    function boardDelCheck() {
    	let ans = confirm("현 게시물을 삭제하시겠습니까?");
    	if(ans) {
    		location.href = "boDeleteOk.bo?idx=${vo.idx}";
    	}
    }
    
    // 댓글 입력처리
    function replyCheck() {
    	let content = $("#content").val();
    	if(content.trim() == "" ) {
    		alert("댓글을 입력하세요.");
    		$("#content").focus();
    		return false;
    	}
    	let query = {
    			boardIdx : ${vo.idx},
    			mid      : '${sMid}',
    			content  : content,
    			hostIp   : '${pageContext.request.remoteAddr}'
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/boReplyInput",
    		data : query,
    		success: function(data) {
    			if(data == "1") {
    				alert("댓글이 입력되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("댓글 입력 실패")
    			}
    		},
    		error: function() {
    			alert("전송오류");
    		}
    	});
    }
    // 댓글 삭제(ajax처리)
    function replyDelCheck(idx) {
    	let ans = confirm("댓글을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/boReplyDeleteOk",
    		data  : {idx : idx},
    		success:function(data) {
    			if(data == "1") {
	    			alert("댓글이 삭제되었습니다.");
	    			location.reload();
    			}
    			else {
    				alert("댓글 삭제 실패");
    			}
    		},
    		error : function() {
    			alert("전송 실패");
    		}
    	});
    }
    
    function boReplyUpdate(idx){
    	let content = $("#content").val();
    	let hostIp = '${pageContext.request.remoteAddr}';
    	let query = {
    			idx     : idx,
    			content : content,
    			hostIp  : hostIp
    	}
		    $.ajax({
				type  : "post",
				url   : "${ctp}/boReplyUpdateOk.bo",
				data  : query,
				success:function(data) {
					if(data == "1") {
						alert("댓글이 수정되었습니다.");
						location.reload();
					}
					else {
						alert("댓글 수정 실패");
					}
				},
				error : function() {
					alert("전송오류");
				}
    });
	}
  </script>
  <style>
    th {
      background-color: white;
      text-align: center;
    }
    
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <br/>
  <table class="table table-borderless m-0">
    <tr><td><h4>&emsp;<b>제목 : ${vo.title}</b></h4></td><td class="text-right">IP : ${vo.hostIp}</td></tr>
  </table>
  <table class="table table-bordered;" style="border-radius: 20px;">
    <tr>
    	<th>작성자: </th>
    	<td>${sName}</td>
    	<th>작성일:</th>
    	<td>${fn:substring(vo.wDate,0,19)}</td>  <!-- 2022.05.11 10:13:20.5 -->
    </tr>
    <tr>
    	<th>첨부파일:</th>
    	<td>${vo.fName}</td>
    	<th>조회수:</th>
    	<td>${vo.readNum}</td>
    </tr> 
    <tr>
    	<th>아이디:</th>
    	<td>${sMid}</td>
    	<th>좋아요:</th>
    	<td><a href="javascript:goodCheck()">❤</a>(${vo.good})
    </tr>
    <tr>
    	<th>본문:</th>
    	<td  class="text-center" colspan="3" style="height:220px">
    		<img src="${ctp}/data/board/${vo.fName}" width="500px"/><br/><br/>
    		${fn:replace(vo.content,newLine,"<br/>")}
    	</td>
    </tr>
    </table>
    <div class="text-center">
  	  <c:if test="${flag == 's'}">
  			<input type="button" value="돌아가기" onclick="location.href='boSearch.bo?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn btn-outline-secondary"/>
  		</c:if>
  	  <c:if test="${flag != 's'}">
  			<input type="button" value="돌아가기" onclick="location.href='boList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-outline-secondary"/>
  		</c:if>
  		<c:if test="${sMid == vo.mid || sLevel == 0}">
    		<input type="button" value="수정하기" onclick="location.href='boUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-outline-secondary"/>
    		<input type="button" value="삭제하기" onclick="boardDelCheck()" class="btn btn-outline-secondary"/>
  		</c:if>
		</div>
  <!-- 이전글/다음글 처리 -->
  <table class="table table-borderless">
    <tr>
      <td>
        <c:if test="${nextVo.nextIdx != 0}">
	        <i class="fa-solid fa-arrow-up"></i> <a href="boContent.bo?idx=${nextVo.nextIdx}&pag=${pag}&pageSize=${pageSize}">다음글 : ${nextVo.nextTitle}</a><br/>
        </c:if>
        <c:if test="${preVo.preIdx != 0}">
        	<i class="fa-solid fa-arrow-down"></i> <a href="boContent.bo?idx=${preVo.preIdx}&pag=${pag}&pageSize=${pageSize}">이전글 : ${preVo.preTitle}</a><br/>
        </c:if>
      </td>
    </tr>
  </table>
	<br/>

	<!-- 댓글 처리(출력/입력) -->
	<!-- 댓글 출력 처리 -->
	<table class="table table-hover">
	  <tr>
	    <th>작성자</th>
	    <th>댓글내용</th>
	    <th>작성일자</th>
	    <th>접속IP</th>
	  </tr>
	  <c:forEach var="replyVo" items="${replyVos}">
	    <tr class="text-center">
	      <td>
	      	${replyVo.name}
	      	<c:if test="${sMid==replyVo.mid || sLevel ==0}">
	      	(<a href="boContent.bo?replyIdx=${replyVo.idx}&idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}"><i class="fa-solid fa-eraser"></i></a> &nbsp;
	      	<a href="javascript:replyDelCheck(${replyVo.idx})"><i class="fa-regular fa-trash-can"></i></a>)
	      	</c:if>
	      </td>
	      	<td class="text-left">
	      		 ${fn:replace(replyVo.content,newLine,"<br/>")}
	      		<c:if test="${replyVo.WDate <= 24}"><font color="#00539c" class="blink" size="2px"><b>&emsp;NEW!</b></font></c:if>
	      	</td>
	      <td>
	        <c:if test="${replyVo.WDate <= 24}">${fn:substring(replyVo.wDate,11,19)}</c:if>
          <c:if test="${replyVo.WDate > 24}">${fn:substring(replyVo.wDate,0,10)}</c:if>
	      </td>
	      <td>${replyVo.hostIp}</td>
	    </tr>
	  </c:forEach>
	</table>
	<!-- 댓글 입력 -->
	<form name="replyForm" method="post" action="boReplyInput.bo">
		<table class="table text-center">
		  <tr>
		    <td style="width:85%" class="text-left">
		      댓글 :
		      <textarea rows="4" name="content" id="content" class="form-control">${replyContent}</textarea>
		    </td>
		    <td style="width:15%">
		    	<br/>
		    	<p>작성자 : ${sName}</p>
		    	<p>
		    		<c:if test="${empty  replyContent}"><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-outline-secondary btn-sm"/></c:if>
		    	  <c:if test="${!empty replyContent}"><input type="button" value="댓글수정" onclick="boReplyUpdate(${replyIdx})" class="btn btn-outline-secondary btn-sm"/></c:if>
		    	</p>
		    </td>
		  </tr>
		</table>
		<input type="hidden" name="boardIdx" value="${vo.idx}"/>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
		<input type="hidden" name="mid" value="${sMid}"/>
	</form>

</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>