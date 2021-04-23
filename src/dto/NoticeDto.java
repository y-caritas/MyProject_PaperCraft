package dto;

import java.util.Date;

public class NoticeDto {
	
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_hit;
	private int notice_pin;
	
	public NoticeDto() {
	}

	public NoticeDto(int notice_idx, String notice_title, String notice_content, Date notice_date, int notice_hit,
			int notice_pin) {
		super();
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_hit = notice_hit;
		this.notice_pin = notice_pin;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_hit() {
		return notice_hit;
	}

	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}

	public int getNotice_pin() {
		return notice_pin;
	}

	public void setNotice_pin(int notice_pin) {
		this.notice_pin = notice_pin;
	}
	
	
}
