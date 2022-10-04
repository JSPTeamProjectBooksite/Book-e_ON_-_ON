--DROP TABLE notice_TBL;

CREATE TABLE notice_TBL(
	id 				NUMBER 			NOT NULL 	PRIMARY KEY,
	member_id		NUMBER 			NOT NULL,
	title 			varchar2(100) 	NOT NULL,
	category 		nvarchar2(5) 	NOT NULL,
	content			varchar2(4000) 	NOT NULL,
	register_DATE 	DATE 			DEFAULT sysdate
);

ALTER TABLE notice_TBL ADD CONSTRAINT notice_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);

COMMENT ON COLUMN Notice_TBL.ID IS '식별 id';
COMMENT ON COLUMN Notice_TBL.MEMBER_ID  IS '작성자 id';
COMMENT ON COLUMN Notice_TBL.TITLE  IS '알림 제목';
COMMENT ON COLUMN Notice_TBL.CATEGORY  IS '알림 카테고리';
COMMENT ON COLUMN Notice_TBL.CONTENT  IS '알림 내용';
COMMENT ON COLUMN Notice_TBL.REGISTER_DATE  IS '생성 일자';