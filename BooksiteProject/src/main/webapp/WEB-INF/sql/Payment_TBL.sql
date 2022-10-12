--DROP TABLE PAYMENT_TBL;

CREATE TABLE payment_TBL(	
	id 					nchar(10) 		NOT NULL	PRIMARY KEY,
	member_id			NUMBER			NOT NULL,
	book_id				NUMBER			NOT NULL,
	total_amount		number(7)		NOT NULL,
	point_amount		NUMBER(7)		DEFAULT 0,		
	actual_amount		NUMBER(7)		NOT NULL,	
	shipping_state		nvarchar2(3)	DEFAULT '배송 준비중',
	payment_method		varchar2(100)	NOT NULL,
	shipping_message	nvarchar2(1000) 	NULL,	
	register_date 		DATE			DEFAULT sysdate
);

ALTER TABLE payment_TBL ADD CONSTRAINT payment_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);
ALTER TABLE payment_TBL ADD CONSTRAINT payment_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);

COMMENT ON COLUMN payment_TBL.ID IS '결제 식별 번호';
COMMENT ON COLUMN payment_TBL.MEMBER_ID  IS '결제한 회원 id';
COMMENT ON COLUMN payment_TBL.BOOK_ID  IS '결제한 상품 id';
COMMENT ON COLUMN payment_TBL.TOTAL_AMOUNT  IS '총 결제 금액';
COMMENT ON COLUMN payment_TBL.ACTUAL_AMOUNT  IS '실제 결제 금액';
COMMENT ON COLUMN payment_TBL.POINT_AMOUNT  IS '적립금 결제 금액';
COMMENT ON COLUMN payment_TBL.PAYMENT_METHOD  IS '결제 방법';
COMMENT ON COLUMN payment_TBL.SHIPPING_STATE  IS '배송 상태는 배송중으로 고정';
COMMENT ON COLUMN payment_TBL.SHIPPING_MESSAGE  IS '배송 메시지';
COMMENT ON COLUMN payment_TBL.REGISTER_DATE  IS '결제한 날짜';
