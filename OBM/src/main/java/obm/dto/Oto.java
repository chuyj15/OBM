package obm.dto;

import java.util.Date;

public class Oto {

	private int otoId;
	private String userId;
	private String phone;
	private String title;
	private String content;
	private String category;
	private Date regDate;
	private String reply;
	
	
	public int getOtoId() {
		return otoId;
	}
	public void setOtoId(int otoId) {
		this.otoId = otoId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}

	
	
	
	
}
