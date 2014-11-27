<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ChartDTO"%>
<%@page import="java.util.Vector"%>


	<link rel='stylesheet' href='chart/Nwagon.css' type='text/css'>
	<script src='chart/Nwagon.js'></script>
	<%
	Vector ChartDto;
		ChartDto = (Vector)request.getAttribute("chartList");//리드에서 오는 녀석
	
	
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
			'chartSize': {width:300, height:270}
		};
		Nwagon.chart(options);
	</script>
