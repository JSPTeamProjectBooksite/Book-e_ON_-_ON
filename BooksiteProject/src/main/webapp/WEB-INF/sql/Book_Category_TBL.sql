--DROP SEQUENCE book_category_SEQ;
--DROP TABLE book_category_TBL; 

CREATE TABLE book_category_TBL(
	id 					NUMBER(3) 		NOT NULL	PRIMARY KEY,
	name 				varchar2(100)	NOT NULL,
	parent_categroy_id 	NUMBER(3) 			NULL
);

CREATE SEQUENCE book_category_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;

ALTER TABLE book_category_TBL ADD CONSTRAINT parent_categroy_book_category_id_FK FOREIGN KEY(parent_categroy_id) REFERENCES book_category_TBL(id);

COMMENT ON COLUMN book_category_TBL.ID IS '카테고리 식별 id';
COMMENT ON COLUMN book_category_TBL.NAME IS '카테고리 이름';
COMMENT ON COLUMN book_category_TBL.PARENT_CATEGROY_ID IS '상위 카테고리 id';