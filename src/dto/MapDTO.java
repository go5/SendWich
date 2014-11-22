package dto;

public class MapDTO {
	private String loc_name, mmsurl;
	private int loc_id;
	private double gis_x, gis_y;

	public int getLoc_id() {
		return loc_id;
	}

	public void setLoc_id(int loc_id) {
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

	public double getGis_x() {
		return gis_x;
	}

	public void setGis_x(double gis_x) {
		this.gis_x = gis_x;
	}

	public double getGis_y() {
		return gis_y;
	}

	public void setGis_y(double gis_y) {
		this.gis_y = gis_y;
	}
}