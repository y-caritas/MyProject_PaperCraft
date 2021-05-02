package dto;

import java.util.Date;

public class InquiryAnswerDto {
	
	private int inquiry_a_idx;
	private String inquiry_a_title;
	private String inquiry_a_content;
	private Date inquiry_a_date;
	private int inquiry_idx;
	
	public InquiryAnswerDto() {}

	public InquiryAnswerDto(int inquiry_a_idx, String inquiry_a_title, String inquiry_a_content, Date inquiry_a_date,
			int inquiry_idx) {
		super();
		this.inquiry_a_idx = inquiry_a_idx;
		this.inquiry_a_title = inquiry_a_title;
		this.inquiry_a_content = inquiry_a_content;
		this.inquiry_a_date = inquiry_a_date;
		this.inquiry_idx = inquiry_idx;
	}

	public int getInquiry_a_idx() {
		return inquiry_a_idx;
	}

	public void setInquiry_a_idx(int inquiry_a_idx) {
		this.inquiry_a_idx = inquiry_a_idx;
	}

	public String getInquiry_a_title() {
		return inquiry_a_title;
	}

	public void setInquiry_a_title(String inquiry_a_title) {
		this.inquiry_a_title = inquiry_a_title;
	}

	public String getInquiry_a_content() {
		return inquiry_a_content;
	}

	public void setInquiry_a_content(String inquiry_a_content) {
		this.inquiry_a_content = inquiry_a_content;
	}

	public Date getInquiry_a_date() {
		return inquiry_a_date;
	}

	public void setInquiry_a_date(Date inquiry_a_date) {
		this.inquiry_a_date = inquiry_a_date;
	}

	public int getInquiry_idx() {
		return inquiry_idx;
	}

	public void setInquiry_idx(int inquiry_idx) {
		this.inquiry_idx = inquiry_idx;
	};

}
