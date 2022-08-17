<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>adMemberList.jsp</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
  <script>
    // 회원 등급변경을 ajax로 처리해본다.
    function levelCheck(obj) {
    	var ans = confirm("회원등급을 변경하시겠습니까?");
    	if(!ans) {
    		location.reload();
    		return false;
    	}
    	var str = $(obj).val();
    	var query = {
    			idx : str.substring(1),
    			level : str.substring(0,1)
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/admin/adMemberLevel",
    		data : query,
    		error:function() {
    			alert("등급이 변경되었습니다.");
    		}
    	});
    }
    
    // 회원 탈퇴처리(회원정보삭제)
    function memberReset(idx) {
    	var ans = confirm("정말로 탈퇴처리 하시겠습니까?");
    	if(ans) location.href="${ctp}/admin/adMemberReset?idx="+idx;
    }
    
    // 회원등급별 검색
    function levelSearch() {
    	var level = adminForm.level.value;
    	location.href = "${ctp}/admin/adMemberList?level="+level;
    }
    
    // 개별회원 검색
    function midSearch() {
    	var mid = adminForm.mid.value;
    	if(mid == "") {
    		alert("아이디를 입력하세요?");
    		adminForm.mid.focus();
    	}
    	else {
    		location.href = "${ctp}/admin/adMemberList?mid="+mid;
    	}
    }
  </script>
</head>
<body>
<p><br></p>
<div class="container" style="font-family: 'Noto Sans KR', sans-serif;">
  <form name="adminForm">
	  <table class="table table-borderless m-0">
	    <tr>
	      <td colspan="2">
	        <c:choose>
	          <c:when test="${level==2}"><c:set var="title" value="탈퇴"/></c:when>
	          <c:when test="${level==1}"><c:set var="title" value="일반"/></c:when>
	        </c:choose>
	        <c:if test="${!empty mid}"><c:set var="title" value="${mid}"/></c:if>
	        <div style="text-align:center;font-size:20px; font-family: 'Noto Sans KR', sans-serif;"><font color="#c39869;">${title} 회원</font> 리스트</div>
	      </td>
	    </tr>
	    <tr>
	      <td style="text-align:left">
	        <input type="text" name="mid" value="${mid}" placeholder="검색할아이디입력"/>
	        <input type="button" value="개별검색" onclick="midSearch()" class="btn btn-outline-secondary btn-sm"/>
	        <input type="button" value="전체보기" onclick="location.href='${ctp}/admin/adMemberList';" class="btn btn-outline-secondary btn-sm"/>
	      </td>
	      <td style="text-align:right">회원등급  
	        <select name="level" onchange="levelSearch()">
	          <option value="2" <c:if test="${level==2}">selected</c:if>>탈퇴회원</option>
	          <option value="1" <c:if test="${level==1}">selected</c:if>>일반회원</option>
	        </select>
	      </td>
	    </tr>
	  </table>
  </form>
  <table class="table table-hover" style="font-family: 'Noto Sans KR', sans-serif;">
    <tr class="text-center">
      <th>번호</th>
      <th>아이디</th>
      <th>성명</th>
      <th>최종접속일</th>
      <th>등급</th>
      <th>탈퇴유무</th>
    </tr>
    <c:set var="cs" value="${pageVo.curScrStartNo + 1}"/>
    <c:forEach var="vo" items="${vos}">
    	<tr class="text-center">
    	  <td>${cs}</td>
    	  <td>${vo.mid}</td>
    	  <td>
    	    ${vo.name}
    	  </td>
    	  <td>${vo.lastDate}</td>
    	  <td>
  	      <select name="level" onchange="levelCheck(this)">
  	        <option value="2${vo.idx}" <c:if test="${vo.level==2}">selected</c:if>>탈퇴회원</option>
  	        <option value="1${vo.idx}" <c:if test="${vo.level==1}">selected</c:if>>일반회원</option>
  	        <option value="0${vo.idx}" <c:if test="${vo.level==0}">selected</c:if>>관리자</option>
  	      </select>
    	  </td>
    	  <td>
    	    <c:if test="${vo.userDel=='OK'}"><a href="javascript:memberReset(${vo.idx})"><font color=red>탈퇴신청</font></a></c:if>
    	    <c:if test="${vo.userDel!='OK'}">활동중</c:if>
    	  </td>
    	</tr>
    	<c:set var="cs" value="${cs + 1}"/>
    </c:forEach>
  </table>
  <br/>
	<!-- 블록 페이징 처리 시작 -->
	<div class="text-center">
	  <ul class="pagination justify-content-center" style="font-family: 'Noto Sans KR', sans-serif;">
		  <c:if test="${pageVO.pag > 1}">
		    <li class="page-item"><a href="adMemberList?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
		  </c:if>
		  <c:if test="${pageVO.curBlock > 0}">
		    <li class="page-item"><a href="adMemberList?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-left"></i></a></li>class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-backward"></i></a></li>
		  </c:if>
		  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
		    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
		      <li class="page-item active"><a href="adMemberList?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-dark bg-white border-secondary" style="border: 0px; font-weight: bold;">${i}</a></li>
		    </c:if>
		    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
		      <li class="page-item"><a href='adMemberList?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary" style="border: 0px;">${i}</a></li>
		    </c:if>
		  </c:forEach>
		  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
		    <li class="page-item"><a href="adMemberList?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-caret-right"></i></a></li>
		  </c:if>
		  <c:if test="${pageVO.pag != pageVO.totPage}">
		    <li class="page-item"><a href="adMemberList?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary" style="border: 0px;"><i class="fa-solid fa-forward"></i></a></li>
		  </c:if>
	  </ul>
	</div>
	<!-- 블록 페이징 처리 끝 -->
<%-- <!-- 페이징처리 시작 -->
<c:if test="${totPage == 0}"><p style="text-align:center"><font color="red"><b>자료가 없습니다.</b></font></p></c:if>
<c:if test="${totPage != 0}">
	<div style="text-align:center">
	  <c:if test="${pag != 1}"><a href="${ctp}/admin/adMemberList?pag=1&level=${level}">◁◁</a></c:if> &nbsp;&nbsp;
	  <c:if test="${pag > 1}"><a href="${ctp}/admin/adMemberList?pag=${pag-1}&level=${level}">◀</a></c:if>
	  &nbsp;&nbsp; ${pag}Page / ${totPage}pages &nbsp;&nbsp;
	  <c:if test="${pag < totPage}"><a href="${ctp}/admin/adMemberList?pag=${pag+1}&level=${level}">▶</a></c:if> &nbsp;&nbsp;
	  <c:if test="${pag != totPage}"><a href="${ctp}/admin/adMemberList?pag=${totPage}&level=${level}">▷▷</a></c:if>
	</div>
</c:if>
<!-- 페이징처리 끝 --> --%>

</div>
<br/>
</body>
</html>