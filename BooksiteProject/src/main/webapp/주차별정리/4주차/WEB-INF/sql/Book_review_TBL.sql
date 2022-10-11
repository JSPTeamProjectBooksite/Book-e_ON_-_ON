--DROP TABLE book_review_TBL;
--DROP SEQUENCE book_review_SEQ;

CREATE TABLE book_review_TBL(
	id 				NUMBER			NOT NULL PRIMARY KEY,
	member_id		NUMBER			NOT NULL,
	book_id			NUMBER			NOT NULL,
	score			NUMBER(2)		NOT NULL,
	content			nvarchar2(1000)		NULL,
	like_CNT		NUMBER(5) 		DEFAULT 0,
	register_DATE 	DATE			DEFAULT sysdate
);

ALTER TABLE book_review_TBL ADD CONSTRAINT book_review_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);
ALTER TABLE book_review_TBL ADD CONSTRAINT book_review_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);

COMMENT ON COLUMN book_review_TBL.ID IS '식별 id';
COMMENT ON COLUMN book_review_TBL.MEMBER_ID IS '리뷰를 단 멤버 id';
COMMENT ON COLUMN book_review_TBL.BOOK_ID IS '리뷰가 달린 책 id';
COMMENT ON COLUMN book_review_TBL.SCORE IS '리뷰 별점(0~10)';
COMMENT ON COLUMN book_review_TBL.CONTENT IS '리뷰 내용';
COMMENT ON COLUMN book_review_TBL.LIKE_CNT IS '좋아요 수';
COMMENT ON COLUMN book_review_TBL.REGISTER_DATE  IS '생성한 날짜';

CREATE SEQUENCE book_review_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;

