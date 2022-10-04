CREATE TABLE admin_TBL(
	member_id		NUMBER			NOT NULL	PRIMARY KEY,
	job_position 	varchar2(30) 	NOT NULL,
	register_DATE 	DATE 			DEFAULT sysdate
);

ALTER TABLE admin_TBL ADD CONSTRAINT admin_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);

COMMENT ON COLUMN admin_TBL.MEMBER_ID IS '관리자 멤버 id';
COMMENT ON COLUMN admin_TBL.JOB_POSITION IS '직책';
COMMENT ON COLUMN admin_TBL.REGISTER_DATE IS '관리자 임명일';