package dto;

public class MessageDTO {
	private int msg_id, sender_id, reciever_id;
	private String textarea, send_date;
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}
	public int getSender_id() {
		return sender_id;
	}
	public void setSender_id(int sender_id) {
		this.sender_id = sender_id;
	}
	public int getReciever_id() {
		return reciever_id;
	}
	public void setReciever_id(int reciever_id) {
		this.reciever_id = reciever_id;
	}
	public String getTextarea() {
		return textarea;
	}
	public void setTextarea(String textarea) {
		this.textarea = textarea;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
	
	
}
