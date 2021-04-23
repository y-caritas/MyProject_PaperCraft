package dto;

import java.sql.Date;

public class OptionDto {
	//push용 업데이트
	private int product_idx;
	private int option_idx;	
	private String option_detail;
	private int option_price;
	
	public OptionDto() {
	
	}
	
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getOption_idx() {
		return option_idx;
	}
	public void setOption_idx(int option_idx) {
		this.option_idx = option_idx;
	}
	public String getOption_detail() {
		return option_detail;
	}
	public void setOption_detail(String option_detail) {
		this.option_detail = option_detail;
	}
	public int getOption_price() {
		return option_price;
	}
	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
	
}
