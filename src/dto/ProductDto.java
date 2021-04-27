package dto;

import java.sql.Date;

public class ProductDto {
	private int product_idx;
	private int product_category;
	private String product_name;
	private int product_price;
	private String product_note;
	private String product_listImg;
	private String product_introImg;
	private String product_introduction;
	private String product_delivery_policy;
	private int product_delivery_policy_category;
	private String product_swap_policy;
	private int product_swap_policy_category;
	private Date product_record;	
	
	public int getProduct_delivery_policy_category() {
		return product_delivery_policy_category;
	}

	public void setProduct_delivery_policy_category(int product_delivery_policy_category) {
		this.product_delivery_policy_category = product_delivery_policy_category;
	}

	public int getProduct_swap_policy_category() {
		return product_swap_policy_category;
	}

	public void setProduct_swap_policy_category(int product_swap_policy_category) {
		this.product_swap_policy_category = product_swap_policy_category;
	}

	public ProductDto() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductDto(String product_name2, String product_price2, String product_note2, String product_listImg2) {
		// TODO Auto-generated constructor stub
	}

	public ProductDto(int product_idx2, int product_category2, String product_name2, int product_price2,
			Date product_record2) {
		// TODO Auto-generated constructor stub
	}

	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getProduct_category() {
		return product_category;
	}
	public void setProduct_category(int product_category) {
		this.product_category = product_category;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_note() {
		return product_note;
	}
	public void setProduct_note(String product_note) {
		this.product_note = product_note;
	}
	public String getProduct_listImg() {
		return product_listImg;
	}
	public void setProduct_listImg(String product_listImg) {
		this.product_listImg = product_listImg;
	}
	public String getProduct_introImg() {
		return product_introImg;
	}
	public void setProduct_introImg(String product_introImg) {
		this.product_introImg = product_introImg;
	}
	public String getProduct_introduction() {
		return product_introduction;
	}
	public void setProduct_introduction(String product_introduction) {
		this.product_introduction = product_introduction;
	}
	public String getProduct_delivery_policy() {
		return product_delivery_policy;
	}
	public void setProduct_delivery_policy(String product_delivery_policy) {
		this.product_delivery_policy = product_delivery_policy;
	}
	public String getProduct_swap_policy() {
		return product_swap_policy;
	}
	public void setProduct_swap_policy(String product_swap_policy) {
		this.product_swap_policy = product_swap_policy;
	}
	public Date getProduct_record() {
		return product_record;
	}
	public void setProduct_record(Date product_record) {
		this.product_record = product_record;
	}
	public String getProduct_memo() {
		return product_memo;
	}
	public void setProduct_memo(String product_memo) {
		this.product_memo = product_memo;
	}
	private String product_memo;
}
