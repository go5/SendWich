

<!-- 
DB에 저장된 좌표값을 가져와서 지도에 뿌린후 클릭이벤트를 거는 작업.

 무수히도 많은 좌표값을 뿌릴수 있게..

아직실행안됩니다. db연동 최대한빨리해결하겠습니다..
 -->


<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="dao.MapDAO"%>
<%@page import="dto.MapDTO"%>
<jsp:useBean id="dto" class="dto.MapDTO"></jsp:useBean>
<jsp:useBean id="dao" class="dao.MapDAO"></jsp:useBean>
<html>
<head>
<title>세미</title>
<meta name="viewport" content="initial-scale=1.0,user-scalable=no">
<style type="text/css">
html { height: 100% }
body { height: 500px; margin: 0; padding: 0 }
#map { width: 500px; height: 485px }
</style>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=4491cfa019e7f26639c2a14e621d321d408d3b0b"></script>
<script type="text/javascript">


 window.onload = function() {
  var position = new daum.maps.LatLng(37.537187, 127.005476);
  
  
  var map = new daum.maps.Map(document.getElementById('map'), {
   center: position,
   level: 11,
   mapTypeId: daum.maps.MapTypeId.ROADMAP
  }); // 지도를 로딩했을때의 초기 화면 좌표로 이동.

 



  
  var icon = new daum.maps.MarkerImage(
	'rss.png',		
	new daum.maps.Size(20,20),   //아이콘 크기
   new daum.maps.Point(25,25) //아이콘의 포인터크기
   
  );

  daum.maps.event.addListener(map,"dragend",function(){
   var center = map.getCenter();
   var url = "http://apis.daum.net/local/geo/coord2addr";
   url += "?apikey=cedab95cd842ff542e48d915bc9f8f3fe587af06"; // 좌표를 주소로 바꾸는 api는 로컬api를 따로 받아야 한다.
   url += "&longitude="+center.getLng();
   url += "&latitude="+center.getLat();
   url += "&output=json";
   url += "&callback=?";
   $.getJSON(url,function(data) {            
     document.getElementById('message').innerText = data.fullName
   }).error(function(XMLHttpRequest, textStatus, errorThrown){          
     alert(textStatus);
   });
    });

//맵을 드래그 했을때의 가운데의 값을 좌표로 읽어내어 지역명을 텍스트로 뿌리기


  var zoomControl = new daum.maps.ZoomControl();
   map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT); // 줌컨트롤을 배치
  var mapTypeControl = new daum.maps.MapTypeControl();
   map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT); //맵타입 셀렉터

<%int i = 0;%>
<%i = i + 1;%>


     var position<%=i+1%> = new daum.maps.LatLng(<%=dto.getGis_y()%>, <%=dto.getGis_x()%>); //<%=dto.getLoc_name()%>
    
     
     var marker<%=i+1%> = new daum.maps.Marker({
      position: position<%=i+1%>,
      image : icon
     });
     marker<%=i+1%>.setMap(map);
     
     var infowindow<%=i+1%> = new daum.maps.InfoWindow({
      content: '<p style="margin:0px 0px;font-size:11px"><%=dto.getLoc_name()%></p>'
     });

      // 인포윈도우 메시지값 뿌리기

 

     daum.maps.event.addListener(marker<%=i+1%>, 'mouseover', function(e) { 
      infowindow<%=i+1%>.open(map, marker<%=i+1%>);
     });

     //해당 마커에 마우스를 갖다 댔을때의 인포윈도우를 open

 

     daum.maps.event.addListener(marker<%=i+1%>, 'mouseout', function(e) { 
      infowindow<%=i+1%>.close(map, marker<%=i+1%>);
     });

    // 해당 마커에서 마우스를 mouseout 시켰을때 해당 인포윈도우 닫기

 

     daum.maps.event.addListener(marker<%=i+1%>, 'click', function(e) { 
      aa('<%=dto.getMmsurl()%>');
      bb('<%=dto.getLoc_id()%>');
     });

    // 마커를 클릭했을때 클릭이벤트 주기
 }
</script>
</head>
<body>
 <div id="map"></div><!--지도가 표시되는 영역-->
 <div id="message" style="font-size:12px;width:590px;height:15px;border:solid 0px black;padding:0px;"></div><--메시지 표출 영역-->
</body>
</html>