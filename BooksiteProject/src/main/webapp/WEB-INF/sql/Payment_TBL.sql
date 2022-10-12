--DROP TABLE PAYMENT_TBL;

CREATE TABLE payment_TBL(
	id 						nchar(30) 	NOT NULL	PRIMARY KEY,
	member_id				NUMBER		NOT NULL,
	book_id					NUMBER		NOT NULL,
	price					number(7)	NOT NULL,
	register_date 			DATE		DEFAULT sysdate
);

ALTER TABLE payment_TBL ADD CONSTRAINT payment_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);
ALTER TABLE payment_TBL ADD CONSTRAINT payment_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);

COMMENT ON COLUMN payment_TBL.ID IS '결제 식별 번호';
COMMENT ON COLUMN payment_TBL.MEMBER_ID  IS '결제한 회원 id';
COMMENT ON COLUMN payment_TBL.BOOK_ID  IS '결제한 상품 id';
COMMENT ON COLUMN payment_TBL.PRICE  IS '결제 금액';
COMMENT ON COLUMN payment_TBL.REGISTER_DATE  IS '결제한 날짜';
