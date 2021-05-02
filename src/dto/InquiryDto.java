package dto;

import java.util.Date;

public class InquiryDto {
	
	private int inquiry_idx;
	private int inquiry_category;
	private String inquiry_title;
	private String inquiry_content;
	private String inquiry_img;
	private String inquiry_writer;
	private String inquiry_pw;
	private Date inquiry_date;
	private String member_id;
	
	public InquiryDto() {}

	public InquiryDto(int inquiry_idx, int inquiry_category, String inquiry_title, String inquiry_content,
			String inquiry_img, String inquiry_writer, String inquiry_pw, Date inquiry_date, String member_id) {
		super();
		this.inquiry_idx = inquiry_idx;
		this.inquiry_category = inquiry_category;
		this.inquiry_title = inquiry_title;
		this.inquiry_content = inquiry_content;
		this.inquiry_img = inquiry_img;
		this.inquiry_writer = inquiry_writer;
		this.inquiry_pw = inquiry_pw;
		this.inquiry_date = inquiry_date;
		this.member_id = member_id;
	}

	public int getInquiry_idx() {
		return inquiry_idx;
	}

	public void setInquiry_idx(int inquiry_idx) {
		this.inquiry_idx = inquiry_idx;
	}

	public int getInquiry_category() {
		return inquiry_category;
	}

	public void setInquiry_category(int inquiry_category) {
		this.inquiry_category = inquiry_category;
	}

	public String getInquiry_title() {
		return inquiry_title;
	}

	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public String getInquiry_img() {
		return inquiry_img;
	}

	public void setInquiry_img(String inquiry_img) {
		this.inquiry_img = inquiry_img;
	}

	public String getInquiry_writer() {
		return inquiry_writer;
	}

	public void setInquiry_writer(String inquiry_writer) {
		this.inquiry_writer = inquiry_writer;
	}

	public String getInquiry_pw() {
		return inquiry_pw;
	}

	public void setInquiry_pw(String inquiry_pw) {
		this.inquiry_pw = inquiry_pw;
	}

	public Date getInquiry_date() {
		return inquiry_date;
	}

	public void setInquiry_date(Date inquiry_date) {
		this.inquiry_date = inquiry_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	};
	

}
