<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>qaMain.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>
  'use strict';
  function pageCheck() {
  	let pageSize = $("#pageSize").val();
  	location.href = "boList.bo?pag=${pag}&pageSize="+pageSize;
  }
  
  // 검색기 처리
  function searchCheck() {
  	let searchString = $("#searchString").val();
  	
  	if(searchString.trim() == "") {
  		alert("검색어를 입력하세요.");
  		searchForm.searchString.focus();
  	}
  	else {
  		searchForm.submit();
  	}
  }
  
  function searchChange() {
  	document.getElementById("searchString").focus();
  }
  
  function loginC() {
	  if(${sLevel == 0 || sLevel == 1}) {
		  location.href = "${ctp}/dbShop/dbMyOrder?mid=${sMid}"
	  }
	  else{
		  alert("주문/배송 조회는 로그인 후 이용가능합니다.");
			location.href = "${ctp}/member/memLogin";
	  }	
	}
  
  function loginCh() {
	  if(${sLevel == 0 || sLevel == 1}) {
		  location.href = "${ctp}/member/memPwdCheck"
	  }
	  else{
		  alert("회원정보 변경은 로그인 후 이용가능합니다.");
			location.href = "${ctp}/member/memLogin";
	  }	
	}
  
  function loginChe() {
	  if(${sLevel == 0 || sLevel == 1}){
		  alert("아이디/비밀번호 찾기는 로그아웃 상태만 이용 가능합니다.");
	  }	
	  else {
		  location.href = "${ctp}/member/memIdPwdSearch"
	  }
  }
  
  function loginChec() {
	  if(${sLevel == 0 || sLevel == 1}){
		  alert("비회원 주문조회는 로그아웃 상태만 이용 가능합니다.");
	  }	
	  else {
		  location.href = "${ctp}/member/memIdPwdSearch"
	  }
	}
</script>
<style>
body {
  font-family: 'Gantari', sans-serif;
}

.pill-nav a {
  display: inline-block;
  color: #aaa;
  text-align: center;
  padding: 14px;
  text-decoration: none;
  font-size: 17px;
  border-radius: 5px;
  margin-left: 50px;
  margin-right: 50px;
  font-weight: bold;
}

.pill-nav a.active {
  color: black;
}

a { text-decoration:none !important }
a:hover { text-decoration:none !important }

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  ul,
  li {
    list-style: none;
  }
  .visual {
    width: 803px;   /*총 넓이*/
    height: 467px;   /*총 높이*/
    /* background: maroon; */
    margin: 0 auto;
    overflow: hidden;
    position: relative;
  }
  .visual .s_box {
    width: 803px;
    margin-left: 460px;
  }
  .visual li {
    width: 803px;
    height: 467px;
    float: left;
    transform: translateY();
    /* outline: 1px solid black; */
  }
  .visual li img {
    width: 100%;
    display: block;
  }
  .btn_prev,
  .btn_next {
    width: 100px;
    height: 100px;
    position: absolute;
    z-index: 10;
    color: white;
    text-shadow:gray;
    top: 50%;
    transform: translateY(0%);
    text-align: center;
    line-height: 0px;
  }
  .btn_next {
      right: 0;
  }
</style>
<style>
  .table1  {
     border: 1px solid white;
     border-spacing: 0.5cm 1em;
     border-collapse:	separate;
  }
  .table1 td {
     border: 1px solid #ccc;
     padding: 5px;
     border-spacing: 0.5cm 1em;
     border-collapse:	separate;
     border-radius: 7px;
     font-family: 'Noto Sans KR', sans-serif;
  }
  
  input[type="submit"] {font-family: FontAwesome;
  }
  
  input,
	button{
		border:none;
		/*border-radius:4px 가능 */
	}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br></p>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/qa/qaMain"><font style="font-size: 14px; font-family: 'Noto Sans KR', sans-serif">고객센터</font></a>  
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25pt; color:black;">고객센터</font></div><br/>
<div class="pill-nav text-center">
  <a href="${ctp}/qa/qaMain" class="active" style="font-family: 'Gantari', sans-serif; margin-left: 70px;" href="#home">HOME</a>
  <a href="${ctp}/qa2/qaMain2" style="font-family: 'Gantari', sans-serif;">FAQ</a>
  <a href="${ctp}/qa/qaMain3" style="font-family: 'Noto Sans KR', sans-serif;">공지사항</a>
  <a href="${ctp}/qa3/qaMain5" style="font-family: 'Noto Sans KR', sans-serif;">1:1문의</a>
  <a href="${ctp}/qa/qaMain4" style="font-family: 'Noto Sans KR', sans-serif;">입점/제휴 문의</a>
</div><br/>
<br/>
<div style="margin: 0px 350px;">
	<div class="text-left"> <a href="${ctp}/member/magazine3"><font style="font-family: 'Gantari', sans-serif; font-size: 20pt; color:black;">NOTICE SEARCH</font></a></div><br/>
  <table class="table1" style="width: 1200px;">
    <tr class="text-center">
       <td width="75%" height="180px" style="margin: 0 auto; padding: 20px 50px;">
				 <!-- 검색기 처리 시작 -->
				<div class="container text-center">
					<form name="searchForm" method="post" action="qaSearch" style="font-family: 'Noto Sans KR', sans-serif;">
					<div class="text-left" style="color: #ccc;">
					  <select name="search" class="form-select" onchange="searchChange()">
					    <option value="title">글제목</option>
					    <option value="content">글내용</option>
					  </select>
				  </div>
				  <div class="text-center" style="margin: 0px auto;"><input type="text" name="searchString" id="searchString" class="w3-input" style="height:60px; font-size:19px;" placeholder="검색어를 입력해주세요." /></div>
				  <div class="text-right"><input type="submit" value="&#xf002;" style="background-color: white;" onclick="searchCheck()"></div>
				  <input type="hidden" name="pag" value="${pageVO.pag}"/>
				  <input type="hidden" name="pageSize" value="${pageVO.pageSize}"/>
					</form>
				</div>
       </td>
       <td class="text-left" style="background-color: #c2935f; color: #c2935f; margin: 0 auto; padding: 10px 20px;">
       	<font style="color: white; font-size: 22px;">고객센터 운영안내</font><br/>
       	<font style="color: white; font-size: 28px;">1999-0805(유료)</font><br/>
				<font style="color: white; font-size: 14px;">평일 09 : 00 ~ 18 : 00<br/>토, 일, 공휴일 휴무</font>
       </td>
    </tr>
  </table><br/><br/><br/>
  <div class="text-left"> <a href="${ctp}/member/magazine3"><font style="font-family: 'Gantari', sans-serif; font-size: 20pt; color:black;">QUICK SERVICE</font></a></div><br/><br/>
	<div class="text-center" style="margin: 0px auto;">
		<img src="${ctp}/images/qa/K-064.jpg" onclick="loginC()" alt="주문배송조회" style="width: 18%; padding: 0px 10px; margin: 0px 7px;"/>
		<img src="${ctp}/images/qa/K-066.jpg" onclick="loginChe()" alt="찾기" style="width: 18%; padding: 0px 10px; margin: 0px 7px;"/>
		<a href="${ctp}/dbShop/dbMyOrder4"><img src="${ctp}/images/qa/K-067.jpg" alt="이벤트 당첨" style="width: 18%; padding: 0px 10px; margin: 0px 7px;"/></a>
		<img src="${ctp}/images/qa/K-068.jpg" onclick="loginCh()" alt="정보수정" style="width: 18%; padding: 0px 10px; margin: 0px 7px;"/>
		<img src="${ctp}/images/qa/K-069.jpg" onclick="loginChec()" alt="비회원주문조회" style="width: 18%; padding: 0px 10px; margin: 0px 7px;"/>
	</div><br/><br/><br/><br/>
	<div class="text-left"> <a href="${ctp}/member/magazine3"><font style="font-family: 'Gantari', sans-serif; font-size: 20pt; color:black;">FAQ TOP5</font></a></div>
	<div class="text-right" style="margin: 3px; padding: 2px;"><font style="color: #777777; font-family: 'Noto Sans KR', sans-serif;"><a href="${ctp}/qa2/qaMain2">더보기 ></a></font></div>
	<hr style="margin: 0px; padding: 0px; border: solid 0.7px black;">
	<div class="container" style="font-family: 'Noto Sans KR', sans-serif;">
		<table class="table table-hover text-center">
		  <tr style="font-family: 'Noto Sans KR', sans-serif; font-size:9pt;">
		  	<th width="15%"></th>
		  	<th></th>
		  </tr>
		  <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
		  <c:forEach var="vos" items="${voss}">
		    <tr height="56px;">
		      <td style="padding: 28px 0px;"><font style="color: #c2935f;"><b>${vos.caseone}</b></font></td>
		      <td  style="padding: 28px 0px;" class="text-left"><font style="font-family: 'Noto Sans KR', sans-serif; color: 474747; font-size: 17px;"><a href="${ctp}/qa2/qaContent?idx=${vos.idx}&pag=${pageVO.pag}&pageSize=${pageVO.pageSize}" >Q. ${vos.title}</a></font></td>
		    </tr>
		  </c:forEach>
		  <tr><td colspan="4" class="p-0"></td></tr>
		</table>
	</div><br/>
	<br/><br/><br/><br/>
	<div class="text-left"> <a href="${ctp}/member/magazine3"><font style="font-family: 'Noto Sans KR', sans-serif; font-size: 20pt; color:black;">공지사항</font></a></div>
	<div class="text-right" style="margin: 3px; padding: 2px;"><font style="color: #777777; font-family: 'Noto Sans KR', sans-serif;"><a href="${ctp}/qa/qaMain3">더보기 ></a></font></div>
	<hr style="margin: 0px; padding: 0px; border: solid 0.7px black;">
	 <table class="table table-hover text-center">
    <tr style="font-family: 'Noto Sans KR', sans-serif; font-size:9pt;">
    	<th>NO.</th>
    	<th>분류</th>
    	<th>제목</th>
    	<th>등록일</th>
    	<th></th>
    </tr>
    <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
    <c:forEach var="vo" items="${vos}">
      <tr height="56px;">
        <td style="padding: 28px 0px;"><font style="color: #777777;">${curScrStartNo}</font></td>
        <td style="padding: 28px 0px;"><font style="color: #c2935f; font-family: 'Noto Sans KR', sans-serif;"><b>${vo.caseone}</b></font></td>
        <td  style="padding: 28px 0px;" class="text-left"><font style="color: black; font-family: 'Noto Sans KR', sans-serif;"><a href="qaContent?idx=${vo.idx}&pag=${pageVO.pag}&pageSize=${pageVO.pageSize}">${vo.title}</a></font></td>
        <td style="padding: 28px 0px;"><font style="color: #777777;">${fn:substring(vo.WDate,0,10)}</font></td>
        <td><input type="button" class="btn" id="toc-toggle" onclick="openCloseToc()" value="✓"></td>
      </tr>
      <div id="toc-content" style="font-family: 'Noto Sans KR', sans-serif; display: none;"><br/>${fn:replace(vo.content,newLine,"<br/>")}</div>
      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
    </c:forEach>
    <tr><td colspan="4" class="p-0"></td></tr>
  </table>
</div><br/>
<p><br/><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>