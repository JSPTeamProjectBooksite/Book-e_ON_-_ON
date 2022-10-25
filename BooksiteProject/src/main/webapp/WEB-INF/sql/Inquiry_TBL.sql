--DROP TABLE INQUIRY_TBL;

CREATE TABLE inquiry_TBL(
	id 				NUMBER 			NOT NULL	PRIMARY KEY,
	member_id 		NUMBER 			NOT NULL,
	title			varchar(500)	NOT NULL,
	content 		varchar2(4000) 	NOT NULL,
	reply 		varchar2(4000) 		NULL,
	categroy 		varchar2(100) 	NOT NULL,
	state			varchar2(50)	DEFAULT '답변 대기',
	rigister_DATE 	DATE 			DEFAULT sysdate 
);

ALTER TABLE INQUIRY_TBL ADD CONSTRAINT inquiry_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);

COMMENT ON COLUMN inquiry_TBL.ID IS '식별 id';
COMMENT ON COLUMN inquiry_TBL.MEMBER_ID IS '문의를 쓴 멤버 id';
COMMENT ON COLUMN inquiry_TBL.TITLE  IS '문의 제목';
COMMENT ON COLUMN inquiry_TBL.CONTENT  IS '문의 내용';
COMMENT ON COLUMN inquiry_TBL.REPLY  IS '답변 내용';
COMMENT ON COLUMN inquiry_TBL.CATEGROY  IS '문의 카테고리 (버그, UI, 질문 등등)';
COMMENT ON COLUMN inquiry_TBL.STATE  IS '답변 상태';
COMMENT ON COLUMN inquiry_TBL.RIGISTER_DATE  IS '문의를 생성한 날짜';

CREATE SEQUENCE inquiry_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;