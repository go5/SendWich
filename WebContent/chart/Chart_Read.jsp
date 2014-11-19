<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="dto.ChartDTO"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>
<style>
		*{margin:0;padding:0;}
		div{padding:0px; overflow: hidden; height: auto;}
		.hgroup{padding:20px;background-color:#e9e9e9;}
		.hgroup h1{font-family:Tahoma;}
		.hgroup p{margin:10px 0;font-size:10px}
		h2{margin:0;padding:20px;border:1px solid #000;background-color:#f9f9f9;border-width:1px 0;font-family:Tahoma;}
	</style>

	<link rel='stylesheet' href='chart/Nwagon.css' type='text/css'>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="chart/Nwagon.js"></script>
</head>
<body>
<!-- 	디비 정보 불러오기 -->
	<%
		Vector ChartDto = (Vector)session.getAttribute("ChartDto");
		int val[]= new int[12];
		String key[] = new String[12];
		String title[] = new String[12];
		for(int i=0; i<ChartDto.size() ; i++){
			ChartDTO dto = (ChartDTO)ChartDto.get(i);
			val[i] = dto.getEva_value();
			key[i] = dto.getEva_key();
			title[i] = dto.getEva_type();
		}
		
		
// 		불러온 값을 차트에 뿌려질 ArrayList로 변경
	
		ArrayList data=new ArrayList();//항목
		ArrayList value=new ArrayList();//값
		ArrayList titles=new ArrayList();//값
		for(int i=0; i<title.length; i++){
			while(key[i] != null){
				data.add("'"+key[i]+"'");
				value.add(val[i]);
				titles.add(title[i]);
				break;
			}
		}
	for (int i =0; i<data.size(); i++){		
	%>
		<%= value %>
		<%= data %>
<%} %>
	<div id="chart1"></div>
	<script>
		// 차트 정보 js로 전달
		$(document).ready(function(){var options = {
			'legend':{
				// 항목
				names: <%= data %>,
					},
			'dataset': {
				title: 'none',
				// 항목값
				values: [<%= value%>],
				bgColor: '#f9f9f9',
				fgColor: '#cc79a7'
			},
			'chartDiv': 'chart1',
			'chartType': 'radar',
			'chartSize': {width:600, height:300}
		};
		Nwagon.chart(options);
		});
	</script>
</body>
</html>
