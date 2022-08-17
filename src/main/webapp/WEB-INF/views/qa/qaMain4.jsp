<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>qaMain4.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
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

  (필수) {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  ul,
  li {
    list-style: none;
  }
  .visual {
    width: 803px;   /(필수)총 넓이(필수)/
    height: 467px;   /(필수)총 높이(필수)/
    /(필수) background: maroon; (필수)/
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
    /(필수) outline: 1px solid black; (필수)/
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
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br></p>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
	<a href="${ctp}/qa/qaMain"><font style="font-size: 14px; color: #aaa;">고객센터  ></font></a>  
	<a href="${ctp}/qa/qaMain4"><font style="font-size: 14px;">입점/제휴 문의</font></a>  
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25pt; color:black;">고객센터</font></div><br/>
<div class="pill-nav text-center">
  <a href="${ctp}/qa/qaMain" style="font-family: 'Gantari', sans-serif; margin-left: 70px;" href="#home">HOME</a>
  <a href="${ctp}/qa2/qaMain2" style="font-family: 'Gantari', sans-serif;">FAQ</a>
  <a href="${ctp}/qa/qaMain3" style="font-family: 'Noto Sans KR', sans-serif;">공지사항</a>
  <a href="${ctp}/qa3/qaMain5" style="font-family: 'Noto Sans KR', sans-serif;">1:1문의</a>
  <a href="${ctp}/qa/qaMain4" class="active" style="font-family: 'Noto Sans KR', sans-serif;">입점/제휴 문의</a>
</div><br/><br/>
<div class="text-center" style="font-family: 'Noto Sans KR', sans-serif;"><h5><b>입점문의 및 다양한 제휴 프로모션을 E Fashion Mall에 제안해주세요.</b></h5></div><br/>
<div class="text-center" style="font-family: 'Noto Sans KR', sans-serif;">‘입점문의 등록’을 통해 빠른 입점문의가 가능합니다.<br/>기타 제안은 아래 메일주소로 보내주시면 담당자 검토 후 연락드리겠습니다.<br/>담당자 이메일 : hr_4560@naver.com</div>
<div class="container borderless" style="width:50%">
<form name="myForm" method="post" action="${ctp}/member/memJoin3">
	<br/>
	  <div class="form-group">
	    <div class="form-group">
		  	<div class="text-left"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 17pt; color:black;">입점문의등록</font></div><br/><hr/>
		    	<label for="name"><b>회사명  </b><font color="#c2935f"><b>(필수)</b></font></label>
		    <input type="text" style="height:60px;font-size:17px;" class="w3-input" id="name" placeholder="" name="name"autofocus />
	 	  </div>
	    <div class="form-group">
		    	<label for="name"><b>브랜드명  </b><font color="#c2935f"><b>(필수)</b></font></label>
		    <input type="text" style="height:60px;font-size:17px;" class="w3-input" id="name" placeholder="" name="name"autofocus />
	 	  </div>
	    <div class="form-group">
		    	<label for="name"><b>담당자명  </b><font color="#c2935f"><b>(필수)</b></font></label>
		    <input type="text" style="height:60px;font-size:17px;" class="w3-input" id="name" placeholder="" name="name"autofocus />
	 	  </div>
	    <div class="form-group">
		    	<label for="name"><b>전화번호  </b><font color="#c2935f"><b>(필수)</b></font></label>
		    <input type="text" style="height:60px;font-size:17px;" class="w3-input" id="name" placeholder="'-'없이 숫자만 입력" name="name"autofocus />
	 	  </div>
	    <div class="form-group">
		    	<label for="name"><b>담담자 휴대폰번호  </b><font color="#c2935f"><b>(필수)</b></font></label>
		    <input type="text" style="height:60px;font-size:17px;" class="w3-input" id="name" placeholder="'-'없이 숫자만 입력" name="name"autofocus />
		 	  </div>
	    <div class="form-group">
		    	<label for="name"><b>담담자 이메일  </b><font color="#c2935f"><b>(필수)</b></font></label>
		    <input type="text" style="height:60px;font-size:17px;" class="w3-input" id="name" placeholder="" name="name"autofocus />
	 	  </div>
	    <div class="form-group">
		    	<label for="name"><b>브랜드 웹 사이트 </b><font color="#c2935f"><b>(필수)</b></font></label>
		    <input type="text" style="height:60px;font-size:17px;" class="w3-input" id="name" placeholder="" name="name"autofocus />
	 	  </div>
	    <div class="form-group">
		    	<label for="name"><b>타사 입점 현황 </b></label>
		    <input type="text" style="height:60px;font-size:17px;" class="w3-input" id="name" placeholder="" name="name"autofocus />
	 	  </div>
	  </div>
	   
	  <div class="form-group w3-input">
	    <label for="content"><b>내용</b></label>
	    <textarea rows="5" class="form-control" id="content" name="content" placeholder=""></textarea>
	  </div><br/><br/>
	  <div class="text-left"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 17pt; color:black;">개인정보 수집 이용 안내 <font color="#c2935f"><b>(필수)</b></font></font></div><br/>
		<div class="radio icheck-primary">
		  <input type="radio" id="primary1" name="primary" />
		  <label for="primary1" style="font-family: 'Noto Sans KR', sans-serif;">개인정보 수집 이용에 동의합니다.</label><br/><br/><br/><br/>
		</div>
	  <div class="text-center">
	    <button type="reset" id="button1" class="btn btn-dark navbar-btn find-btn1" style="WIDTH: 150pt; HEIGHT: 35pt; font-size: 13pt;">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;
	    <button type="button" id="button2" class="btn navbar-btn find-btn1" onclick="fCheck()" style="WIDTH: 150pt; HEIGHT: 35pt; font-size: 13pt; background-color: #c2935f; color: white;">등록</button><br/><br/>
		</div><br/><br/>
	  <input type="hidden" name="tel"/>
	  <input type="hidden" name="email"/>
	  <input type="hidden" name="address"/>
	</form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>