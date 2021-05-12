--------------------------------------------------------
--  파일이 생성됨 - 수요일-5월-12-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence P_CART_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_CART_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_FAQ_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_FAQ_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_INQUIRY_ANSWER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_INQUIRY_ANSWER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_INQUIRY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_INQUIRY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_MEMBER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_MEMBER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_NOTICE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_NOTICE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_OPTION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_OPTION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_ORDER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_ORDER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_PRODUCT_INQUIRY_ANSWER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_PRODUCT_INQUIRY_ANSWER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_PRODUCT_INQUIRY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_PRODUCT_INQUIRY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_PRODUCT_REVIEW_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_PRODUCT_REVIEW_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_PRODUCT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_PRODUCT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence P_PRODUC_REVIEW_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERID"."P_PRODUC_REVIEW_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table P_CART
--------------------------------------------------------

  CREATE TABLE "USERID"."P_CART" 
   (	"CART_IDX" NUMBER(10,0), 
	"CART_DATE" DATE DEFAULT SYSDATE, 
	"CART_P_IDX" NUMBER(10,0), 
	"CART_P_IMG" VARCHAR2(1000 BYTE), 
	"CART_P_NAME" VARCHAR2(1000 BYTE), 
	"CART_P_PRICE" NUMBER(6,0), 
	"CART_P_TOTAL_PRICE" NUMBER(6,0), 
	"CART_P_COUNT" NUMBER(2,0), 
	"MEMBER_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_FAQ
--------------------------------------------------------

  CREATE TABLE "USERID"."P_FAQ" 
   (	"FAQ_IDX" NUMBER(10,0), 
	"FAQ_TITLE" VARCHAR2(100 BYTE), 
	"FAQ_CONTENT" VARCHAR2(4000 BYTE), 
	"FAQ_CATEGORY" VARCHAR2(20 BYTE), 
	"FAQ_DATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_INQUIRY
--------------------------------------------------------

  CREATE TABLE "USERID"."P_INQUIRY" 
   (	"INQUIRY_IDX" NUMBER(10,0), 
	"INQUIRY_CATEGORY" NUMBER(2,0), 
	"INQUIRY_TITLE" VARCHAR2(100 BYTE), 
	"INQUIRY_CONTENT" VARCHAR2(4000 BYTE), 
	"INQUIRY_IMG" VARCHAR2(1000 BYTE), 
	"INQUIRY_WRITER" VARCHAR2(50 BYTE), 
	"INQUIRY_PW" NUMBER(10,0), 
	"INQUIRY_DATE" DATE DEFAULT SYSDATE, 
	"MEMBER_ID" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_INQUIRY_ANSWER
--------------------------------------------------------

  CREATE TABLE "USERID"."P_INQUIRY_ANSWER" 
   (	"INQUIRY_A_IDX" NUMBER(10,0), 
	"INQUIRY_A_TITLE" VARCHAR2(30 BYTE), 
	"INQUIRY_A_CONTENT" VARCHAR2(4000 BYTE), 
	"INQUIRY_A_DATE" DATE DEFAULT SYSDATE, 
	"INQUIRY_IDX" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_MEMBER
--------------------------------------------------------

  CREATE TABLE "USERID"."P_MEMBER" 
   (	"MEMBER_IDX" NUMBER(10,0), 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"MEMBER_PW" VARCHAR2(20 BYTE), 
	"MEMBER_NAME" VARCHAR2(20 BYTE), 
	"MEMBER_ADDRESS" VARCHAR2(200 BYTE), 
	"MEMBER_EMAIL" VARCHAR2(50 BYTE), 
	"MEMBER_PHONE" VARCHAR2(20 BYTE), 
	"MEMBER_GENDER" VARCHAR2(10 BYTE), 
	"MEMBER_EMAIL_AD" NUMBER(2,0), 
	"MEMBER_GRADE" NUMBER(2,0) DEFAULT 1, 
	"MEMBER_DATE" DATE DEFAULT SYSDATE, 
	"MEMBER_PURCHASE" NUMBER(10,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_NOTICE
--------------------------------------------------------

  CREATE TABLE "USERID"."P_NOTICE" 
   (	"NOTICE_IDX" NUMBER(10,0), 
	"NOTICE_PIN" NUMBER(1,0) DEFAULT 0, 
	"NOTICE_HIT" NUMBER(6,0) DEFAULT 0, 
	"NOTICE_TITLE" VARCHAR2(100 BYTE), 
	"NOTICE_CONTENT" VARCHAR2(4000 BYTE), 
	"NOTICE_DATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_OPTION
--------------------------------------------------------

  CREATE TABLE "USERID"."P_OPTION" 
   (	"OPTION_IDX" NUMBER(10,0), 
	"OPTION_DETAIL" VARCHAR2(30 BYTE), 
	"OPTION_PRICE" NUMBER(6,0), 
	"PRODUCT_IDX" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_ORDER
--------------------------------------------------------

  CREATE TABLE "USERID"."P_ORDER" 
   (	"ORDER_IDX" VARCHAR2(100 BYTE), 
	"ORDER_STATUS" VARCHAR2(20 BYTE), 
	"ORDER_DATE" DATE DEFAULT SYSDATE, 
	"ORDER_P_NAME" VARCHAR2(50 BYTE), 
	"ORDER_P_PRICE" NUMBER(6,0), 
	"PRODUCT_IDX1" VARCHAR2(10 BYTE), 
	"PRODUCT_IDX2" VARCHAR2(10 BYTE), 
	"PRODUCT_IDX3" VARCHAR2(10 BYTE), 
	"MEMBER_NAME" VARCHAR2(20 BYTE), 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"MEMBER_GRADE" NUMBER(6,0), 
	"MEMBER_ADDRESS" VARCHAR2(100 BYTE), 
	"MEMBER_PHONE" VARCHAR2(40 BYTE), 
	"MEMBER_REQUEST" VARCHAR2(4000 BYTE), 
	"PAYMENTOPTION" VARCHAR2(50 BYTE), 
	"ESCROW" VARCHAR2(50 BYTE), 
	"ORDER_P_IMG" VARCHAR2(1000 BYTE), 
	"ORDER_P_COUNT1" VARCHAR2(10 BYTE), 
	"ORDER_P_COUNT2" VARCHAR2(10 BYTE), 
	"ORDER_P_COUNT3" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_PRODUCT
--------------------------------------------------------

  CREATE TABLE "USERID"."P_PRODUCT" 
   (	"PRODUCT_IDX" NUMBER, 
	"PRODUCT_CATEGORY" NUMBER, 
	"PRODUCT_NAME" VARCHAR2(50 BYTE), 
	"PRODUCT_PRICE" NUMBER, 
	"PRODUCT_NOTE" VARCHAR2(1000 BYTE), 
	"PRODUCT_LISTIMG" VARCHAR2(1000 BYTE), 
	"PRODUCT_INTROIMG" VARCHAR2(1000 BYTE), 
	"PRODUCT_INTRODUCTION" CLOB, 
	"PRODUCT_DELIVERY_POLICY" VARCHAR2(4000 BYTE), 
	"DELIVERY_POLICY_CATEGORY" NUMBER, 
	"PRODUCT_SWAP_POLICY" VARCHAR2(4000 BYTE), 
	"SWAP_POLICY_CATEGORY" NUMBER, 
	"PRODUCT_RECORD" DATE DEFAULT SYSDATE, 
	"PRODUCT_MEMO" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("PRODUCT_INTRODUCTION") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table P_PRODUCT_INQUIRY
--------------------------------------------------------

  CREATE TABLE "USERID"."P_PRODUCT_INQUIRY" 
   (	"PRODUCT_I_IDX" NUMBER(10,0), 
	"PRODUCT_I_TITLE" VARCHAR2(100 BYTE), 
	"PRODUCT_I_CONTENT" VARCHAR2(2000 BYTE), 
	"PRODUCT_I_IMG" VARCHAR2(50 BYTE), 
	"PRODUCT_I_CATEGORY" VARCHAR2(20 BYTE), 
	"PRODUCT_I_NAME" VARCHAR2(50 BYTE), 
	"PRODUCT_I_DATE" DATE DEFAULT SYSDATE, 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"PRODUCT_IDX" NUMBER(10,0), 
	"PRODUCT_I_A_CONTENT" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_PRODUCT_REVIEW
--------------------------------------------------------

  CREATE TABLE "USERID"."P_PRODUCT_REVIEW" 
   (	"PRODUCT_R_IDX" NUMBER(10,0), 
	"PRODUCT_R_CONTENT" VARCHAR2(3000 BYTE), 
	"PRODUCT_R_IMG" VARCHAR2(50 BYTE), 
	"PRODUCT_R_GRADE" VARCHAR2(50 BYTE), 
	"PRODUCT_R_DATE" DATE DEFAULT SYSDATE, 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"PRODUCT_IDX" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into USERID.P_CART
SET DEFINE OFF;
REM INSERTING into USERID.P_FAQ
SET DEFINE OFF;
Insert into USERID.P_FAQ (FAQ_IDX,FAQ_TITLE,FAQ_CONTENT,FAQ_CATEGORY,FAQ_DATE) values (1,'상품 크기가 어떻게 되나요?','<p>제품마다 다르나 평균 10cm ~ 20cm 정도입니다.</p>','faqProduct',to_date('21/05/12','RR/MM/DD'));
Insert into USERID.P_FAQ (FAQ_IDX,FAQ_TITLE,FAQ_CONTENT,FAQ_CATEGORY,FAQ_DATE) values (2,'교환 기준이 어떻게 되나요?','교환','faqSwap',to_date('21/05/12','RR/MM/DD'));
Insert into USERID.P_FAQ (FAQ_IDX,FAQ_TITLE,FAQ_CONTENT,FAQ_CATEGORY,FAQ_DATE) values (3,'반품 기준이 어떻게 되나요?','<p>반품</p>','faqSwap',to_date('21/05/12','RR/MM/DD'));
Insert into USERID.P_FAQ (FAQ_IDX,FAQ_TITLE,FAQ_CONTENT,FAQ_CATEGORY,FAQ_DATE) values (4,'배송 기간이 얼마나 되나요?','평균적으로 결제 완료 후 3일 정도 소요됩니다.','faqDelivery',to_date('21/05/12','RR/MM/DD'));
Insert into USERID.P_FAQ (FAQ_IDX,FAQ_TITLE,FAQ_CONTENT,FAQ_CATEGORY,FAQ_DATE) values (5,'상품 자주하는 질문','<p>자주하는 질문입니다.</p>','faqProduct',to_date('21/05/12','RR/MM/DD'));
REM INSERTING into USERID.P_INQUIRY
SET DEFINE OFF;
Insert into USERID.P_INQUIRY (INQUIRY_IDX,INQUIRY_CATEGORY,INQUIRY_TITLE,INQUIRY_CONTENT,INQUIRY_IMG,INQUIRY_WRITER,INQUIRY_PW,INQUIRY_DATE,MEMBER_ID) values (1,2,'문의글입니다','문의글입니다','/MyProject_PaperCraft/upload/20210512175552.PNG','홍길동',1111,to_date('21/05/12','RR/MM/DD'),'hong');
Insert into USERID.P_INQUIRY (INQUIRY_IDX,INQUIRY_CATEGORY,INQUIRY_TITLE,INQUIRY_CONTENT,INQUIRY_IMG,INQUIRY_WRITER,INQUIRY_PW,INQUIRY_DATE,MEMBER_ID) values (2,2,'문의글입니다.','문의글입니다.','/MyProject_PaperCraft/upload/20210512182236.PNG','홍길동',1111,to_date('21/05/12','RR/MM/DD'),'hong');
Insert into USERID.P_INQUIRY (INQUIRY_IDX,INQUIRY_CATEGORY,INQUIRY_TITLE,INQUIRY_CONTENT,INQUIRY_IMG,INQUIRY_WRITER,INQUIRY_PW,INQUIRY_DATE,MEMBER_ID) values (3,1,'주문제작 문의입니다.','주문제작 문의입니다.',null,'홍길동',1111,to_date('21/05/12','RR/MM/DD'),'hong');
REM INSERTING into USERID.P_INQUIRY_ANSWER
SET DEFINE OFF;
REM INSERTING into USERID.P_MEMBER
SET DEFINE OFF;
Insert into USERID.P_MEMBER (MEMBER_IDX,MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_GENDER,MEMBER_EMAIL_AD,MEMBER_GRADE,MEMBER_DATE,MEMBER_PURCHASE) values (2,'bae','1234','배선장','서울시','abc@gmail.com','01012341234','여성',1,1,to_date('21/05/12','RR/MM/DD'),0);
Insert into USERID.P_MEMBER (MEMBER_IDX,MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_GENDER,MEMBER_EMAIL_AD,MEMBER_GRADE,MEMBER_DATE,MEMBER_PURCHASE) values (4,'song','1234','송해범','서울시','abc@gmail.com','01012341234','남성',1,3,to_date('21/05/12','RR/MM/DD'),0);
Insert into USERID.P_MEMBER (MEMBER_IDX,MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_GENDER,MEMBER_EMAIL_AD,MEMBER_GRADE,MEMBER_DATE,MEMBER_PURCHASE) values (5,'lim','1234','임욱현','서울시','abc@gmail.com','01012341234','남성',1,1,to_date('21/05/12','RR/MM/DD'),0);
Insert into USERID.P_MEMBER (MEMBER_IDX,MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_GENDER,MEMBER_EMAIL_AD,MEMBER_GRADE,MEMBER_DATE,MEMBER_PURCHASE) values (6,'song','1234','송우창','서울시','abc@gmail.com','01012341234','남성',1,3,to_date('21/05/12','RR/MM/DD'),0);
Insert into USERID.P_MEMBER (MEMBER_IDX,MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_GENDER,MEMBER_EMAIL_AD,MEMBER_GRADE,MEMBER_DATE,MEMBER_PURCHASE) values (7,'ryu','1234','류빈겸','서울시','abc@gmail.com','01012341234','여성',1,1,to_date('21/05/12','RR/MM/DD'),0);
Insert into USERID.P_MEMBER (MEMBER_IDX,MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_GENDER,MEMBER_EMAIL_AD,MEMBER_GRADE,MEMBER_DATE,MEMBER_PURCHASE) values (8,'chun','1234','전균오','서울시','abc@gmail.com','01012341234','남성',1,2,to_date('21/05/12','RR/MM/DD'),0);
Insert into USERID.P_MEMBER (MEMBER_IDX,MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_GENDER,MEMBER_EMAIL_AD,MEMBER_GRADE,MEMBER_DATE,MEMBER_PURCHASE) values (9,'chae','1234','채인수','서울시','abc@gmail.com','01012341234','여성',1,1,to_date('21/05/12','RR/MM/DD'),0);
Insert into USERID.P_MEMBER (MEMBER_IDX,MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_GENDER,MEMBER_EMAIL_AD,MEMBER_GRADE,MEMBER_DATE,MEMBER_PURCHASE) values (12,'admin','1234','홍길동','서울시','abc@gmail.com','01012341234','남성',1,4,to_date('21/05/12','RR/MM/DD'),0);
REM INSERTING into USERID.P_NOTICE
SET DEFINE OFF;
Insert into USERID.P_NOTICE (NOTICE_IDX,NOTICE_PIN,NOTICE_HIT,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE) values (1,1,2,'배송 관련 공지사항입니다.','<p>택배사의 사정으로 인하여 당분간 배송이 지연될 예정입니다.</p><p>고객 여러분의 많은 양해 부탁드립니다.</p><p><br></p><p><span style="font-size: 18pt;">택배발송은 <span style="color: rgb(255, 0, 0);">5월 15일</span>부터 정상적으로 운영될 예정입니다.</span></p>',to_date('21/05/12','RR/MM/DD'));
Insert into USERID.P_NOTICE (NOTICE_IDX,NOTICE_PIN,NOTICE_HIT,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE) values (2,3,1,'상품 품절 관련 공지사항입니다.','<p>품절</p>',to_date('21/05/12','RR/MM/DD'));
REM INSERTING into USERID.P_OPTION
SET DEFINE OFF;
REM INSERTING into USERID.P_ORDER
SET DEFINE OFF;
Insert into USERID.P_ORDER (ORDER_IDX,ORDER_STATUS,ORDER_DATE,ORDER_P_NAME,ORDER_P_PRICE,PRODUCT_IDX1,PRODUCT_IDX2,PRODUCT_IDX3,MEMBER_NAME,MEMBER_ID,MEMBER_GRADE,MEMBER_ADDRESS,MEMBER_PHONE,MEMBER_REQUEST,PAYMENTOPTION,ESCROW,ORDER_P_IMG,ORDER_P_COUNT1,ORDER_P_COUNT2,ORDER_P_COUNT3) values ('admin20210512180726','주문확인중',to_date('21/05/12','RR/MM/DD'),'달빛고양이',13000,'11',null,null,'홍길동','admin',1,'13494 경기 성남시 분당구 판교역로 235 1  (삼평동)','010-1111-1111',null,'무통장입금',null,'/MyProject_PaperCraft/upload/cat.jpg','1',null,null);
Insert into USERID.P_ORDER (ORDER_IDX,ORDER_STATUS,ORDER_DATE,ORDER_P_NAME,ORDER_P_PRICE,PRODUCT_IDX1,PRODUCT_IDX2,PRODUCT_IDX3,MEMBER_NAME,MEMBER_ID,MEMBER_GRADE,MEMBER_ADDRESS,MEMBER_PHONE,MEMBER_REQUEST,PAYMENTOPTION,ESCROW,ORDER_P_IMG,ORDER_P_COUNT1,ORDER_P_COUNT2,ORDER_P_COUNT3) values ('hong20210512175439','주문확인중',to_date('21/05/12','RR/MM/DD'),'오묘 외 1건',23000,'15','11',null,'홍길동','hong',1,'13494 경기 성남시 분당구 판교역로 235 1층  (삼평동)','010-1111-1234',null,'무통장입금',null,'/MyProject_PaperCraft/upload/1 오묘.jpg','1','1',null);
Insert into USERID.P_ORDER (ORDER_IDX,ORDER_STATUS,ORDER_DATE,ORDER_P_NAME,ORDER_P_PRICE,PRODUCT_IDX1,PRODUCT_IDX2,PRODUCT_IDX3,MEMBER_NAME,MEMBER_ID,MEMBER_GRADE,MEMBER_ADDRESS,MEMBER_PHONE,MEMBER_REQUEST,PAYMENTOPTION,ESCROW,ORDER_P_IMG,ORDER_P_COUNT1,ORDER_P_COUNT2,ORDER_P_COUNT3) values ('admin20210512180654','주문확인중',to_date('21/05/12','RR/MM/DD'),'달빛고양이',13000,'11',null,null,'홍길동','admin',1,'13494 경기 성남시 분당구 판교역로 235 1  (삼평동)','010-1111-1111',null,'무통장입금',null,'/MyProject_PaperCraft/upload/cat.jpg','1',null,null);
Insert into USERID.P_ORDER (ORDER_IDX,ORDER_STATUS,ORDER_DATE,ORDER_P_NAME,ORDER_P_PRICE,PRODUCT_IDX1,PRODUCT_IDX2,PRODUCT_IDX3,MEMBER_NAME,MEMBER_ID,MEMBER_GRADE,MEMBER_ADDRESS,MEMBER_PHONE,MEMBER_REQUEST,PAYMENTOPTION,ESCROW,ORDER_P_IMG,ORDER_P_COUNT1,ORDER_P_COUNT2,ORDER_P_COUNT3) values ('hong20210512182149','배송준비중',to_date('21/05/12','RR/MM/DD'),'달빛고양이 외 1건',43000,'11','23',null,'홍길동','hong',1,'13494 경기 성남시 분당구 판교역로 235 1층  (삼평동)','010-1111-1111',null,'무통장입금',null,'/MyProject_PaperCraft/upload/cat.jpg','2','1',null);
REM INSERTING into USERID.P_PRODUCT
SET DEFINE OFF;
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (13,1,'사슴',13000,'사슴 무드등입니다.','/MyProject_PaperCraft/upload/사슴 (1).jpg','/MyProject_PaperCraft/upload/사슴 (1).jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'사슴 메모입니다.');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (11,1,'달빛고양이',10000,'달빛고양이 무드등입니다.','/MyProject_PaperCraft/upload/cat.jpg','/MyProject_PaperCraft/upload/cat.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'달빛고양이 메모입니다.');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (12,1,'새',12000,'새장새 무드등입니다.','/MyProject_PaperCraft/upload/bird01.jpg','/MyProject_PaperCraft/upload/bird02.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'새장새 메모입니다.');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (14,1,'도시',15000,'도시 무드등입니다.','/MyProject_PaperCraft/upload/city.jpg','/MyProject_PaperCraft/upload/city.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'도시 메모입니다.');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (15,3,'오묘',10000,'오묘 액자입니다.','/MyProject_PaperCraft/upload/1 오묘.jpg','/MyProject_PaperCraft/upload/1 오묘.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'오묘 메모입니다.');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (16,3,'다리가 있는 숲',11000,'다리가 있는 숲 입니다.','/MyProject_PaperCraft/upload/2 다리가있는숲.jpg','/MyProject_PaperCraft/upload/2 다리가있는숲.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'다리가 있는 숲 메모입니다.');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (17,3,'고양이 티타임',12000,'고양이 티타임','/MyProject_PaperCraft/upload/6 고양이티타임.jpg','/MyProject_PaperCraft/upload/6 고양이티타임.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'고양이 티타임');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (18,3,'따르는 사슴',13000,'따르는 사슴','/MyProject_PaperCraft/upload/7 따르는 사슴.jpg','/MyProject_PaperCraft/upload/7 따르는 사슴.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'따르는 사슴');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (19,3,'왕의의자',16000,'왕의의자','/MyProject_PaperCraft/upload/8 왕의의자.jpg','/MyProject_PaperCraft/upload/8 왕의의자.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'왕의의자');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (20,3,'도시창가',17000,'도시창가','/MyProject_PaperCraft/upload/12 도시창가.jpg','/MyProject_PaperCraft/upload/12 도시창가.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'도시창가');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (21,3,'버섯마을구름',9000,'버섯마을구름','/MyProject_PaperCraft/upload/15 버섯마을구름.jpg','/MyProject_PaperCraft/upload/15 버섯마을구름.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'버섯마을구름');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (22,3,'고양이신 세트',25000,'고양이신 세트','/MyProject_PaperCraft/upload/28 29 30 고양이신 세트.jpg','/MyProject_PaperCraft/upload/28 29 30 고양이신 세트.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'고양이신 세트');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (23,2,'유리돔01',20000,'유리돔01','/MyProject_PaperCraft/upload/유리돔(1).jpg','/MyProject_PaperCraft/upload/유리돔(1).jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'유리돔01');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (24,2,'유리돔02',20000,'유리돔02','/MyProject_PaperCraft/upload/유리돔(6).jpg','/MyProject_PaperCraft/upload/유리돔(6).jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'유리돔02');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (25,2,'유리돔03',20000,'유리돔03','/MyProject_PaperCraft/upload/유리돔(11).jpg','/MyProject_PaperCraft/upload/유리돔(11).jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'유리돔03');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (27,4,'커팅 매트',10000,'커팅 매트','/MyProject_PaperCraft/upload/커팅 매트.PNG','/MyProject_PaperCraft/upload/커팅 매트.PNG','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'커팅 매트');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (28,4,'어댑터',3000,'어댑터','/MyProject_PaperCraft/upload/어댑터.PNG','/MyProject_PaperCraft/upload/어댑터.PNG','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'어댑터');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (29,4,'공예칼',3000,'공예칼','/MyProject_PaperCraft/upload/공예칼01.PNG','/MyProject_PaperCraft/upload/공예칼01.PNG','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),'공예칼');
Insert into USERID.P_PRODUCT (PRODUCT_IDX,PRODUCT_CATEGORY,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_NOTE,PRODUCT_LISTIMG,PRODUCT_INTROIMG,PRODUCT_DELIVERY_POLICY,DELIVERY_POLICY_CATEGORY,PRODUCT_SWAP_POLICY,SWAP_POLICY_CATEGORY,PRODUCT_RECORD,PRODUCT_MEMO) values (30,3,'카드 DIY 패키지',25000,'카드 DIY 패키지입니다.','/MyProject_PaperCraft/upload/새장새-06.jpg','/MyProject_PaperCraft/upload/새장새-06.jpg','임의경로',1,'임의경로',1,to_date('21/05/12','RR/MM/DD'),null);
REM INSERTING into USERID.P_PRODUCT_INQUIRY
SET DEFINE OFF;
Insert into USERID.P_PRODUCT_INQUIRY (PRODUCT_I_IDX,PRODUCT_I_TITLE,PRODUCT_I_CONTENT,PRODUCT_I_IMG,PRODUCT_I_CATEGORY,PRODUCT_I_NAME,PRODUCT_I_DATE,MEMBER_ID,PRODUCT_IDX,PRODUCT_I_A_CONTENT) values (5,'제품 언제오나요??','<p>좀 급해요 빨리 좀 보내주세요.</p>','/MyProject_PaperCraft/upload/cat.jpg','1','달빛고양이',to_date('21/05/12','RR/MM/DD'),'bae',11,'결제완료부터 평균 3일정도 소요됩니다.');
Insert into USERID.P_PRODUCT_INQUIRY (PRODUCT_I_IDX,PRODUCT_I_TITLE,PRODUCT_I_CONTENT,PRODUCT_I_IMG,PRODUCT_I_CATEGORY,PRODUCT_I_NAME,PRODUCT_I_DATE,MEMBER_ID,PRODUCT_IDX,PRODUCT_I_A_CONTENT) values (6,'사이즈가 얼마나 되나요??','<p>침대 옆 테이블에 놓으려고 합니다.</p>','/MyProject_PaperCraft/upload/cat.jpg','1','달빛고양이',to_date('21/05/12','RR/MM/DD'),'song',11,'20cm x 15cm 정도 입니다.');
Insert into USERID.P_PRODUCT_INQUIRY (PRODUCT_I_IDX,PRODUCT_I_TITLE,PRODUCT_I_CONTENT,PRODUCT_I_IMG,PRODUCT_I_CATEGORY,PRODUCT_I_NAME,PRODUCT_I_DATE,MEMBER_ID,PRODUCT_IDX,PRODUCT_I_A_CONTENT) values (4,'달빛고양이 문의합니다.','<p>어댑터 포함 가격인지 궁금합니다.</p>','/MyProject_PaperCraft/upload/cat.jpg','1','달빛고양이',to_date('21/05/12','RR/MM/DD'),'hong',11,'어댑터는 별도 구매입니다.');
Insert into USERID.P_PRODUCT_INQUIRY (PRODUCT_I_IDX,PRODUCT_I_TITLE,PRODUCT_I_CONTENT,PRODUCT_I_IMG,PRODUCT_I_CATEGORY,PRODUCT_I_NAME,PRODUCT_I_DATE,MEMBER_ID,PRODUCT_IDX,PRODUCT_I_A_CONTENT) values (8,'상품문의입니다.','<p>상품문의입니다.</p>','/MyProject_PaperCraft/upload/cat.jpg','1','달빛고양이',to_date('21/05/12','RR/MM/DD'),'hong',11,'상품 답변입니다.');
REM INSERTING into USERID.P_PRODUCT_REVIEW
SET DEFINE OFF;
Insert into USERID.P_PRODUCT_REVIEW (PRODUCT_R_IDX,PRODUCT_R_CONTENT,PRODUCT_R_IMG,PRODUCT_R_GRADE,PRODUCT_R_DATE,MEMBER_ID,PRODUCT_IDX) values (1,'asgasfasf','/MyProject_PaperCraft/upload/images.jpg','04',to_date('21/05/11','RR/MM/DD'),null,3);
Insert into USERID.P_PRODUCT_REVIEW (PRODUCT_R_IDX,PRODUCT_R_CONTENT,PRODUCT_R_IMG,PRODUCT_R_GRADE,PRODUCT_R_DATE,MEMBER_ID,PRODUCT_IDX) values (3,'매우 만족합니다.','/MyProject_PaperCraft/upload/cat.jpg','05',to_date('21/05/12','RR/MM/DD'),'admin',11);
Insert into USERID.P_PRODUCT_REVIEW (PRODUCT_R_IDX,PRODUCT_R_CONTENT,PRODUCT_R_IMG,PRODUCT_R_GRADE,PRODUCT_R_DATE,MEMBER_ID,PRODUCT_IDX) values (4,'만족합니다.','/MyProject_PaperCraft/upload/cat.jpg','04',to_date('21/05/12','RR/MM/DD'),'admin',11);
--------------------------------------------------------
--  Constraints for Table P_INQUIRY_ANSWER
--------------------------------------------------------

  ALTER TABLE "USERID"."P_INQUIRY_ANSWER" ADD PRIMARY KEY ("INQUIRY_A_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_INQUIRY
--------------------------------------------------------

  ALTER TABLE "USERID"."P_INQUIRY" ADD PRIMARY KEY ("INQUIRY_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_PRODUCT_INQUIRY
--------------------------------------------------------

  ALTER TABLE "USERID"."P_PRODUCT_INQUIRY" ADD PRIMARY KEY ("PRODUCT_I_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_PRODUCT
--------------------------------------------------------

  ALTER TABLE "USERID"."P_PRODUCT" ADD PRIMARY KEY ("PRODUCT_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_MEMBER
--------------------------------------------------------

  ALTER TABLE "USERID"."P_MEMBER" ADD PRIMARY KEY ("MEMBER_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "USERID"."P_MEMBER" MODIFY ("MEMBER_NAME" NOT NULL ENABLE);
  ALTER TABLE "USERID"."P_MEMBER" MODIFY ("MEMBER_PW" NOT NULL ENABLE);
  ALTER TABLE "USERID"."P_MEMBER" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table P_OPTION
--------------------------------------------------------

  ALTER TABLE "USERID"."P_OPTION" ADD PRIMARY KEY ("OPTION_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_PRODUCT_REVIEW
--------------------------------------------------------

  ALTER TABLE "USERID"."P_PRODUCT_REVIEW" ADD PRIMARY KEY ("PRODUCT_R_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_ORDER
--------------------------------------------------------

  ALTER TABLE "USERID"."P_ORDER" ADD PRIMARY KEY ("ORDER_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_NOTICE
--------------------------------------------------------

  ALTER TABLE "USERID"."P_NOTICE" ADD PRIMARY KEY ("NOTICE_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_CART
--------------------------------------------------------

  ALTER TABLE "USERID"."P_CART" ADD PRIMARY KEY ("CART_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table P_FAQ
--------------------------------------------------------

  ALTER TABLE "USERID"."P_FAQ" ADD PRIMARY KEY ("FAQ_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
