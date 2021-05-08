package dto;

import java.util.*;

public class OrderDto {
	private String order_idx;
	private String order_status;
	private String order_p_img ; 
	private Date order_date;
	private int order_p_idx   ;
	private int order_p_count ;
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
	
	public OrderDto() {}

	public OrderDto(String order_idx, String order_status, Date order_date, String order_p_name, int order_p_price,
			String product_idx1, String product_idx2, String product_idx3, String member_name, String member_id,
			int member_grade, String member_address, String member_phone, String member_request, String paymentOption, String escrow) {
		super();
		this.order_idx = order_idx;
		this.order_status = order_status;
		this.order_p_img = order_p_img;
		this.order_date = order_date;
		this.order_p_idx = order_p_idx;
		this.order_p_count = order_p_count;
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
	}
	
	public OrderDto( String order_idx, String order_status, Date order_date, String order_p_name, int order_p_price,
			String product_idx1, String product_idx2, String product_idx3, String member_name2, String member_id,
			int member_grade, String member_address, String member_phone, String member_request) {
		this.order_idx = order_idx;
		this.order_status = order_status;
		this.order_date = order_date;
		this.order_p_name = order_p_name;
		this.order_p_price = order_p_price;
		this.product_idx1 = product_idx1;
		this.product_idx2 = product_idx2;
		this.product_idx3 = product_idx3;
		this.member_name = member_name2;
		this.member_id = member_id;
		this.member_grade = member_grade;
		this.member_address = member_address;
		this.member_phone = member_phone;
		this.member_request = member_request;
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




	public String getOrder_p_img() {
		return order_p_img;
	}




	public void setOrder_p_img(String order_p_img) {
		this.order_p_img = order_p_img;
	}




	public Date getOrder_date() {
		return order_date;
	}




	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}




	public int getOrder_p_idx() {
		return order_p_idx;
	}




	public void setOrder_p_idx(int order_p_idx) {
		this.order_p_idx = order_p_idx;
	}




	public int getOrder_p_count() {
		return order_p_count;
	}




	public void setOrder_p_count(int order_p_count) {
		this.order_p_count = order_p_count;
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
	
	
}
