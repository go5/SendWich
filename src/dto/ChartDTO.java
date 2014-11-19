package dto;

public class ChartDTO {
	private int loc_id, eva_type_num, eva_value, board_id,chart_id;
	private String eva_type, eva_key;
	public int getLoc_id() {
		return loc_id;
	}
	public void setLoc_id(int loc_id) {
		this.loc_id = loc_id;
	}
	public int getEva_type_num() {
		return eva_type_num;
	}
	public void setEva_type_num(int eva_type_num) {
		this.eva_type_num = eva_type_num;
	}
	public int getEva_value() {
		return eva_value;
	}
	public void setEva_value(int eva_value) {
		this.eva_value = eva_value;
	}
	public String getEva_type() {
		return eva_type;
	}
	public void setEva_type(String eva_type) {
		this.eva_type = eva_type;
	}
	public String getEva_key() {
		return eva_key;
	}
	public void setEva_key(String eva_key) {
		this.eva_key = eva_key;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getChart_id() {
		return chart_id;
	}
	public void setChart_id(int chart_id) {
		this.chart_id = chart_id;
	}
	
}
