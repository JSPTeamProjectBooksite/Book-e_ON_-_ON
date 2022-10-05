--DROP TABLE member_TBL;
--DROP SEQUENCE member_SEQ;

CREATE TABLE member_TBL (
	id 				number 			NOT NULL		PRIMARY KEY,
	name 			nvarchar2(30)	NOT NULL, 
	email 			nvarchar2(320) 	NOT NULL, 
	password 		varchar2(30)	NOT NULL, 
	birth 			DATE 				NULL, 
	gender_id 		number(1) 			NULL, 
	phone_num		CHAR(11) 			NULL,
	address 		nvarchar2(100) 		NULL,
	point 			number(8) 		DEFAULT 0,
	member_state_id	number(1)		DEFAULT 0,
	register_date 	DATE 			DEFAULT sysdate
);

ALTER TABLE member_TBL ADD CONSTRAINT member_member_state_id_FK FOREIGN KEY(member_state_id) REFERENCES member_state_TBL(id);
ALTER TABLE member_TBL ADD CONSTRAINT member_gender_id_FK FOREIGN KEY(gender_id) REFERENCES gender_TBL(id);


COMMENT ON COLUMN member_TBL.id IS '유저의 고유번호';
COMMENT ON COLUMN member_TBL.name IS '이름(=별명)';
COMMENT ON COLUMN member_TBL.email IS '이메일';
COMMENT ON COLUMN member_TBL.PASSWORD IS '비밀번호';
COMMENT ON COLUMN member_TBL.birth IS '출생연월 (YYYYMMdd)';
COMMENT ON COLUMN member_TBL.gender_id IS '성별 (M:남자, W:여자)';
COMMENT ON COLUMN member_TBL.phone_num IS '연락처 (010-1234-5678)';
COMMENT ON COLUMN member_TBL.address IS '주소';
COMMENT ON COLUMN member_TBL.point IS '포인트';
COMMENT ON COLUMN member_TBL.MEMBER_STATE_ID IS '계정 상태';
COMMENT ON COLUMN member_TBL.register_date IS '가입일';


CREATE SEQUENCE member_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;
	
