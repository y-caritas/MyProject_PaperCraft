package dto;

import java.sql.Date;

public class ProductEnquiryDto {
	
	private int product_i_idx;
	private String product_i_writer;
	private String product_i_content;
	private Date product_i_date;
	private String member_id;
	private int product_idx;	
	
	public ProductEnquiryDto() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductEnquiryDto(int product_i_idx2, String product_i_content2, Date product_i_date2, String product_i_writer2) {
		this.product_i_idx = product_i_idx2;
		this.product_i_content = product_i_content2;
		this.product_i_date = product_i_date2;
		this.product_i_writer = product_i_writer2;
	}

	public int getProduct_i_idx() {
		return product_i_idx;
	}
	public void setProduct_i_idx(int product_i_idx) {
		this.product_i_idx = product_i_idx;
	}
	public String getProduct_i_writer() {
		return product_i_writer;
	}
	public void setProduct_i_writer(String product_i_writer) {
		this.product_i_writer = product_i_writer;
	}
	public String getProduct_i_content() {
		return product_i_content;
	}
	public void setProduct_i_content(String product_i_content) {
		this.product_i_content = product_i_content;
	}
	public Date getProduct_i_date() {
		return product_i_date;
	}
	public void setProduct_i_date(Date product_i_date) {
		this.product_i_date = product_i_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	
}
