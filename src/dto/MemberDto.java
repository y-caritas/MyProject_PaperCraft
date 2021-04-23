package dto;

import java.util.Date;

public class MemberDto {
	
	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_address;
	private String member_email;
	private String member_phone;
	private String member_gender;
	private int member_email_ad;
	private int member_grade;
	private Date member_date;
	private int member_purchase;
	
	public MemberDto() {}

	public MemberDto(int member_idx, String member_id, String member_pw, String member_name, String member_address,
			String member_email, String member_phone, String member_gender, int member_email_ad, int member_grade,
			Date member_date, int member_purchase) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_address = member_address;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_gender = member_gender;
		this.member_email_ad = member_email_ad;
		this.member_grade = member_grade;
		this.member_date = member_date;
		this.member_purchase = member_purchase;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public int getMember_email_ad() {
		return member_email_ad;
	}

	public void setMember_email_ad(int member_email_ad) {
		this.member_email_ad = member_email_ad;
	}

	public int getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}

	public Date getMember_date() {
		return member_date;
	}

	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}

	public int getMember_purchase() {
		return member_purchase;
	}

	public void setMember_purchase(int member_purchase) {
		this.member_purchase = member_purchase;
	}
	
	
}
