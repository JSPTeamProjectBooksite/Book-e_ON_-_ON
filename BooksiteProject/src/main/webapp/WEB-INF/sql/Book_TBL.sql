--DROP TABLE book_TBL;
--DROP SEQUENCE book_SEQ;

CREATE TABLE book_TBL (
	id						NUMBER			NOT NULL	PRIMARY KEY,
	cover_img 				varchar2(350)		NULL,
	title 					nvarchar2(1000)	NOT NULL,
	author_id 				NUMBER			NOT NULL,
	translator 				nvarchar2(1000)		NULL,
	price 					number(7)		NOT NULL,
	total_pages				number(5)		NOT NULL,
	weight 					number(10)			NULL,
	ISBN13 					number(13)			NULL,
	ISBN10 					number(10)			NULL,
	book_category_id 		number(3)		NOT NULL,
	introduce 				varchar2(4000)		NULL,
	introduce_img 			varchar2(350)		NULL,
	publisher 				nvarchar2(50)		NULL,
	publisher_review 		nvarchar2(1000)		NULL,
	contents				nvarchar2(2000)	NOT NULL,
	visit 					number(7)			NULL,
	quantity				number(4)		DEFAULT 0,
	catchphrase 			varchar2(500)		NULL,
	publication_date 		DATE			NOT NULL,
	register_date 			DATE			DEFAULT sysdate,
	update_date				DATE			DEFAULT sysdate
);

ALTER TABLE book_TBL ADD CONSTRAINT book_author_id_FK FOREIGN KEY(author_id) REFERENCES author_TBL(id);
ALTER TABLE book_TBL ADD CONSTRAINT book_book_category_id_FK FOREIGN KEY(book_category_id) REFERENCES book_category_TBL(id);

COMMENT ON COLUMN book_TBL.ID  IS '책 고유 ID';
COMMENT ON COLUMN book_TBL.COVER_IMG  IS '이미지 링크';
COMMENT ON COLUMN book_TBL.TITLE  IS '제목';
COMMENT ON COLUMN book_TBL.AUTHOR_ID  IS '작가';
COMMENT ON COLUMN book_TBL.TRANSLATOR  IS '옮긴이';
COMMENT ON COLUMN book_TBL.PRICE  IS '가격';
COMMENT ON COLUMN book_TBL.TOTAL_PAGES  IS '페이지 장수';
COMMENT ON COLUMN book_TBL.WEIGHT  IS '무게';
COMMENT ON COLUMN book_TBL.ISBN10  IS 'ISBN10 번호';
COMMENT ON COLUMN book_TBL.ISBN13  IS 'ISBN13 번호';
COMMENT ON COLUMN book_TBL.BOOK_CATEGORY_ID  IS '카테고리';
COMMENT ON COLUMN book_TBL.INTRODUCE  IS '소개글';
COMMENT ON COLUMN book_TBL.INTRODUCE_IMG  IS '소개 이미지 링크';
COMMENT ON COLUMN book_TBL.PUBLISHER  IS '출판사';
COMMENT ON COLUMN book_TBL.PUBLISHER_REVIEW  IS '출판사 리뷰';
COMMENT ON COLUMN book_TBL.CONTENTS  IS '목차';
COMMENT ON COLUMN book_TBL.VISIT  IS '조회수';
COMMENT ON COLUMN book_TBL.QUANTITY  IS '재고 수량';
COMMENT ON COLUMN book_TBL.CATCHPHRASE  IS '흥미를 끌만한 글이 들어갈 곳';
COMMENT ON COLUMN book_TBL.PUBLICATION_DATE  IS '출시일';
COMMENT ON COLUMN book_TBL.REGISTER_DATE  IS '작성일';
COMMENT ON COLUMN book_TBL.UPDATE_DATE  IS '수정일자';


CREATE SEQUENCE book_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;

