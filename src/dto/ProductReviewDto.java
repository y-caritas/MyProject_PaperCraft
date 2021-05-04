package dto;

import java.sql.Date;

public class ProductReviewDto {	
	//push용 업데이트
	private int product_idx;
	private int product_r_idx;
	private String product_r_content;
	private String product_r_img;
	private String product_r_grade;
	private Date product_r_date;
	private String member_id;
	
	public ProductReviewDto() {
	
	}

	public ProductReviewDto(int product_r_idx2, String product_r_content2, String product_r_img2,String product_r_grade2) {
		this.product_r_idx = product_r_idx2;
		this.product_r_content = product_r_content2;
		this.product_r_img = product_r_img2;
		this.product_r_grade = product_r_grade2;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getProduct_r_idx() {
		return product_r_idx;
	}

	public void setProduct_r_idx(int product_r_idx) {
		this.product_r_idx = product_r_idx;
	}

	public String getProduct_r_content() {
		return product_r_content;
	}

	public void setProduct_r_content(String product_r_content) {
		this.product_r_content = product_r_content;
	}

	public String getProduct_r_img() {
		return product_r_img;
	}

	public void setProduct_r_img(String product_r_img) {
		this.product_r_img = product_r_img;
	}

	public String getProduct_r_grade() {
		return product_r_grade;
	}

	public void setProduct_r_grade(String product_r_grade) {
		this.product_r_grade = product_r_grade;
	}

	public Date getProduct_r_date() {
		return product_r_date;
	}

	public void setProduct_r_date(Date product_r_date) {
		this.product_r_date = product_r_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
		
}
