
CREATE TABLE p_product (
	product_idx              NUMBER(10) PRIMARY KEY,
	product_category         NUMBER(2),
	product_name             VARCHAR2(50),
	product_price            NUMBER(6),
	product_note             VARCHAR2(100),
	product_listImg          VARCHAR2(50),
	product_introImg         VARCHAR2(50),
	product_introduction     CLOB,
	product_delivery_policy  VARCHAR2(4000),
	product_delivery_policy_category         NUMBER(2),
	product_swap_policy      VARCHAR2(4000),
	product_swap_policy_category         NUMBER(2),
	product_record           DATE DEFAULT SYSDATE,
	product_memo             VARCHAR2(4000)
	)
	
CREATE SEQUENCE p_product_seq;

CREATE TABLE p_option (
	option_idx               NUMBER(10) PRIMARY KEY,
	option_detail            VARCHAR2(30),
	option_price             NUMBER(6),
	product_idx              NUMBER(10)
	)
	
CREATE SEQUENCE p_option_seq;

CREATE TABLE p_product_review (
	product_r_idx            NUMBER(10) PRIMARY KEY,
	product_r_content        VARCHAR2(3000),
	product_r_img            VARCHAR2(50),
	product_r_grade          VARCHAR2(50),
	product_r_date           DATE DEFAULT SYSDATE,
	member_id                VARCHAR2(20),
	poduct_idx               NUMBER(10)
	)
	
CREATE SEQUENCE p_produc_review_seq;

CREATE TABLE p_product_inquiry (
	product_i_idx            NUMBER(10) PRIMARY KEY,
	product_i_writer         VARCHAR2(20),
	product_i_title			 VARCHAR2(100),
	product_i_content        VARCHAR2(2000),
	product_i_img			 VARCHAR2(50),
	product_i_category	     VARCHAR2(20),
	product_i_name			 VARCHAR2(50),
	product_i_date           DATE DEFAULT SYSDATE,
	member_id                VARCHAR2(20),
	product_idx              NUMBER(10),
	)
	
CREATE SEQUENCE p_product_inquiry_seq;

CREATE TABLE p_product_inquiry_answer (
	product_i_a_idx         NUMBER(10) PRIMARY KEY,
	product_i_a_title       VARCHAR2(100),
	product_i_a_content     VARCHAR2(2000),
	product_i_a_date        DATE DEFAULT SYSDATE,
	product_i_idx           NUMBER(10)
	)
	
CREATE SEQUENCE p_product_inquiry_answer_seq;

CREATE TABLE p_inquiry (
	inquiry_idx             NUMBER(10) PRIMARY KEY,
	inquiry_category        NUMBER(2),
	inquiry_title           VARCHAR2(100),
	inquiry_content         VARCHAR2(4000),
	inquiry_img             VARCHAR2(1000),
	inquiry_writer          VARCHAR2(50),
	inquiry_pw              NUMBER(10),
	inquiry_date            DATE DEFAULT SYSDATE,
	member_id               VARCHAR2(50)
	)
	
CREATE SEQUENCE p_inquiry_seq;

CREATE TABLE p_inquiry_answer (
	inquiry_a_idx           NUMBER(10) PRIMARY KEY,
	inquiry_a_title         VARCHAR2(30),
	inquiry_a_content       VARCHAR2(4000),
	inquiry_a_date          DATE DEFAULT SYSDATE,
	inquiry_idx             NUMBER(10)
	)
	
CREATE SEQUENCE p_inquiry_answer_seq;

CREATE TABLE p_member (
	member_idx              NUMBER(10) PRIMARY KEY,
	member_id               VARCHAR2(20) NOT NULL,
	member_pw               VARCHAR2(20) NOT NULL,
	member_name             VARCHAR2(20) NOT NULL,
	member_address          VARCHAR2(200),
	member_email            VARCHAR2(50),
	member_phone            VARCHAR2(20),
	member_gender           VARCHAR2(10),
	member_email_ad         NUMBER(2),
	member_grade            NUMBER(2) default 1,
	member_date             DATE DEFAULT SYSDATE,
	member_purchase         NUMBER(10) default 0
	);
	
insert into p_member (member_idx, member_id, member_pw, member_name, member_address, member_email, member_phone, member_gender, member_email_ad, member_date)
values(p_member_seq.nextval, 'hong', '1234', '홍길동', '서울시', 'abc@def.com', '01012341234', '남성', 1, sysdate);
	
CREATE SEQUENCE p_member_seq;

CREATE TABLE p_notice (
	notice_idx              NUMBER(10) PRIMARY KEY,
	notice_title            VARCHAR2(100),
	notice_content          VARCHAR2(4000),
	notice_date             DATE DEFAULT SYSDATE,
	notice_hit              NUMBER(6) DEFAULT 0
	notice_pin							NUMBER(1) NOT NULL default 0;
	)
	
CREATE SEQUENCE p_notice_seq;

CREATE TABLE p_faq (
	faq_idx                 NUMBER(10) PRIMARY KEY,
	faq_title               VARCHAR2(100),
	faq_content             VARCHAR2(4000),
	faq_category            VARCHAR2(20),
	faq_date                DATE DEFAULT SYSDATE
	)
	
CREATE SEQUENCE p_faq_seq;

CREATE TABLE p_cart (
	cart_idx                NUMBER(10) PRIMARY KEY,
	cart_date               DATE DEFAULT SYSDATE,
	cart_p_idx              NUMBER(10),
	cart_p_img              VARCHAR2(50),
	cart_p_name             VARCHAR2(50),
	cart_p_price            NUMBER(6),
	cart_p_count            NUMBER(2),
	cart_o_name             VARCHAR2(50),
	cart_o_price            NUMBER(6),
	member_id               VARCHAR2(20)
	)
	
CREATE SEQUENCE p_cart_seq;

CREATE TABLE p_order (
	order_idx               NUMBER(10) PRIMARY KEY,
	order_statuse           VARCHAR2(20),
	order_date              DATE DEFAULT SYSDATE,
	order_p_idx             NUMBER(10),
	order_p_img             VARCHAR2(50),
	order_p_name            VARCHAR2(50),
	order_p_price           NUMBER(6),
	order_p_count            NUMBER(2),
	order_o_name            VARCHAR2(50),
	order_o_price           NUMBER(6),
	
	member_id               VARCHAR2(20),

