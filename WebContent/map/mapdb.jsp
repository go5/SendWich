

<!-- 
DB�� ����� ��ǥ���� �����ͼ� ������ �Ѹ��� Ŭ���̺�Ʈ�� �Ŵ� �۾�.

 �������� ���� ��ǥ���� �Ѹ��� �ְ�..

��������ȵ˴ϴ�. db���� �ִ��ѻ����ذ��ϰڽ��ϴ�..
 -->


<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>����</title>
<meta name="viewport" content="initial-scale=1.0,user-scalable=no">
<style type="text/css">
html { height: 100% }
body { height: 500px; margin: 0; padding: 0 }
#map { width: 500px; height: 485px }
</style>
<script type="text/javascript" src="/js/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=����APIŰ �� "></script>
<script type="text/javascript">


 window.onload = function() {
  var position = new daum.maps.LatLng(�ʱ���ǥ��x,�ʱ���ǥ��y);
  var map = new daum.maps.Map(document.getElementById('map'), {
   center: position,
   level: 11,
   mapTypeId: daum.maps.MapTypeId.ROADMAP
  }); // ������ �ε��������� �ʱ� ȭ�� ��ǥ�� �̵�.

 


  var icon = new daum.maps.MarkerImage(
   '/images/pic12.jpg', 
   new daum.maps.Size(20,20),   //������ ũ��
   new daum.maps.Point(25,25) //�������� ������ũ��
   
  );

  daum.maps.event.addListener(map,"dragend",function(){
   var center = map.getCenter();
   var url = "http://apis.daum.net/local/geo/coord2addr";
   url += "?apikey=cedab95cd842ff542e48d915bc9f8f3fe587af06"; // ��ǥ�� �ּҷ� �ٲٴ� api�� ����api�� ���� �޾ƾ� �Ѵ�.
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

//���� �巡�� �������� ����� ���� ��ǥ�� �о�� �������� �ؽ�Ʈ�� �Ѹ���


  var zoomControl = new daum.maps.ZoomControl();
   map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT); // ����Ʈ���� ��ġ
  var mapTypeControl = new daum.maps.MapTypeControl();
   map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT); //��Ÿ�� ������

     var position<%=i+1%> = new daum.maps.LatLng(<%=rs.getString("GIS_Y")%>, <%=rs.getString("GIS_X")%>); //<%=rs.getString("CCTVNAME")%>
     var marker<%=i+1%> = new daum.maps.Marker({
      position: position<%=i+1%>,
      image : icon
     });
     marker<%=i+1%>.setMap(map);
     
     var infowindow<%=i+1%> = new daum.maps.InfoWindow({
      content: '<p style="margin:0px 0px;font-size:11px"><%=rs.getString("CCTVNAME")%></p>'
     });

      // ���������� �޽����� �Ѹ���

 

     daum.maps.event.addListener(marker<%=i+1%>, 'mouseover', function(e) { 
      infowindow<%=i+1%>.open(map, marker<%=i+1%>);
     });

     //�ش� ��Ŀ�� ���콺�� ���� �������� ���������츦 open

 

     daum.maps.event.addListener(marker<%=i+1%>, 'mouseout', function(e) { 
      infowindow<%=i+1%>.close(map, marker<%=i+1%>);
     });

    // �ش� ��Ŀ���� ���콺�� mouseout �������� �ش� ���������� �ݱ�

 

     daum.maps.event.addListener(marker<%=i+1%>, 'click', function(e) { 
      aa('<%=rs.getString("MMSURL")%>');
      bb('<%=rs.getString("CCTVID")%>');
     });

    // ��Ŀ�� Ŭ�������� Ŭ���̺�Ʈ �ֱ�


 };
</script>
</head>
<body>
 <div id="map"></div><!--������ ǥ�õǴ� ����-->
 <div id="message" style="font-size:12px;width:590px;height:15px;border:solid 0px black;padding:0px;"></div><--�޽��� ǥ�� ����-->
</body>
</html>