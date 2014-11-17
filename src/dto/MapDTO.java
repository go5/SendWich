package dto;

public class MapDTO {
	
	
	private String CCTVID, CCTVNAME ,MMSURL; 
	private int GIS_X, GIS_Y;
	public String getCCTVID() {
		return CCTVID;
	}
	public void setCCTVID(String cCTVID) {
		CCTVID = cCTVID;
	}
	public String getCCTVNAME() {
		return CCTVNAME;
	}
	public void setCCTVNAME(String cCTVNAME) {
		CCTVNAME = cCTVNAME;
	}
	public String getMMSURL() {
		return MMSURL;
	}
	public void setMMSURL(String mMSURL) {
		MMSURL = mMSURL;
	}
	public int getGIS_X() {
		return GIS_X;
	}
	public void setGIS_X(int gIS_X) {
		GIS_X = gIS_X;
	}
	public int getGIS_Y() {
		return GIS_Y;
	}
	public void setGIS_Y(int gIS_Y) {
		GIS_Y = gIS_Y;
	}
}
