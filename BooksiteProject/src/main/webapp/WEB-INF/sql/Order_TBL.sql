--DROP TABLE order_TBL;
--DROP SEQUENCE order_SEQ;

CREATE TABLE order_TBL (
	id				NUMBER			NOT NULL	PRIMARY KEY,
	payment_id		nchar(10)		NOT NULL,
	book_id			NUMBER 			NOT NULL,
	quantity		NUMBER(4)		DEFAULT 1,
	register_date 	DATE			DEFAULT sysdate
);

ALTER TABLE order_TBL ADD CONSTRAINT order_payment_id_FK FOREIGN KEY(payment_id) REFERENCES payment_TBL(id);
ALTER TABLE order_TBL ADD CONSTRAINT order_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);

COMMENT ON COLUMN order_TBL.ID  IS '주문 번호';
COMMENT ON COLUMN order_TBL.PAYMENT_ID  IS '주문 번호';
COMMENT ON COLUMN order_TBL.BOOK_ID  IS '주문한 책 ID';
COMMENT ON COLUMN order_TBL.QUANTITY  IS '주문 수량';
COMMENT ON COLUMN order_TBL.REGISTER_DATE  IS '생성 일자';

CREATE SEQUENCE order_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;
