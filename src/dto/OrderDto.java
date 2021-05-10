package dto;

import java.util.*;

public class OrderDto {
	private String order_idx;
	private String order_status; 
	private Date order_date;
	private String order_p_name;
	private int order_p_price;
	private String product_idx1;
	private String product_idx2;
	private String product_idx3;
	private String member_name;
	private String member_id;
	private int member_grade;
	private String member_address;
	private String member_phone;
	private String member_request;
	private String paymentOption;
	private String escrow;
	private String order_p_img;	
	private String order_p_count1;
	private String order_p_count2;
	private String order_p_count3;
	
	public OrderDto() {}

	public OrderDto(String order_idx, String order_status, Date order_date, String order_p_name, int order_p_price,
			String product_idx1, String product_idx2, String product_idx3, String member_name, String member_id,
			int member_grade, String member_address, String member_phone, String member_request, String paymentOption,
			String escrow, String order_p_img, String order_p_count1, String order_p_count2, String order_p_count3) {
		super();
		this.order_idx = order_idx;
		this.order_status = order_status;
		this.order_date = order_date;
		this.order_p_name = order_p_name;
		this.order_p_price = order_p_price;
		this.product_idx1 = product_idx1;
		this.product_idx2 = product_idx2;
		this.product_idx3 = product_idx3;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_grade = member_grade;
		this.member_address = member_address;
		this.member_phone = member_phone;
		this.member_request = member_request;
		this.paymentOption = paymentOption;
		this.escrow = escrow;
		this.order_p_img = order_p_img;
		this.order_p_count1 = order_p_count1;
		this.order_p_count2 = order_p_count2;
		this.order_p_count3 = order_p_count3;
	}

	public String getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_p_name() {
		return order_p_name;
	}

	public void setOrder_p_name(String order_p_name) {
		this.order_p_name = order_p_name;
	}

	public int getOrder_p_price() {
		return order_p_price;
	}

	public void setOrder_p_price(int order_p_price) {
		this.order_p_price = order_p_price;
	}

	public String getProduct_idx1() {
		return product_idx1;
	}

	public void setProduct_idx1(String product_idx1) {
		this.product_idx1 = product_idx1;
	}

	public String getProduct_idx2() {
		return product_idx2;
	}

	public void setProduct_idx2(String product_idx2) {
		this.product_idx2 = product_idx2;
	}

	public String getProduct_idx3() {
		return product_idx3;
	}

	public void setProduct_idx3(String product_idx3) {
		this.product_idx3 = product_idx3;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_request() {
		return member_request;
	}

	public void setMember_request(String member_request) {
		this.member_request = member_request;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}

	public String getEscrow() {
		return escrow;
	}

	public void setEscrow(String escrow) {
		this.escrow = escrow;
	}

	public String getOrder_p_img() {
		return order_p_img;
	}

	public void setOrder_p_img(String order_p_img) {
		this.order_p_img = order_p_img;
	}

	public String getOrder_p_count1() {
		return order_p_count1;
	}

	public void setOrder_p_count1(String order_p_count1) {
		this.order_p_count1 = order_p_count1;
	}

	public String getOrder_p_count2() {
		return order_p_count2;
	}

	public void setOrder_p_count2(String order_p_count2) {
		this.order_p_count2 = order_p_count2;
	}

	public String getOrder_p_count3() {
		return order_p_count3;
	}

	public void setOrder_p_count3(String order_p_count3) {
		this.order_p_count3 = order_p_count3;
	}

	
	
	
}
