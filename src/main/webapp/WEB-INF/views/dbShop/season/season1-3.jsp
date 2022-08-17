<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>season1-3.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<style>
a { text-decoration:none !important }
a:hover { text-decoration:none !important
    background-color: transparent;
    text-decoration: underline;
    color: black;
    }
    
#productImgR {
	border-radius: 40px 0px 0px 0px
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header_home.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/><P>
<div class=text-left style="margin: 0px 0px 0px 80px;">
	<a href="${ctp}/"><font style="font-size: 14px; color: #aaa; font-family: 'Noto Sans KR', sans-serif;">HOME  ></font></a>  
	<a href="${ctp}/dbShop/season"><font style="font-size: 14px; font-family: 'Noto Sans KR', sans-serif; color: #aaa;">기획전  ></font></a>
	<a href="${ctp}/dbShop/season1-3"><font style="font-size: 14px;">SUMMER VACANCE CITY HOLLYDAY ITEM</font></a>  
</div><br/>
<div style="padding-left: 80px; padding-right: 120px; margin-bottom: 0px;">
	<font style="font-size: 12pt; font-family: 'Gantari', sans-serif;">2022.08.01 ~ 2022.09.13</font>
</div><br/><br/>
<img src="${ctp}/images/season/spe_intro.jpg" width="110%"/><br/>
<img src="${ctp}/images/season/spe_sec01_01.jpg" width="110%"/><br/><br/><br/>
<div style="padding: 0px 180px;">
<br/><hr style="padding-left: 350px; padding-right: 350px; margin-bottom: 0px; border-top: 1px solid; background: transparent;" class="text-center"><br/><br/><br/>
<font class="font-weight-bold" style="font-family: 'Gantari', sans-serif; font-size: 35pt; color:black;">
 <div class="text-center" style="padding-bottom: 0px;">SALES LIST</div></font><br/></br/>
<c:set var="cnt" value="0"/>
  <div class="row">
    <c:forEach var="vo" items="${Vos}">
      <div class="col" style="margin-bottom: 30px;">
        <div style="width:295px; height:505px; text-align:left; font-size:9pt; font-family: 'Noto Sans KR', sans-serif; margin-left: 0px; margin-right: 0px;">
          <a href="${ctp}/dbShop/dbProductContent?idx=${vo.idx}">
            <img style="margin-bottom: 5px;" src="${ctp}/dbShop/product/${vo.FSName}" width="100%" id="productImgR"/>
            <div><font color="#c39869;" size="2">${MainName}</font></div>
            <div><font size="2">${vo.productName}</font></div>
            <div><font size="2"><fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>원</font></div>
          </a>
        </div>
      </div>
      <c:set var="cnt" value="${cnt+1}"/>
      <c:if test="${cnt%4 == 0}">
        </div>
        <div class="row mt-5">
      </c:if>
    </c:forEach>
    <c:if test="${!empty Vos}">
	    <div class="container">
	      <c:if test="${fn:length(Vos) == 0}"><h3>제품 준비 중입니다.</h3></c:if>
	    </div>
  	</c:if>
  </div><hr/>
</div>
<p><br/><P><p><br/><P>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>