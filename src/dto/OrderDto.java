package dto;

import java.util.*;

public class OrderDto {
	private int order_idx;
	private String order_status;
	private Date order_date;
	private int order_p_idx;
	private String order_p_name;
	private int order_p_price;
	private String order_o_name;
	private int order_o_price;
	private String member_name;
	private String member_id;
	private int member_grade;
	
	public OrderDto() {}
	public OrderDto(int aaa) {}

	public OrderDto(int order_idx, String order_status, Date order_date, String order_p_name, int order_p_price,
			String order_o_name, int order_o_price, String member_name, String member_id, int member_grade) {

		this.order_idx = order_idx;
		this.order_status = order_status;
		this.order_date = order_date;
		this.order_p_name = order_p_name;
		this.order_p_price = order_p_price;
		this.order_o_name = order_o_name;
		this.order_o_price = order_o_price;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_grade = member_grade;
	}



	public OrderDto(int order_idx, String order_status, Date order_date, int order_p_idx, String order_p_name,
			int order_p_price, String order_o_name, int order_o_price, String member_name, String member_id,
			int member_grade) {
		super();
		this.order_idx = order_idx;
		this.order_status = order_status;
		this.order_date = order_date;
		this.order_p_idx = order_p_idx;
		this.order_p_name = order_p_name;
		this.order_p_price = order_p_price;
		this.order_o_name = order_o_name;
		this.order_o_price = order_o_price;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_grade = member_grade;
	}
	public OrderDto(int order_idx2, String order_statuse, Date order_date2, int order_p_idx2, String order_p_img,
			String order_p_name2, int order_p_price2, int order_p_count, String order_o_name2, int order_o_price2,
			String member_id2) {
		this.order_idx = order_idx;
		this.order_status = order_status;
		this.order_date = order_date;
		this.order_p_idx = order_p_idx;
		this.order_p_name = order_p_name;
		this.order_p_price = order_p_price;
		this.order_o_name = order_o_name;
		this.order_o_price = order_o_price;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_grade = member_grade;
	}
	public int getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(int order_idx) {
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

	public String getOrder_o_name() {
		return order_o_name;
	}

	public void setOrder_o_name(String order_o_name) {
		this.order_o_name = order_o_name;
	}

	public int getOrder_o_price() {
		return order_o_price;
	}

	public void setOrder_o_price(int order_o_price) {
		this.order_o_price = order_o_price;
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
	
	
	
}
