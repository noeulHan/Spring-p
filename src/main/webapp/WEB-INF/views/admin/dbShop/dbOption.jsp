<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbOption.jsp(상품의 옵션 등록)</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
  <script>
    var cnt = 1;
    
    // 옵션항목 추가
    function addOption() {
    	var strOption = "";
    	var test = "t" + cnt; 
    	
    	strOption += '<div id="'+test+'"><hr size="5px"/>';
    	strOption += '<font size="4"><b>상품옵션등록</b></font>&nbsp;&nbsp;';
    	strOption += '<input type="button" value="옵션삭제" class="btn btn-outline-secondary btn-sm" onclick="removeOption('+test+')"/><br/>'
    	strOption += '상품옵션이름';
    	strOption += '<input type="text" name="optionName" id="optionName'+cnt+'" class="form-control"/>';
    	strOption += '<div class="form-group">';
    	strOption += '상품옵션가격';
    	strOption += '<input type="text" name="optionPrice" id="optionPrice'+cnt+'" class="form-control"/>';
    	/* strOption += '<input type="text" name="optionPrice" id="optionPrice'+cnt+'" class="form-control"/>'; */
    	strOption += '</div>';
    	strOption += '</div>';
    	$("#optionType").append(strOption);
    	cnt++;
    }
    
    // 옵션항목 삭제
    function removeOption(test) {
    	/* $("#"+test).remove(); */
    	$("#"+test.id).remove();
    }
    
    // 옵션체크후 등록전송
    function fCheck() {
    	for(var i=1; i<=cnt; i++) {
    		if($("#t"+i).length != 0 && document.getElementById("optionName"+i).value=="") {
    			alert("빈칸 없이 상품 옵션명을 모두 등록하셔야 합니다");
    			return false;
    		}
    		else if($("#t"+i).length != 0 && document.getElementById("optionPrice"+i).value=="") {
    			alert("빈칸 없이 상품 옵션가격을 모두 등록하셔야 합니다");
    			return false;
    		}
    	}
    	if(document.getElementById("optionName").value=="") {
    		alert("상품 옵션이름을 등록하세요");
    		return false;
    	}
    	else if(document.getElementById("optionPrice").value=="") {
    		alert("상품 옵션가격을 등록하세요");
    		return false;
    	}
    	else if(document.getElementById("productName").value=="") {
    		alert("상품명을 선택하세요");
    		return false;
    	}
    	else {
    		myForm.submit();
    	}
    }
    
    // 상품명을 선택하면 상품의 설명을 띄워준다.
    function productNameCheck() {
    	var productName = document.getElementById("productName").value;
    	$.ajax({
    		type:"post",
    		url : "${ctp}/dbShop/getProductInfor",
    		data: {productName : productName},
    		success:function(vos) {
    			str = '<hr/><div class="row">';
    			str += '<div class="col">';
    		/* 	str += '대분류명 : '+vos[0].categoryMainName+'<br/>';
    			str += '중분류명 : '+vos[0].categoryMiddleName+'<br/>';
    			str += '소분류명 : '+vos[0].categorySubName+'<br/>'; */
    			str += '상 품 명 : '+vos[0].productName+'<br/>';
    			str += '설명 : '+vos[0].detail+'<br/>';
    			str += '상품가격 : '+numberWithCommas(vos[0].mainPrice)+'원<br/>';
    			str += '<input type="button" value="등록된옵션보기(삭제)" onclick="optoinShow('+vos[0].idx+')" class="btn btn-outline-secondary btn-sm"/><br/>';
    			str += '</div>';
    			str += '<div class="col">';
    			str += '<img src="${ctp}/dbShop/product/'+vos[0].fsname+'" width="160px"/><br/>';
    			str += '</div>';
    			str += '</div><hr/>';
    			str += '<div id="optionDemo"></div>';
    			$("#demo").html(str);
    			document.myForm.productIdx.value = vos[0].idx;
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 옵션상세내역보기
    function optoinShow(productIdx) {
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/getOptionList",
    		data : {productIdx : productIdx},
    		success:function(vos) {
    			if(vos.length != 0) {
						str = "옵션 : / ";
	    			for(let i=0; i<vos.length; i++) {
	    				str += '<a href="javascript:optionDelete('+vos[i].idx+')">';
							str += vos[i].optionName + "</a> / ";
	    			}
    			}
    			else {
    				str = "현 상품에 등록된 옵션이 없습니다.";
    			}
					$("#optionDemo").html(str);
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 옵션항목 삭제하기
    function optionDelete(idx) {
    	let ans = confirm("현재 선택한 옵션을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/optionDelete",
    		data : {idx : idx},
    		success:function() {
    			alert("삭제되었습니다.");
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 콤마찍기
    function numberWithCommas(x) {
		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container" style="width: 800px;">
   <div style="font-family: 'Noto Sans KR', sans-serif; font-size: 15pt;">상품 옵션 등록</div><hr/>
  <form name="myForm" method="post" style="font-family: 'Noto Sans KR', sans-serif; font-size: 11pt;">
    <div class="form-group" style="font-family: 'Noto Sans KR', sans-serif; font-size: 11pt;">
      <label for="productName">상품명(모델명/회사명)</label>
      <select name="productName" id="productName" class="form-control" onchange="productNameCheck()">
        <option value="">상품선택</option>
        <c:forEach var="productName" items="${productNames}">
          <option value="${productName}">${productName}</option>
        </c:forEach>
      </select>
      <div id="demo"></div>
    </div>
    <hr/>
    <input type="button" value="옵션박스 추가하기" onclick="addOption()" class="btn btn-outline-secondary btn-sm"/><br/>
    <div class="form-group" style="font-family: 'Noto Sans KR', sans-serif; font-size: 13pt;">
      <label for="optionName">상품옵션이름</label>
      <input type="text" name="optionName" id="optionName" class="form-control"/>
    </div>
    <div class="form-group" style="font-family: 'Noto Sans KR', sans-serif; font-size: 13pt;">
      <label for="optionPrice">상품옵션가격</label>
      <input type="text" name="optionPrice" id="optionPrice" class="form-control"/>
    </div>
    <div id="optionType" style="font-family: 'Noto Sans KR', sans-serif; font-size: 13pt;"></div>
    <hr/>
    <div class='text-right'><input type="button" value="옵션등록" onclick="fCheck()" class="btn btn-primary-outline" style="background-color: #c2935f; color: white;"/></div>
    <input type="hidden" name="productIdx">
  </form>
</div>
<p><br/></p>
</body>
</html>