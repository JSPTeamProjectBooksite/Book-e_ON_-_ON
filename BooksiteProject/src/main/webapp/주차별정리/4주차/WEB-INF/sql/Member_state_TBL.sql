--DROP TABLE MEMBER_STATE_TBL;

CREATE TABLE member_state_TBL(
	id 		NUMBER			NOT NULL	PRIMARY KEY,
	name 	varchar2(30) 	NOT NULL
);

COMMENT ON COLUMN member_state_TBL.ID IS '상태 식별 번호';
COMMENT ON COLUMN member_state_TBL.NAME IS '상태명';