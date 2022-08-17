<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>magazine.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<script>
 $(function(){
   $(".s_box li:last").prependTo(".s_box");
   // $(".s_box").animate({marginLeft:"-=1200px"},1000, function(){
   // });
   $(".btn_next").click(function(){
     $(".s_box").animate({marginLeft:"-=1200px"},1000,function(){
       $(".s_box li:first").appendTo(".s_box");
       $(".s_box").stop().css("margin-left","-1200px");
     });
   });
   $(".btn_prev").click(function(){
     $(".s_box").animate({marginLeft:"+=1200px"},2000,function(){
       $(".s_box li:last").prependTo(".s_box");
       $(".s_box").stop().css("margin-left","-1200px");
     });
   });
   //강제 반복실행
   setInterval(function(){
     $(".btn_next").trigger("click");
   },3000);
 });
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
*{margin:0; padding:0;}
li{list-style:none;}

.slide_wrapper{
	position: relative;
	width: 1300px;
	margin: 0 auto;
	height: 610px;
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
	width: 407px;
	height: 610px;
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
	color: white;
	padding:50px;
	margin:30px 10px;
}

.parent {
    position: relative;
}

#absolute {
    /* 부모 요소인 parent를 기준으로 위치가 결정된다. */
    position: absolute;
		top: 450px;
    right: -200px;
    padding-top: 50px;
}
#titleImg {border-radius: 0px 0px 80px 0px;}

</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" /><br/>
<div class=text-left style="margin: 0px 0px 0px 80px;">
<a href="${ctp}/"><font style="font-size: 14px; color: #aaa;">HOME  ></font></a>  
<a href="${ctp}/member/magazine"><font style="font-size: 14px; color: #aaa;">MAGAZINE  ></font></a>  
<a href="${ctp}/member/magazine"><font style="font-size: 14px;">NEW</font></a>
</div><br/>
<div class="text-center"><font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;">MAGAZINE</font></div><br/>
<div class="pill-nav text-center">
  <a href="${ctp}/member/magazine" class="active" style="font-family: 'Gantari', sans-serif; margin-left: 70px;" href="#home">NEW</a>
  <a href="${ctp}/member/magazine2" style="font-family: 'Gantari', sans-serif;">STYLE</a>
  <a href="${ctp}/member/magazine3" style="font-family: 'Gantari', sans-serif;">LOOKBOOK</a>
</div><br/>
<div class="parent" style="width: 1150px; height: 550px; background-color: #c2935f; padding:0px; " >
	<div class="text-left" id="visual" style="width: 800px; height: 460; ">
	  <ul class="s_box">
	      <li><img src="${ctp}/images/magazine/매거진설명최종.gif" alt="1" width="100%"></li>
	  </ul>
  </div>
	<p class="controls" id="absolute1">
			<span class="prev"><i class="fa-solid fa-chevron-left" style="padding-top: 0px; padding-left: 250px;"></i></span>
			<span class="next"><i class="fa-solid fa-chevron-right"></i></span>
	</p>
</div>
<div class="slide_wrapper" id="absolute">
	<ul class="slides animated" style="width: 3420px; transform: translateX(-1150px);"><li class="clone"><img src="${ctp}/images/magazine/스타일1.jpg" id="titleImg" alt="스타일1" style="width: 407px; height: 610px;"></li><li class="clone"><img src="${ctp}/images/magazine/스타일2.jpg" id="titleImg" alt="스타일2" style="width: 407px; height: 610px;"/></li><li class="clone"><img src="${ctp}/images/magazine/스타일3.jpg" alt="스타일3" id="titleImg" style="width: 407px; height: 610px;"/></li><li class="clone"><img src="${ctp}/images/magazine/스타일4.jpg" alt="스타일4" id="titleImg" style="width: 407px; height: 610px;"/></li><li class="clone"><img src="${ctp}/images/magazine/스타일5.jpg" id="titleImg" alt="스타일5" style="width: 407px; height: 610px;"/></li>
		<li><img src="${ctp}/images/magazine/스타일111.jpg" id="titleImg" alt="스타일1" style="width: 407px; height: 610px;"/></li>
		<li><img src="${ctp}/images/magazine/스타일222.jpg" id="titleImg" alt="스타일2" style="width: 407px; height: 610px;"/></li>
		<li><img src="${ctp}/images/magazine/스타일3333.jpg" id="titleImg" alt="스타일3" style="width: 407px; height: 610px;"/></li>
		<li><img src="${ctp}/images/magazine/스타일4.jpg" id="titleImg" alt="스타일4" style="width: 407px; height: 610px;"/></li>		
		<li><img src="${ctp}/images/magazine/스타일5.jpg" id="titleImg" alt="스타일5" style="width: 407px; height: 610px;"/></li>		
	<li class="clone"><img src="${ctp}/images/magazine/스타일1.jpg" id="titleImg" alt="스타일1"  style="width: 407px; height: 610px;"/></li><li class="clone"><img src="${ctp}/images/magazine/스타일2.jpg" id="titleImg" alt="스타일2" style="width: 407px; height: 610px;"/></li><li class="clone"><img src="${ctp}/images/magazine/스타일3.jpg" id="titleImg" alt="스타일3" style="width: 407px; height: 610px;"/></li><li class="clone"><img src="${ctp}/images/magazine/스타일4.jpg" id="titleImg" alt="스타일4" style="width: 407px; height: 610px;"/></li><li class="clone"><img src="${ctp}/images/magazine/스타일5.jpg" id="titleImg" alt="스타일5" style="width: 407px; height: 610px;"/></li></ul>
</div ><br/>
<br/><br/><br/><br/><br/><br/><br/>
<div class="text-center"> <a href="${ctp}/member/magazine2"><font style="font-family: 'Gantari', sans-serif; font-size: 25pt; color:black;"><b> STYLE ></b></font></a></div><br/>
<div class="w3-row text-center" >
	<div id="style1" class="w3-third">
		<a href="${ctp}/member/magazine2-1"><img src="${ctp}/images/magazine/스타일111.jpg" style="width:80%; margin: 0px; padding: 0px;" onmouseover="this.src='${ctp}/images/magazine/스타일11-1.jpg'" onmouseout="this.src='${ctp}/images/magazine/스타일111.jpg'"></a>
	</div>
	<div id="style2" class="w3-third">
	<a href="${ctp}/member/magazine2-2"><img src="${ctp}/images/magazine/스타일222.jpg" style="width:80%" onmouseover="this.src='${ctp}/images/magazine/스타일22-1.jpg'" onmouseout="this.src='${ctp}/images/magazine/스타일222.jpg'"></a>
	</div>
	<div id="style3" class="w3-third">
	<a href="${ctp}/member/magazine2-3"><img src="${ctp}/images/magazine/스타일333.jpg" style="width:80%" onmouseover="this.src='${ctp}/images/magazine/스타일33-1.jpg'" onmouseout="this.src='${ctp}/images/magazine/스타일333.jpg'"></a>
	</div>
</div>
<br/><br/><br/><br/>
<div class="text-center"><font style="font-family: 'Gantari', sans-serif; font-size: 25pt; color:black;"><b>E-TV</b></font></div><br/>
<div class="text-center" style="width: 100%; ; background-color: #ddd; padding:0px; margin: 0px; ">
	<video width="25%" controls autoplay loop muted>
	  <source src="${ctp}/images/magazine/린넨스타일링.mp4" type="video/mp4">
	</video>
</div>
<br/><br/><br/>
<div class="text-center"> <a href="${ctp}/member/magazine3"><font style="font-family: 'Gantari', sans-serif; font-size: 25pt; color:black;"><b> LOOK BOOK ></b></font></a></div><br/>
<div style="width: 90%; margin: 0 auto;" class="text-center">
	<div class="w3-row-padding w3-padding-16 w3-center" id="lookbook">
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-1"><img src="${ctp}/images/magazine/룩북1.jpg" alt="룩북1" style="width:100%"></a><br/><br/>
	    <div class="text-left"><a href="${ctp}/member/magazine3-1"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">NBA KIDS | 22 S/S LOOKBOOK</font></a></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-2"><img src="${ctp}/images/magazine/룩북2.jpg" alt="룩북2" style="width:100%"></a><br/><br/>
	    <div class="text-left"><a href="${ctp}/member/magazine3-1"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">TOMMY HILFIGER 22SUPF<br/>LOOKBOOK</font></a></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-3"><img src="${ctp}/images/magazine/룩북3.jpg" alt="룩북3" style="width:100%"></a><br/><br/>
	    <div class="text-left"><a href="${ctp}/member/magazine3-1"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">TOMMY SHOES 22SUPF<br/>LOOKBOOK</font></a></div>
	  </div>
	  <div class="w3-quarter">
	    <a href="${ctp}/member/magazine3-4"><img src="${ctp}/images/magazine/룩북4.jpg" alt="룩북4" style="width:100%"></a><br/><br/>
	    <div class="text-left"><a href="${ctp}/member/magazine3-1"><font style="font-weight: 500; font-size: 18pt; font-family: 'Gantari', sans-serif;">TOMMY HILFIGER KIDS<br/>22SUPF LOOKBOOK</font></a></div>
	  </div>
	</div>
</div>
<br/><br/><br/><br/><br/>
<p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script>
var slides = document.querySelector('.slides'),
slide = document.querySelectorAll('.slides li'),
currentIdx = 0,
slideCount = slide.length,
orgslideCount = slide.length,
prevBtn  =  document.querySelector('.prev'),
slideWidth = 407,
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
</body>
</html>