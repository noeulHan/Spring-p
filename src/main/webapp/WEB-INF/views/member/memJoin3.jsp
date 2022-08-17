<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memJoin3.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <style>
	.icon {
	    width: 65px;
	    height: 65px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin : 5px;
	    font-family: 'Noto Sans KR', sans-serif;
	    }
	#join1 {
	    border-radius: 10%;
	    border:1px solid;
	    border-color: #e2e2e2;
	    overflow: hidden;
	    }
	#join2 {
	    border-radius: 10%;
	    border:1px solid;
	    border-color: #e2e2e2;
	    overflow: hidden;
	    }
	#join1:hover {
		box-shadow: 1px 1px 20px #ccc;
		}
	#join2:hover {
		box-shadow: 1px 1px 20px #ccc;
		}
		
	 .find-btn{
		text-align: center;
	}
	.find-btn1{
		display :inline-block;
	}
	
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<div class="container borderless" style="width:50%"><br/><br/>
	  <div class="text-center"><font class="font-weight-bold" style="font-family: 'Noto Sans KR', sans-serif; font-size: 35pt; color:black;">통합회원가입</font></div><br/>
	    <p style="color: #777777; font-size:19px" class="text-center">
			    <b>회원가입 완료. E 패션몰의 회원이 되신걸 축하드립니다!</b> <br/><br/>
	  <div>
		 	<table style="margin-left: auto; margin-right: auto;">
			<tr>
					<td id="1" class="text-center">
							<img class="icon" src="${ctp}/images/member/유저아이콘.jpg" style="margin-right: 100px;"><br/>
							<span><font style="color: #777777; margin-right: 100px; font-family: 'Noto Sans KR', sans-serif;">가입방법</font></span><br/>
					</td>
					<td id="2" class="text-center">
			      	<img class="icon" src="${ctp}/images/member/연필아이콘1.jpg" style="margin-right: 100px;"><br/>
			        <span><font style="color: #777777; margin-right: 100px; font-family: 'Noto Sans KR', sans-serif;">정보입력</font></span>
					</td>
					<td id="3" class="text-center">
			      	<img class="icon" src="${ctp}/images/member/체크아이콘1.jpg"><br/>
			        <strong><font style="font-family: 'Noto Sans KR', sans-serif;">가입완료</font></strong>
					</td>
				</tr>
			</table>
		</div><br/>
		<meta http-equiv="refresh" content="3;url=${ctp}/member/memLogin">
		<div class="text-center">
		<img src="${ctp}/images/member/축하.jpg" width="50%"/></div>
		<div class="text-center">
		 <div class="spinner-border text-muted"></div><br/>
		 <font style="color: #aaa; font-size: 15px; font-family: 'Noto Sans KR', sans-serif;">3초 후 로그인 창으로 자동 이동합니다.</font></div><br/>
		<div class="find-btn">
	    <a href="${ctp}/"><button type="button" id="button1" class="btn btn-outline-secondary navbar-btn find-btn1" style="WIDTH: 155pt; HEIGHT: 50pt; font-size: 20pt; font-family: 'Noto Sans KR', sans-serif;">메인으로</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
	    <button type="button" id="button2" class="btn navbar-btn find-btn1" onclick="fCheck()" style="WIDTH: 155pt; HEIGHT: 50pt; font-size: 20pt; background-color: #97a0d9; color: white; font-family: 'Noto Sans KR', sans-serif;">로그인</button>
		</div>
</div>
<p><br/></p>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>