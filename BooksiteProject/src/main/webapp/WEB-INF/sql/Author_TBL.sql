--DROP TABLE author_TBL;

CREATE TABLE author_TBL (
	member_id 			NUMBER 			NOT NULL	PRIMARY KEY,
	profile_Img			varchar2(300)		NULL,
	name 				varchar2(30)	NOT NULL,
	nationality			nvarchar2(20)		NULL,
	profile_contents	nvarchar2(1000)		NULL,
	registe_date		DATE			DEFAULT sysdate,
	update_date			DATE			DEFAULT sysdate
);

ALTER TABLE author_TBL ADD CONSTRAINT author_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);

COMMENT ON COLUMN author_TBL.member_id IS '사용자 id';
COMMENT ON COLUMN author_TBL.profile_Img IS '프로필 이미지 경로';
COMMENT ON COLUMN author_TBL.NAME  IS '저자 이름';
COMMENT ON COLUMN author_TBL.NATIONALITY  IS '국적';
COMMENT ON COLUMN author_TBL.PROFILE  IS '저자 소개 글';
COMMENT ON COLUMN author_TBL.REGISTE_DATE  IS '생성 일자';
COMMENT ON COLUMN author_TBL.UPDATE_DATE IS '마지막 수정 일자';
