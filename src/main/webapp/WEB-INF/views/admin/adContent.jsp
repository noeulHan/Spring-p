<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>adContent</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
</head>
<script>
    'use strict';
    
    function chartChange() {
    	let part = document.getElementById("part").value;
    	
    	let str = "";
    	if(part == "pie") {
    		str += '<form name="chartForm" method="post" action="googleChart2">';
    		str += '<table class="table table-bordered text-center">';
    		str += '<tr>';
    		str += '<th class="bg-secondary">차트제목</th><td colspan="3" class="bg-secondary"><input type="text" name="title" size="30" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<th class="bg-light">범례1</th><td><input type="text" name="subTitle1" class="form-control"/></td>';
    		str += '<th>값1</th><td><input type="number" name="value1" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<th class="bg-light">범례2</th><td><input type="text" name="subTitle2" class="form-control"/></td>';
    		str += '<th class="bg-light">값2</th><td><input type="number" name="value2" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<th class="bg-light">범례3</th><td><input type="text" name="subTitle3" class="form-control"/></td>';
    		str += '<th class="bg-light">값3</th><td><input type="number" name="value3"  class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<th class="bg-light">범례4</th><td><input type="text" name="subTitle4" class="form-control"/></td>';
    		str += '<th class="bg-light">값4</th><td><input type="number" name="value4" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<th class="bg-light">범례5</th><td><input type="text" name="subTitle5" class="form-control"/></td>';
    		str += '<th class="bg-light">값5</th><td><input type="number" name="value5" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<td colspan="4"><input type="button" value="차트그리기" onclick="chartShow(\'pie\')" class="btn btn-primary form-control"/></td>';
    		str += '</tr></table>';
    		str += '<input type="hidden" name="part" id="part">';
    		str += '</form>';
    	}
    	else if(part == "barV") {
    		str += '<form name="chartForm" method="post" action="googleChart2">';
    		str += '<table class="table table-bordered text-center">';
    		str += '<tr><th class="bg-secondary">차트 주제목</th><td colspan="4" class="bg-secondary"><input type="text" name="title" size="30" class="form-control"/></td></tr>';
    		str += '<tr><th class="bg-secondary">차트 부제목</th><td colspan="4" class="bg-secondary"><input type="text" name="subTitle" size="30" class="form-control"/></td></tr>';
    		str += '<tr>';
    		str += '<th colspan="2">범례</th>';
    		str += '<td><input type="text" name="legend1" class="form-control"/></td>';
    		str += '<td><input type="text" name="legend2" class="form-control"/></td>';
    		str += '<td><input type="text" name="legend3" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<th>X축1</th><td><input type="text" name="x1" class="form-control"/></td>';
    		str += '<td><input type="number" name="x1Value1" class="form-control"/></td>';
    		str += '<td><input type="number" name="x1Value2" class="form-control"/></td>';
    		str += '<td><input type="number" name="x1Value3" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<th>X축2</th><td><input type="text" name="x2" class="form-control"/></td>';
    		str += '<td><input type="number" name="x2Value1" class="form-control"/></td>';
    		str += '<td><input type="number" name="x2Value2" class="form-control"/></td>';
    		str += '<td><input type="number" name="x2Value3" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<th>X축3</th><td><input type="text" name="x3" class="form-control"/></td>';
    		str += '<td><input type="number" name="x3Value1" class="form-control"/></td>';
    		str += '<td><input type="number" name="x3Value2" class="form-control"/></td>';
    		str += '<td><input type="number" name="x3Value3" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<th>X축4</th><td><input type="text" name="x4" class="form-control"/></td>';
    		str += '<td><input type="number" name="x4Value1" class="form-control"/></td>';
    		str += '<td><input type="number" name="x4Value2" class="form-control"/></td>';
    		str += '<td><input type="number" name="x4Value3" class="form-control"/></td>';
    		str += '</tr>';
    		str += '<tr>';
    		str += '<td colspan="5"><input type="button" value="차트그리기" onclick="chartShow(\'barV\')" class="btn btn-primary form-control"/></td>';
    		str += '</tr></table>';
    		str += '<input type="hidden" name="part" id="part">';
    		str += '</form>';
    	}
    	else if(part == "line") {
    		chartShow('line');
    	}
    	$("#demo").html(str);
    }
    function chartShow(part) {
    	if(part != "line") {
	    	document.chartForm.part.value = part;
	    	chartForm.submit();
    	}
    	else {
    		location.href = '${ctp}/admin/googleChart2Recently?part=lineChartVisitCount';
    	}
    }
  </script>
  <head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['방문날짜', '${legend}'],
        <%--
        ['${visitDates[6]}', ${visitCounts[6]}],
        ['${visitDates[5]}', ${visitCounts[5]}],
        ['${visitDates[4]}', ${visitCounts[4]}],
        ['${visitDates[3]}', ${visitCounts[3]}],
        ['${visitDates[2]}', ${visitCounts[2]}],
        ['${visitDates[1]}', ${visitCounts[1]}],
        ['${visitDates[0]}', ${visitCounts[0]}]
        --%>
        <c:forEach var="i" begin="0" end="6" varStatus="st">
				  ['${visitDates[6-i]}', ${visitCounts[6-i]}],
				</c:forEach>
      ]);

      var options = {
        chart: {
          title: '${title}',
          subtitle: '${subTitle}'
        }
      };

      var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

      chart.draw(data, google.charts.Bar.convertOptions(options));
    }
  </script>
<style>
	body {
	font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<body>
<p><br/></p>
<div class="container" style="font-family: 'Noto Sans KR', sans-serif;">
	<div style="font-size: 15px;">나중에 통계 넣기</div>
<hr/>
<div>
    <p>학습할 차트 선택하세요..
      <select name="part" id="part" onchange="chartChange()">
        <option value="">차트선택</option>
        <option value="barV" ${vo.part == 'barV' ? 'selected' : ''}>수직막대차트</option>
        <option value="pie" ${vo.part == 'pie' ? 'selected' : ''}>원형차트</option>
        <option value="line" ${part == 'lineChartVisitCount' ? 'selected' : ''}>최근방문자수</option>
      </select>
    </p>
    <hr/>
    <div id="demo"></div>
    <div>
      
    </div>
    <hr/>
  </div>
<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
</div>
</body>
</html>