<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ChartDTO"%>
<%@page import="java.util.Vector"%>
<html>
<head>
	<meta charset="utf-8">

	<style>
		*{margin:0;padding:0;}
		div{padding:0px; overflow: hidden; height: auto;}
		.hgroup{padding:20px;background-color:#e9e9e9;}
		.hgroup h1{font-family:Tahoma;}
		.hgroup p{margin:10px 0;font-size:10px}
		h2{margin:0;padding:20px;border:1px solid #000;background-color:#f9f9f9;border-width:1px 0;font-family:Tahoma;}
	</style>

	<link rel='stylesheet' href='chart/Nwagon.css' type='text/css'>
	<script src='chart/Nwagon.js'></script>
</head>
<body>
		<!-- 	디비 정보 불러오기 -->
	<%
		Vector ChartDto = (Vector)session.getAttribute("ChartDto");
		int val[]= new int[36];
		String key[] = new String[36];
		String title[] = new String[36];
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
%>
	<div id="chart11"></div>
	<script>
		var options = {
			'legend':{
				names: <%=data%>,
					},
			'dataset': {
				title: 'Web accessibility status',
				values: [<%=value%>], 
				bgColor: '#f9f9f9',
				fgColor: '#cc79a7'
			},
			'chartDiv': 'chart11',
			'chartType': 'radar',
			'chartSize': {width:600, height:300}
		};
		Nwagon.chart(options);
	</script>
</body>
</html>
