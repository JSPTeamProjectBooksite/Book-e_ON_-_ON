--DROP TABLE book_TBL;
--DROP SEQUENCE book_SEQ;

CREATE TABLE order_TBL (
	id				NUMBER			NOT NULL	PRIMARY KEY,
	payment_id		NUMBER			NOT NULL,
	book_id			NUMBER 			NOT NULL,
	quantity		NUMBER(4)		DEFAULT 1,
	discount_code	varchar2(20)		NULL,
	register_date 	DATE			DEFAULT sysdate
);

ALTER TABLE order_TBL ADD CONSTRAINT order_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);
ALTER TABLE order_TBL ADD CONSTRAINT book_payment_id_FK FOREIGN KEY(payment_id) REFERENCES payment_TBL(id);

COMMENT ON COLUMN order_TBL.ID  IS '주문 번호';
COMMENT ON COLUMN order_TBL.book_id IS '책 ID'


