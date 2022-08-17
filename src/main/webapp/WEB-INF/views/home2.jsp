<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<title>Home</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
</head>
<style>
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important
    background-color: transparent;
    text-decoration: underline;
    color: balck;
    }

*{margin:0; padding:0;}
li{list-style:none;}

.slide_wrapper{
	position: relative;
	width: 1695px;
	margin: 0 auto;
	height:  740px;
	overflow:hidden;
}
.slides{
	position: absolute;
	left:0; top:0;	
}
.slides.animated{
	transition: 0.5s ease-out;
}
.slides li{
	width: 565px;
	height: 740px;
	/* position:absolute; */
	float:left;
}
.slides li:not(:last-child){	
	margin-right: 30px;
}


.controls{
	text-align: center;
	margin-top: 50px;
}

.controls span{
	color: #bbb;
	padding:50px;
	margin: 0 auto;
}

.parent {
    position: relative;
}

#absolute {
    /* 부모 요소인 parent를 기준으로 위치가 결정된다. */
    position: absolute;
		top: 10%;
    right:5%;
		margin: 0 auto;
}
#titleImg {border-radius: 0px 0px 0px 100px;}

.mySlides {display:none;}

#float1 {
	float: left;
}
#float2 {
	float: left;
}

#keyword1 {
	float: left;
}
#keyword2 {
	float: left;
}
.slick-prev {
    left: 0px;
            padding-bottom: 2px;
    &::before {
        content: "\f104";
    }
}

.slick-next {
    right: -25px;

    &::before {
        content: "\f105";
    }
}
</style>
<script type="text/javascript">
$(function(){
	   $('.slider-left').slick({
	        slide: 'div',
	        dots : true,
	        autoplay: true, // 자동 넘김 여부
	        infinite: true, //반복설정
	        speed: 1000, //슬라이드 속도
	        autoplaySpeed : 2000,   // 자동 넘김시 슬라이드 시간
	        pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤
	        vertical : false,  // 세로 방향 슬라이드 옵션
	        prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        
	        nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀
	        slidesToShow: 1, //보여질 슬라이드 수
	        slidesToScroll: 1 //넘겨질 슬라이드 수
	        
	      });
	   })
$(function(){
	   $('.slider-right').slick({
	        slide: 'div',
	        dots : true,
	       /*  arrows:true, // next, prev 이동 버튼 */
	        autoplay: true, // 자동 넘김 여부
	        infinite: true, //반복설정
	        speed: 1000, //슬라이드 속도
	        autoplaySpeed : 2000,   // 자동 넘김시 슬라이드 시간
	        pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤
	        vertical : false,  // 세로 방향 슬라이드 옵션
	        prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        
	        nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀
	        slidesToShow: 3, //보여질 슬라이드 수
	        slidesToScroll: 3 //넘겨질 슬라이드 수
	        
	      });
	   })
</script>
<script type="text/javascript">
$(function(){
	   $('.slider-left1').slick({
	        slide: 'div',
	        dots : true,
	       /*  arrows:true, // next, prev 이동 버튼 */
	        autoplay: true, // 자동 넘김 여부
	        infinite: true, //반복설정
	        speed: 1000, //슬라이드 속도
	        autoplaySpeed : 2000,   // 자동 넘김시 슬라이드 시간
	        pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤
	        vertical : false,  // 세로 방향 슬라이드 옵션
	        prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        
	        nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀
	        slidesToShow: 3, //보여질 슬라이드 수
	        slidesToScroll: 3 //넘겨질 슬라이드 수
	      });
	   })
$(function(){
	   $('.slider-right1').slick({
	        slide: 'div',
	        dots : true,
	        autoplay: true, // 자동 넘김 여부
	        infinite: true, //반복설정
	        speed: 1000, //슬라이드 속도
	        autoplaySpeed : 2000,   // 자동 넘김시 슬라이드 시간
	        pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤
	        vertical : false,  // 세로 방향 슬라이드 옵션
	        prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        
	        nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀
	        slidesToShow: 1, //보여질 슬라이드 수
	        slidesToScroll: 1 //넘겨질 슬라이드 수
	      });
	   })
</script>
<style>
#menu {
  width: 500px;
  margin: 0px auto;
  background: white;
  border: 0px solid;
  text-align: center;
}
#menu div {
  position: relative;
  display: inline-block;
}


/* 말풍선 적절한 top 과 margin-left 로 위치조정 */
.arrow_box {
  display: none;
  position: absolute;
  width: 50px;
  padding: 0px;
  left: 0;
  font-size: 14px;
}

.arrow_box:after {
  position: absolute;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: 0px solid;
  pointer-events: none;
  content: ' ';
}

span:hover + p.arrow_box {
  display: block;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>

<div class="parent" style="height: 440px; border:0px solid; margin: 0px; background-color: black;"></div>
<div class="slide_wrapper" id="absolute" style="padding-top:50px;">
	<ul class="slides animated" style="width: 3420px; transform: translateX(-1695px);"><li class="clone"><img src="${ctp}/images/magazine/K-053.jpg" alt="스타일4" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-035.jpg" id="titleImg" alt="스타일5" style="width:525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-036.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-037.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-038.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-039.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-040.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-041.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-042.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-043.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-044.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-045.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-046.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-047.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-048.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-049.jpg" alt="스타일3" id="titleImg" style="width: 525px; height: 740px;"/></li>
		<li><img src="${ctp}/images/magazine/K-053.jpg" id="titleImg" alt="스타일4" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-035.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-036.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-037.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-038.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-039.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-040.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-042.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-043.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-044.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-045.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-046.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-047.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-048.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
		<li><img src="${ctp}/images/magazine/K-049.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/></li>		
<li class="clone"><img src="${ctp}/images/magazine/K-053.jpg" id="titleImg" alt="스타일4" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-035.jpg" id="titleImg" alt="스타일5" style="width: 525px; height: 740px;"/><li class="clone"><img src="${ctp}/images/magazine/K-032.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-036.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-037.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-038.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-039.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-040.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-041.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-042.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-043.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-044.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-045.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-046.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-047.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-048.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li><li class="clone"><img src="${ctp}/images/magazine/K-049.jpg" id="titleImg" alt="스타일2" style="width: 525px; height: 740px;"/></li></li></ul>
</div >
<br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div class="text-center">
	<p class="controls" id="absolute1">
			<span class="prev"><i class="fa-solid fa-chevron-left fa-2x" style="margin-top:10px; padding-top: 0px; padding-right: 100px;"></i></span>
			<span class="next"><i class="fa-solid fa-chevron-right fa-2x" style="padding-right: 0px;"></i></span>
	</p>
</div><br/><br/><br/><br/>
<div style="padding: 0px 200px 50px 200px;" >
	<div id="keyword1" style="width:40%">
		<table>
			<tr>
				<td style="font-family: 'Gantari', sans-serif; font-size: 45px; padding:15px 0px;"><b>BRAND KEYWORD<br/>RANKING</b><br/></td>
			</tr>
			<tr>
				<td>
		    	<div id="menu">
		      	<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif;">
		        	<span><br/><a href="${ctp}/dbShop/dbProductList?part=TOMMY%20HILFIGER">&emsp;1. 타미힐피거</a></span><br/><br/><hr style="margin: 0px; padding:5px 0px; width: 500px;">
		      	</div>
		   		</div>
				</td>
			</tr>
			<tr>
				<td>
		    	<div id="menu">
		      	<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif;">
		        	<span><br/><a href="${ctp}/dbShop/dbProductList2?part=원피스">&emsp;2. 원피스</a></span><br/><br/><hr style="margin: 0px; padding:5px 0px; width: 500px;">
		      	</div>
		   		</div>
				</td>
			</tr>
			<tr>
				<td>
		    	<div id="menu">
		      	<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif;">
		        	<span><br/><a href="${ctp}/dbShop/dbProductList2?part=가방">&emsp;3. 가방</a></span><br/><br/><hr style="margin: 0px; padding:5px 0px; width: 500px;">
		      	</div>
		   		</div>
				</td>
			</tr>
			<tr>
				<td>
		    	<div id="menu">
		      	<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif;">
		        	<span><br/><a href="${ctp}/dbShop/dbProductList2?part=악세서리">&emsp;4. 악세서리</a></span><br/><br/><hr style="margin: 0px; padding:5px 0px; width: 500px;">
		      	</div>
		   		</div>
				</td>
			</tr>
			<tr>
				<td>
		    	<div id="menu">
		      	<div class="text-left" style="font-family: 'Noto Sans KR', sans-serif;">
		        	<span><br/><a href="${ctp}/dbShop/dbProductList2?part=수영복">&emsp;5. 수영복</a></span><br/><br/><hr style="margin: 0px; padding:5px 0px; width: 500px;">
		      	</div>
		   		</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="keyword2" style="width:60%">
		<table>
			<tr>
				<td rowspan="2"><a href="${ctp}/dbShop/dbProductContent?idx=4"><img src="${ctp}/images/home/K-641.jpg" onmouseover="this.src='${ctp}/images/home/K-640.jpg'" onmouseout="this.src='${ctp}/images/home/K-641.jpg'"></a></td>
				<td><a href="${ctp}/dbShop/dbProductContent?idx=100"><img src="${ctp}/images/home/K-642.jpg" onmouseover="this.src='${ctp}/images/home/K-643.jpg'" onmouseout="this.src='${ctp}/images/home/K-642.jpg'"></a></td>
				<td><a href="${ctp}/dbShop/dbProductContent?idx=135"><img src="${ctp}/images/home/K-644.jpg" onmouseover="this.src='${ctp}/images/home/K-645.jpg'" onmouseout="this.src='${ctp}/images/home/K-644.jpg'"></a></td>
				<td><a href="${ctp}/dbShop/dbProductContent?idx=136"><img src="${ctp}/images/home/K-646.jpg" onmouseover="this.src='${ctp}/images/home/K-647.jpg'" onmouseout="this.src='${ctp}/images/home/K-646.jpg'"></a></td>
			</tr>
			<tr>
				<td><img src="${ctp}/images/home/K-633.jpg"></td>
				<td><a href="${ctp}/dbShop/dbProductContent?idx=137"><img src="${ctp}/images/home/K-648.jpg" onmouseover="this.src='${ctp}/images/home/K-649.jpg'" onmouseout="this.src='${ctp}/images/home/K-648.jpg'"></a></td>
				<td><a href="${ctp}/dbShop/dbProductContent?idx=138"><img src="${ctp}/images/home/K-650.jpg" onmouseover="this.src='${ctp}/images/home/K-651.jpg'" onmouseout="this.src='${ctp}/images/home/K-650.jpg'"></a></td>
			</tr>
		</table>
	</div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><div>
	<div style="padding: 0px 100px 0px 100px;"><a href="${ctp}/option/event3-2"><img src="${ctp}/images/home/메인쿠폰1.jpg" width="50%"></a><a href="${ctp}/option/event3-2"><img src="${ctp}/images/home/메인쿠폰2.jpg" width="50%"></a></div>
</div><br/><br/><br/><br/>

<div style="margin: 0 auto; padding: 0px 100px 0px 100px;" class="text-center">
		<div class="w3-row">
			<div class="w3-col m7">
				<div>
					<div class="text-center" style="font-size:25pt; padding-top: 135px; padding-bottom: 15px; padding-left:40px; font-family: 'Gantari', sans-serif;"><b>BRAND</b></div>
					<div class="text-left" style="padding-bottom: 15px; padding-left:50px; font-family: 'Noto Sans KR', sans-serif;"><a href="${ctp}/dbShop/dbProductList">브랜드관 가기 ></a></div>
					<div class="slider-left1">
						<div style="width: 253px; height: 394px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=41"><img style="width: 253px; height: 394px;" src="${ctp}/images/home/home1-1.jpg">TOMMY HILFIGER<br/><font style="font-family:'Noto Sans KR', sans-serif;">[타미힐피거] 슬림 코튼 버뮤다 팬츠</font><br/><br/>88,000원</a></div>
						<div style="width: 253px; height: 394px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=42"><img style="width: 253px; height: 394px;" src="${ctp}/images/home/home1-2.jpg">TOMMY HILFIGER<br/><font style="font-family:'Noto Sans KR', sans-serif;">[타미힐피거] 레귤러 슬럽 테리 쇼츠</font><br/><br/>66,000원</a></div>
						<div style="width: 253px; height: 394px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=52"><img style="width: 253px; height: 394px;" src="${ctp}/images/home/home1-3.jpg">DKNY<br/><font style="font-family:'Noto Sans KR', sans-serif;">[DNKY] 링클 슬릿 포켓 셔츠</font><br/><br/>238,000원</a></div>
						<div style="width: 253px; height: 394px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=63"><img style="width: 253px; height: 394px;" src="${ctp}/images/home/home1-4.jpg">DKNY<br/><font style="font-family:'Noto Sans KR', sans-serif;">[DNKY] 틸리 DKNY 로고 클러치</font><br/><br/>242,000원</a></div>
						<div style="width: 253px; height: 394px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=81"><img style="width: 253px; height: 394px;" src="${ctp}/images/home/home1-5.jpg">DKNY<br/><font style="font-family:'Noto Sans KR', sans-serif;">[DNKY] 배색 립 슬리브리스 원피스</font><br/><br/>97,500원</a></div>
						<div style="width: 253px; height: 394px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=115"><img style="width: 253px; height: 394px;" src="${ctp}/images/home/home1-6.jpg">ck Calvin Klein<br/><font style="font-family:'Noto Sans KR', sans-serif;">[캘빈클라인인] 베이직 루즈핏 폴로 티셔츠</font><br/><br/>118,000원</a></div>
						<div style="width: 253px; height: 394px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=126"><img style="width: 253px; height: 394px;" src="${ctp}/images/home/home1-7.jpg">athe vanessabruno<br/><font style="font-family:'Noto Sans KR', sans-serif;">[athe] 베이지 포켓 장식 트위드 자켓</font><br/><br/>358,000원</a></div>
						<div style="width: 253px; height: 394px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=76"><img style="width: 253px; height: 394px;" src="${ctp}/images/home/home1-8.jpg">DKNY<br/><font style="font-family:'Noto Sans KR', sans-serif;">[DNKY] 크링클 드레싱 점퍼</font><br/><br/>245,000원</a></div>
						<div style="width: 253px; height: 394px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=15"><img style="width: 253px; height: 394px;" src="${ctp}/images/home/home1-9.jpg">TOMMY HILFIGER<br/><font style="font-family:'Noto Sans KR', sans-serif;">[타미힐피거] 서머 자켓</font><br/><br/>359,000원</a></div>
					</div>
				</div>
			</div>
			<div class="w3-col m1">
			</div>
			<div class="w3-col m5">
				<div class="slider-right1">
					<div style="width: 716px; height: 716px;"><a href="${ctp}/dbShop/season1-1"><img src="${ctp}/images/home/K-688.jpg" width="716px;" height="716px;"></a></div>
					<div style="width: 716px; height: 716px;"><a href="${ctp}/dbShop/season1-2"><img src="${ctp}/images/home/K-689.jpg" width="716px" height="716px;"></a></div>
				</div>
			</div>
		</div>
	</div><br/><br/><br/><br/>

<div style="padding-left: 80px; padding-right: 80px;"></div>
	<div class="text-left" id="float1" style="height:900px; padding-left: 80px;"><br/>
	  <img style=" width: 100%;" src="${ctp}/images/home/스가.jpg">
	</div>&emsp;
	<div class="text-left" id="float2" style="width:1050px; height:900px;"><br/>
	  <img style=" width: 100%;" src="${ctp}/images/home/스타일링가이드1.gif">
  </div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	
	<p>(DB)여기에 브랜드 베스트 / 카테고리 베스트 칸을 넣어주세요 <p>
	
	<p>(DB) H 샵을 넣어주세요 </p>
	<div style="width: 1700px; margin: 0 auto;" class="text-center">
		<div class="w3-row">
			<div class="w3-col m4">
				<div class="slider-left">
					<div style="width: 567px; height: 580px;"><a href="${ctp}/dbShop/season1-1"><img src="${ctp}/images/home/K-688.jpg" width="100%"></a></div>
					<div style="width: 567px; height: 580px;"><a href="${ctp}/dbShop/season1-2"><img src="${ctp}/images/home/K-689.jpg" width="100%"></a></div>
				</div>
			</div>
			<div class="w3-col m1">
			</div>
			<div class="w3-col m8">
				<div>
					<div class="slider-right">
						<div style="width: 322px; height: 580px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=41"><img style="width: 322px;" src="${ctp}/images/home/home1-1.jpg">TOMMY HILFIGER<br/><font style="font-family:'Noto Sans KR', sans-serif;">[타미힐피거] 슬림 코튼 버뮤다 팬츠</font><br/><br/>88,000원</a></div>
						<div style="width: 322px; height: 580px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=42"><img style="width: 322px;" src="${ctp}/images/home/home1-2.jpg">TOMMY HILFIGER<br/><font style="font-family:'Noto Sans KR', sans-serif;">[타미힐피거] 레귤러 슬럽 테리 쇼츠</font><br/><br/>66,000원</a></div>
						<div style="width: 322px; height: 580px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=52"><img style="width: 322px;" src="${ctp}/images/home/home1-3.jpg">DKNY<br/><font style="font-family:'Noto Sans KR', sans-serif;">[DNKY] 링클 슬릿 포켓 셔츠</font><br/><br/>238,000원</a></div>
						<div style="width: 322px; height: 580px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=63"><img style="width: 322px;" src="${ctp}/images/home/home1-4.jpg">DKNY<br/><font style="font-family:'Noto Sans KR', sans-serif;">[DNKY] 틸리 DKNY 로고 클러치</font><br/><br/>242,000원</a></div>
						<div style="width: 322px; height: 580px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=81"><img style="width: 322px;" src="${ctp}/images/home/home1-5.jpg">DKNY<br/><font style="font-family:'Noto Sans KR', sans-serif;">[DNKY] 배색 립 슬리브리스 원피스</font><br/><br/>97,500원</a></div>
						<div style="width: 322px; height: 580px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=115"><img style="width: 322px;" src="${ctp}/images/home/home1-6.jpg">ck Calvin Klein<br/><font style="font-family:'Noto Sans KR', sans-serif;">[캘빈클라인인] 베이직 루즈핏 폴로 티셔츠</font><br/><br/>118,000원</a></div>
						<div style="width: 322px; height: 580px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=126"><img style="width: 322px;" src="${ctp}/images/home/home1-7.jpg">athe vanessabruno<br/><font style="font-family:'Noto Sans KR', sans-serif;">[athe] 베이지 포켓 장식 트위드 자켓</font><br/><br/>358,000원</a></div>
						<div style="width: 322px; height: 580px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=76"><img style="width: 322px;" src="${ctp}/images/home/home1-8.jpg">DKNY<br/><font style="font-family:'Noto Sans KR', sans-serif;">[DNKY] 크링클 드레싱 점퍼</font><br/><br/>245,000원</a></div>
						<div style="width: 322px; height: 580px; margin-left: 50px; margin-right: 50px;"><a href="${ctp}/dbShop/dbProductContent?idx=15"><img style="width: 322px;" src="${ctp}/images/home/home1-9.jpg">TOMMY HILFIGER<br/><font style="font-family:'Noto Sans KR', sans-serif;">[타미힐피거] 서머 자켓</font><br/><br/>359,000원</a></div>
					</div>
				</div>
			</div>
		</div>
	</div><br/><br/><br/><br/>
	
	<!-- <p>(DB) H 셀렉션을 넣어주세요 </p> -->

<div class="text-center"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;">E - TV</font></div><br/>
<div class="w3-content">
  <div class="w3-row-padding w3-section">
    <div class="w3-col s4">
      <div class="jb-box">
		    <video muted autoplay loop width="100%">	
			      <source src="${ctp}/images/home/동영상1.mp4" type="video/mp4" style="width:100%;cursor:pointer" onclick="currentDiv(1)">
		    </video>
    	</div>
    </div>
    <div class="w3-col s4">
      <div class="jb-box">
		    <video muted autoplay loop width="100%">	
			      <source src="${ctp}/images/home/동영상2.mp4" type="video/mp4" style="width:100%;cursor:pointer" onclick="currentDiv(2)">
		    </video>
    	</div>
    </div>
    <div class="w3-col s4">
      <div class="jb-box">
		    <video muted autoplay loop width="100%">	
			      <source src="${ctp}/images/home/동영상3.mp4" type="video/mp4" style="width:100%;cursor:pointer" onclick="currentDiv(3)">
		    </video>
   	 </div>
    </div>
 	 </div>
</div>

<p><br/><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<script>
var slides = document.querySelector('.slides'),
slide = document.querySelectorAll('.slides li'),
currentIdx = 0,
slideCount = slide.length,
orgslideCount = slide.length,
prevBtn  =  document.querySelector('.prev'),
slideWidth = 565,
slideMargin = 30,
nextBtn = document.querySelector('.next');		

makeClone();

function makeClone(){
	for(var i = 0; i<slideCount;i++){				
		var cloneSlide = slide[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides.appendChild(cloneSlide);	
	}
	for(var i = orgslideCount -1; i>=0;i--){				
		var cloneSlide = slide[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides.prepend(cloneSlide);	
	}
	updateWidth();
	setInitialPos();

	setTimeout(function(){
		slides.classList.add('animated');
	},100);			
}		

function updateWidth(){
	var currentSlides = document.querySelectorAll('.slides li');
	slideCount = currentSlides.length;

	var newWidth = (slideWidth + slideMargin)*slideCount - slideMargin + 'px';
	slides.style.width = newWidth;
}
function setInitialPos(){
	var initialTransLateValue = -(slideWidth + slideMargin)*orgslideCount;
	console.log(initialTransLateValue);
	
	slides.style.transform = 'translateX('+initialTransLateValue+'px)';
}


function moveSlide(num){			
	slides.style.left = -num * (slideWidth + slideMargin) + 'px';

	currentIdx = num;

	if(orgslideCount == currentIdx ||  currentIdx == -orgslideCount ){
		//slides.classList.remove('animated');				

		setTimeout(function(){	
			slides.style.left = '0px';
			currentIdx = 0;
			slides.classList.remove('animated');		
		},500);	

		setTimeout(function(){		
			slides.classList.add('animated');		
		},700);				
		
		console.log(orgslideCount,currentIdx,'0 으로');		
		
	}			
	
}

nextBtn.addEventListener('click', function(){
	moveSlide(currentIdx + 1);
});
prevBtn.addEventListener('click', function(){		
	moveSlide(currentIdx - 1);
});
</script>
<script>
function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script>
</body>
</html>
