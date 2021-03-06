package dto;

import java.sql.Date;

public class CartDto {

	private int cart_idx;
	private Date cart_date;
	private int cart_p_idx;
	private String cart_p_img;
	private String cart_p_name;
	private int cart_p_price;
	private int cart_p_total_price;
	private int cart_p_count;	
	private String member_id;
	
	public CartDto() {
		// TODO Auto-generated constructor stub
	}
	
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}
	public Date getCart_date() {
		return cart_date;
	}
	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}
	public int getCart_p_idx() {
		return cart_p_idx;
	}
	public void setCart_p_idx(int cart_p_idx) {
		this.cart_p_idx = cart_p_idx;
	}
	public String getCart_p_img() {
		return cart_p_img;
	}
	public void setCart_p_img(String cart_p_img) {
		this.cart_p_img = cart_p_img;
	}
	public String getCart_p_name() {
		return cart_p_name;
	}
	public void setCart_p_name(String cart_p_name) {
		this.cart_p_name = cart_p_name;
	}
	public int getCart_p_price() {
		return cart_p_price;
	}
	public void setCart_p_price(int cart_p_price) {
		this.cart_p_price = cart_p_price;
	}
	public int getCart_p_total_price() {
		return cart_p_total_price;
	}
	public void setCart_p_total_price(int cart_p_total_price) {
		this.cart_p_total_price = cart_p_total_price;
	}
	public int getCart_p_count() {
		return cart_p_count;
	}
	public void setCart_p_count(int cart_p_count) {
		this.cart_p_count = cart_p_count;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public CartDto(int cart_idx, Date cart_date, int cart_p_idx, String cart_p_img, String cart_p_name,
			int cart_p_price, int cart_p_total_price, int cart_p_count, String member_id) {
		super();
		this.cart_idx = cart_idx;
		this.cart_date = cart_date;
		this.cart_p_idx = cart_p_idx;
		this.cart_p_img = cart_p_img;
		this.cart_p_name = cart_p_name;
		this.cart_p_price = cart_p_price;
		this.cart_p_total_price = cart_p_total_price;
		this.cart_p_count = cart_p_count;
		this.member_id = member_id;
	}
	
	}
