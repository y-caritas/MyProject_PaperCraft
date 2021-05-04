package dto;

import java.util.Date;

public class OrderDto {
	
	
	private int order_idx ;              
	private String order_statuse ;          
	private Date order_date  ;          
	private int order_p_idx   ;          
	private String order_p_img ;            
	private String order_p_name ;        
	private int order_p_price ;      
	private int order_p_count ;         
	private String order_o_name;            
	private int order_o_price;          
	private String member_id ;       
	
	public OrderDto() {
	
	}

	public OrderDto(int order_idx, String order_statuse, Date order_date, int order_p_idx, String order_p_img,
			String order_p_name, int order_p_price, int order_p_count, String order_o_name, int order_o_price,
			String member_id) {
		super();
		this.order_idx = order_idx;
		this.order_statuse = order_statuse;
		this.order_date = order_date;
		this.order_p_idx = order_p_idx;
		this.order_p_img = order_p_img;
		this.order_p_name = order_p_name;
		this.order_p_price = order_p_price;
		this.order_p_count = order_p_count;
		this.order_o_name = order_o_name;
		this.order_o_price = order_o_price;
		this.member_id = member_id;
	}

	public int getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}

	public String getOrder_statuse() {
		return order_statuse;
	}

	public void setOrder_statuse(String order_statuse) {
		this.order_statuse = order_statuse;
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

	public String getOrder_p_img() {
		return order_p_img;
	}

	public void setOrder_p_img(String order_p_img) {
		this.order_p_img = order_p_img;
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

	public int getOrder_p_count() {
		return order_p_count;
	}

	public void setOrder_p_count(int order_p_count) {
		this.order_p_count = order_p_count;
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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


}
