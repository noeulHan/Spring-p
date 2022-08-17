<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>qnaContent.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
  <script>
    function answerCheck() {
    	tempStr =  '<br/>';
    	tempStr += '<h3 class="text-center"></h3>';
    	tempStr += '<table class="table">';
    	tempStr += '<tr>';
    	tempStr += '  <th class="text-center">답변 글제목</th>';
    	/* tempStr += '  <td><input type="text" name="title" value="(Re) ${vo.title}" size="60" required class="form-control"/></td>'; */
    	tempStr += '  <td class="text-left">(Re) ${vo.title}</td>';
    	tempStr += '</tr>';
    	tempStr += '<tr>';
    	tempStr += '<th class="text-center">Email</th>';
    	tempStr += '  <td><input type="text" name="email" value="${email}" size="60" class="form-control" required/></td>';
    	tempStr += '  </tr>';
    	tempStr += '<tr>';
    	tempStr += '  <th class="text-center">답변 내용</th>';
    	tempStr += '  <td><textarea rows="6" name="content" required class="form-control"></textarea></td>';
    	tempStr += '</tr>';
    	tempStr += '<tr>';
    	tempStr += '  <td colspan="2" style="text-align:center">';
    	tempStr += '    <input type="button" value="취소" onclick="location.reload();" class="btn btn-dark"/> &nbsp;';
    	tempStr += '    <input type="button" value="답글올리기" onclick="fCheck()" class="btn btn-secondary-outline" style="background-color:#c2935f; color: white;"/> &nbsp;';
    	tempStr += '  </td>';
    	tempStr += '</tr>';
    	tempStr += '</table>';
    	tempStr += '<input type="hidden" name="qnaSw" value="a"/>';
    	tempStr += '<input type="hidden" name="qnaIdx" value="${vo.qnaIdx}"/>';
    	tempStr += '<input type="hidden" name="ansOK" value="1"/>';
    	tempStr += '<input type="hidden" name="title" value="(Re) ${vo.title}"/>';
			$("#reply").html(tempStr);
    }
    
    function fCheck() {
    	var title = myForm.title.value;
    	var content = myForm.content.value;
    	
    	if(title=="") {
    		alert("글제목을 입력하세요");
    		myForm.title.focus();
    	}
    	else if(content=="") {
    		alert("글내용을 입력하세요");
    		myForm.content.focus();
    	}
    	else {
    		myForm.submit();
    	}
    }
  </script>
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
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
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
<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif; font-size: 30px; padding-left: 50px;"><b>1:1 문의등록</b></div><br/><br/>
  <br/>
  <table class="table" style="font-family: 'Noto Sans KR', sans-serif;">
    <tr>
      <th class="text-center">글쓴날짜</th>
      <td class="text-left">${fn:substring(vo.WDate,0,fn:length(vo.WDate)-3)}</td>
    </tr>
    <tr>
      <th class="text-center">Email</th>
      <td colspan="3" class="text-left">${vo.email}</td>
    </tr>
    <tr>
      <th class="text-center">분류</th>
      <td class="text-left">${vo.caseone}</td>
    </tr>
    <c:if test="${vo.qnaSw == 'a'}">
	    <tr>
	      <th class="text-center">원본글제목</th>
	      <td colspan="3" style="text-align:left;">${title}</td>
	    </tr>
    </c:if>
    <tr>
      <th class="text-center">문의 제목</th>
      <td colspan="3" style="text-align:left;">${vo.title}</td>
    </tr>
    <tr>
      <th class="text-center">문의내용</th>
      <td colspan="3" style="height:200px; text-align:left;">${fn:replace(vo.content,newLine,"<br/>")}</td>
    </tr>
    <%-- 
    <c:if test="${!empty vo.pwd}">
	    <tr>
	      <th class="text-center">비밀번호</th>
	      <td colspan="3" style="text-align:left;"><input type="password" name="pwd"/></td>
	    </tr>
    </c:if>
     --%>
    <tr>
      <td colspan="4" style="text-align:center;">
        <c:if test="${vo.qnaSw == 'q' && sLevel== 0}">
          <input type="button" value="답변" onclick="answerCheck()" class="btn btn-dark"/> &nbsp;
        </c:if>
        <input type="button" value="돌아가기" onclick="location.href='qaMain5?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary-outline" style="background-color:#c2935f; color: white;"/>
      </td>
    </tr>
  </table>
  <form name="myForm" method="post" action="qaInput">
    <div id="reply"></div>
	  <input type="hidden" name="pag" value="${pag}"/>
	  <input type="hidden" name="pageSize" value="${pageSize}"/>
	  <input type="hidden" name="idx" value="${vo.idx}"/>
  </form>
  <p></p>
</div>
<p><br/></p>
	</div>
</div>
<div id="float3"></div> 
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>