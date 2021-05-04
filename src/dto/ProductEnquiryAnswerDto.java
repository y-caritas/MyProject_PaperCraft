package dto;

import java.util.Date;



public class ProductEnquiryAnswerDto {
	
	private int product_i_a_idx;         
	private String product_i_a_title;      
	private String product_i_a_content ; 
	private Date product_i_a_date ;    
	private int product_i_idx  ;         
	
	public ProductEnquiryAnswerDto( ) {
		
	}

	public ProductEnquiryAnswerDto(int product_i_a_idx, String product_i_a_title, String product_i_a_content,
			Date product_i_a_date, int product_i_idx) {
		super();
		this.product_i_a_idx = product_i_a_idx;
		this.product_i_a_title = product_i_a_title;
		this.product_i_a_content = product_i_a_content;
		this.product_i_a_date = product_i_a_date;
		this.product_i_idx = product_i_idx;
	}

	public int getProduct_i_a_idx() {
		return product_i_a_idx;
	}

	public void setProduct_i_a_idx(int product_i_a_idx) {
		this.product_i_a_idx = product_i_a_idx;
	}

	public String getProduct_i_a_title() {
		return product_i_a_title;
	}

	public void setProduct_i_a_title(String product_i_a_title) {
		this.product_i_a_title = product_i_a_title;
	}

	public String getProduct_i_a_content() {
		return product_i_a_content;
	}

	public void setProduct_i_a_content(String product_i_a_content) {
		this.product_i_a_content = product_i_a_content;
	}

	public Date getProduct_i_a_date() {
		return product_i_a_date;
	}

	public void setProduct_i_a_date(Date product_i_a_date) {
		this.product_i_a_date = product_i_a_date;
	}

	public int getProduct_i_idx() {
		return product_i_idx;
	}

	public void setProduct_i_idx(int product_i_idx) {
		this.product_i_idx = product_i_idx;
	}

	
}
