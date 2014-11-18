package dto;
public class MapDTO {
private String loc_id, loc_name ,mmsurl;
private int gis_x, gis_y;
public String getLoc_id() {
return loc_id;
}
public void setLoc_id(String loc_id) {
this.loc_id = loc_id;
}
public String getLoc_name() {
return loc_name;
}
public void setLoc_name(String loc_name) {
this.loc_name = loc_name;
}
public String getMmsurl() {
return mmsurl;
}
public void setMmsurl(String mmsurl) {
this.mmsurl = mmsurl;
}
public int getGis_x() {
return gis_x;
}
public void setGis_x(int gis_x) {
this.gis_x = gis_x;
}
public int getGis_y() {
return gis_y;
}
public void setGis_y(int gis_y) {
this.gis_y = gis_y;
}
}