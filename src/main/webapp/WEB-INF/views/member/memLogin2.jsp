<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memLogin2.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
	#left {width: 950px; height: 500px;
	float:left;
	border-right : 1px solid #ccc;
	}
	#right {width: 600px; height: 600px; margin-left:55px;
	float:left;}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/><P><br/>

<div style="height: 650px">
  <div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25pt; color:black;">로그인</font></div><br/>
	<div id="left">
			<div style="color: #777777;">
			<div class="container" style="padding: 0px 100px 0px 300px;">
			  <ul class="nav nav-tabs nav-justified">
			    <li class="nav-item">
			      <a class="nav-link" href="${ctp}/member/memLogin" style="font-family: 'Noto Sans KR', sans-serif;"><b>통합회원</b></a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link active" href="${ctp}/member/memLogin2" style="font-family: 'Noto Sans KR', sans-serif;"><b>비회원</b></a>
			    </li>
			  </ul>
			</div>
			  <div class="container borderless" style="width:45%">
				  <form name="myForm" method="post" style="width: 600px; font-family: 'Noto Sans KR', sans-serif;"><br/><br/>
				    <div class="form-group">
				      <input type="text" class="form-control w3-input" style="width:600px;height:60px;font-size:17px;" name="mid" id="mid" value="${mid}" placeholder="이름" required autofocus />
				      <div class="valid-feedback">입력성공</div>
				      <div class="invalid-feedback">회원 아이디는 필수 입력사항입니다.</div>
				    </div>
				    <div class="form-group">
				      <input type="password" class="form-control w3-input" style="width:600px;height:60px;font-size:17px;" name="pwd" id="pwd" placeholder="휴대폰번호" required />
				      <div class="invalid-feedback">비밀번호는 필수 입력사항입니다.</div>
				    </div>
				    <div class="form-group">
				      <input type="text" class="form-control w3-input" style="width:600px;height:60px;font-size:17px;" name="order" id="order" placeholder="주문번호" required />
				    </div><br/>
				    <div class="form-group">
					    <button type="submit" class="btn btn-secondary-outline btn-block" style="width:600px; height:60px; font-size:17px; background-color:#c2935f; color: white;">주문조회</button><br>
				    </div>
				    <p style="color: #545454; font-size:15px" class="text-center">
				    주문번호를 모르신다면, 고객센터 1588-1234로 문의해주시길 바랍니다.</p><br/>
				  </form>
			  </div>
		  </div>
		</div>
		
		<div id="right">
		<img src="${ctp}/images/회원가입2.png" alt="회원가입2" width="70%"/><br/><br/>
		<img src="${ctp}/images/회원가입2-1.png" alt="회원가입2-1" width="100%"/>
		</div>
	</div><br/><br/><br/><br/>
<p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>