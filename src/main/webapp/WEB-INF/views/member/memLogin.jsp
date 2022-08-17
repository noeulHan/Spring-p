<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memLogin.jsp</title>
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
			      <a class="nav-link active" href="${ctp}/member/memLogin" style="font-family: 'Noto Sans KR', sans-serif;"><b>통합회원</b></a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="${ctp}/member/memLogin2" style="font-family: 'Noto Sans KR', sans-serif;"><b>비회원</b></a>
			    </li>
			  </ul>
			</div>
			  <div class="container borderless" style="width:45%">
				  <form name="myForm" method="post" action="${ctp}/member/memLogin" style="width: 600px; font-family: 'Noto Sans KR', sans-serif;"><br/><br/>
				    <p style="color: #777777; font-size:17px" class="text-center">
					    가입할때 등록하신 '개인 아이디' 혹은 <br/>
			 	 			가입시 사용한 카카오톡 아이디로 로그인이 가능합니다.</p><br/>
				    <div class="form-group">
				      <input type="text" class="form-control w3-input" style="width:600px;height:60px;font-size:17px;" name="mid" id="mid" value="${mid}" placeholder="E-fashion mall 아이디" required autofocus />
				      <div class="valid-feedback">입력성공</div>
				      <div class="invalid-feedback">회원 아이디는 필수 입력사항입니다.</div>
				    </div>
				    <div class="form-group">
				      <input type="password" class="form-control w3-input" style="width:600px;height:60px;font-size:17px;" name="pwd" id="pwd" placeholder="E-fashion mall 비밀번호" required />
				      <div class="invalid-feedback">비밀번호는 필수 입력사항입니다.</div>
				    </div>
				    <div class="row" style="font-size:15px">
			      <span class="col"><input type="checkbox" name="idCheck" checked /> 아이디 저장</span> 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span class="col"><a href="${ctp}/member/memIdPwdSearch">아이디</a> | <a href="${ctp}/member/memIdPwdSearchP">비밀번호찾기</a></span>
			    	</div><br/>
				 		 <div class="form-group">
					    <button type="submit" class="btn btn-secondary-outline btn-block" style="width:600px; height:60px; margin-bottom:0px; font-size:17px; font-family: 'Noto Sans KR', sans-serif; background-color:#c2935f; color: white;">로그인</button><br>
					    <a href="https://kauth.kakao.com/oauth/authorize?client_id=47a8628946e7c2ba0c980cc9799fa8c7&redirect_uri=http://localhost:9090/javagreenS_hne/kakao/kakaoMain&response_type=code">
					    <!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=47a8628946e7c2ba0c980cc9799fa8c7&redirect_uri=http://49.142.157.251:9090/javagreenS_hne/kakao/kakaoMain&response_type=code"> -->
					    	<button type="button" class="btn btn-outline-secondary btn-block" style="width:600px; height:60px; font-size:17px; font-family: 'Noto Sans KR', sans-serif;"><i class="fa-solid fa-comments"></i>&emsp;카카오 로그인</button><br>
				   		</a>
				    </div>
				  </form>
			  </div>
		  </div>
		</div>
		
		<div id="right">
		<img src="${ctp}/images/회원가입1-1.png" alt="회원가입2" width="60%"/><br/>
		<a href="${ctp}/member/memJoin"><font style="font-family: 'Noto Sans KR', sans-serif;"><b>회원가입 ></b></font></a><br/>
		<img src="${ctp}/images/회원가입1.png" alt="회원가입2-1" width="85%"/>
		</div>
	</div><br/><br/><br/><br/>
<p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>