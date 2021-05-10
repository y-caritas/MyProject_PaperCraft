package dto;

import java.util.Date;

public class ProductEnquiryDto {
	
	private int product_i_idx;	
	private String product_i_title;
	private String product_i_content;
	private String product_i_img;
	private String product_i_category;
	private String product_i_name;
	private Date product_i_date;
	private String member_id;
	private int product_idx;

	
	public ProductEnquiryDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ProductEnquiryDto(int product_i_idx2, String product_i_title2, Date product_i_date2, String member_id2) {
		this.product_i_idx = product_i_idx2;
		this.product_i_title = product_i_title2;
		this.product_i_date = product_i_date2;
		this.member_id = member_id2;
	}
	
	

	public ProductEnquiryDto(int product_i_idx, String product_i_title, String product_i_content, String product_i_img,
			String product_i_category, String product_i_name, Date product_i_date, String member_id, int product_idx) {
		super();
		this.product_i_idx = product_i_idx;
		this.product_i_title = product_i_title;
		this.product_i_content = product_i_content;
		this.product_i_img = product_i_img;
		this.product_i_category = product_i_category;
		this.product_i_name = product_i_name;
		this.product_i_date = product_i_date;
		this.member_id = member_id;
		this.product_idx = product_idx;
	}


	public int getProduct_i_idx() {
		return product_i_idx;
	}

	public void setProduct_i_idx(int product_i_idx) {
		this.product_i_idx = product_i_idx;
	}

	public String getProduct_i_title() {
		return product_i_title;
	}

	public void setProduct_i_title(String product_i_title) {
		this.product_i_title = product_i_title;
	}

	public String getProduct_i_content() {
		return product_i_content;
	}

	public void setProduct_i_content(String product_i_content) {
		this.product_i_content = product_i_content;
	}

	public String getProduct_i_img() {
		return product_i_img;
	}

	public void setProduct_i_img(String product_i_img) {
		this.product_i_img = product_i_img;
	}

	public String getProduct_i_category() {
		return product_i_category;
	}

	public void setProduct_i_category(String product_i_category) {
		this.product_i_category = product_i_category;
	}

	public String getProduct_i_name() {
		return product_i_name;
	}

	public void setProduct_i_name(String product_i_name) {
		this.product_i_name = product_i_name;
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


	
	
	

