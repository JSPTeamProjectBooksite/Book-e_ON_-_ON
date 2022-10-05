-- 모든 테이블 삭제
-- 만약 삭제가 안된다면 부모까지 삭제해주는 삭제 옵션 추가 -> CASCADE CONSTRAINTS
DROP TABLE BOOK_CATEGORY_TBL CASCADE CONSTRAINTS;
DROP TABLE BOOK_REVIEW_TBL;
DROP TABLE LOCKER_TBL;
DROP TABLE NOTICE_TBL;
DROP TABLE PAYMENT_TBL;
DROP TABLE BOOK_TBL;
DROP TABLE AUTHOR_TBL;
DROP TABLE ADMIN_TBL;
DROP TABLE INQUIRY_TBL;
DROP TABLE MEMBER_TBL;
DROP TABLE MEMBER_STATE_TBL;
DROP TABLE GENDER_TBL;

DROP SEQUENCE book_category_SEQ;
DROP SEQUENCE BOOK_REVIEW_SEQ;
DROP SEQUENCE BOOK_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE notice_SEQ;
DROP SEQUENCE inquiry_SEQ;

-- 모든 테이블 생성 가이드
-- 1. book_categroy, member_state
-- 2. member
-- 3. author, inquiry, notice, admin
-- 4. book
-- 5. book_review, payment, locker

-- ============================================================
-- 성별
-- ============================================================
CREATE TABLE gender_TBL (	
	id 		NUMBER 			NOT NULL	PRIMARY KEY, 
	name 	VARCHAR2(30) 	NOT NULL
);
COMMENT ON COLUMN GENDER_TBL.ID IS '성별 식별 번호';
COMMENT ON COLUMN GENDER_TBL.NAME IS '성별 상태';

-- ============================================================
-- 멤버 상태
-- ============================================================
CREATE TABLE member_state_TBL(
	id 		NUMBER			NOT NULL	PRIMARY KEY,
	name 	varchar2(30) 	NOT NULL
);

COMMENT ON COLUMN member_state_TBL.ID IS '상태 식별 번호';
COMMENT ON COLUMN member_state_TBL.NAME IS '상태명';

-- ============================================================
-- 카테고리
-- ============================================================
CREATE TABLE book_category_TBL(
	id 					NUMBER(3) 		NOT NULL	PRIMARY KEY,
	name 				varchar2(100)	NOT NULL,
	parent_categroy_id 	NUMBER(3) 			NULL
);

ALTER TABLE book_category_TBL ADD CONSTRAINT parent_categroy_book_category_id_FK FOREIGN KEY(parent_categroy_id) REFERENCES book_category_TBL(id);

COMMENT ON COLUMN book_category_TBL.ID IS '카테고리 식별 id';
COMMENT ON COLUMN book_category_TBL.NAME IS '카테고리 이름';
COMMENT ON COLUMN book_category_TBL.PARENT_CATEGROY_ID IS '상위 카테고리 id';


CREATE SEQUENCE book_category_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;
	
-- ============================================================
-- 멤버
-- ============================================================
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

-- ============================================================
-- 문의
-- ============================================================
CREATE TABLE inquiry_TBL(
	id 				NUMBER 			NOT NULL	PRIMARY KEY,
	member_id 		NUMBER 			NOT NULL,
	content 		varchar2(4000) 	NOT NULL,
	categroy 		varchar2(100) 	NOT NULL,
	rigister_DATE 	DATE 			DEFAULT sysdate 
);

ALTER TABLE INQUIRY_TBL ADD CONSTRAINT inquiry_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);

COMMENT ON COLUMN inquiry_TBL.ID IS '식별 id';
COMMENT ON COLUMN inquiry_TBL.MEMBER_ID  IS '문의를 쓴 멤버 id';
COMMENT ON COLUMN inquiry_TBL.CONTENT  IS '문의 내용';
COMMENT ON COLUMN inquiry_TBL.CATEGROY  IS '문의 카테고리 (버그, UI, 질문 등등)';
COMMENT ON COLUMN inquiry_TBL.RIGISTER_DATE  IS '문의를 생성한 날짜';

-- ============================================================
-- 작가
-- ============================================================
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
COMMENT ON COLUMN author_TBL.profile_contents  IS '저자 소개 글';
COMMENT ON COLUMN author_TBL.REGISTE_DATE  IS '생성 일자';
COMMENT ON COLUMN author_TBL.UPDATE_DATE IS '마지막 수정 일자';

-- ============================================================
-- 알림
-- ============================================================
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

-- ============================================================
-- 관리자
-- ============================================================
CREATE TABLE admin_TBL(
	member_id		NUMBER			NOT NULL	PRIMARY KEY,
	job_position 	varchar2(30) 	NOT NULL,
	register_DATE 	DATE 			DEFAULT sysdate
);

ALTER TABLE admin_TBL ADD CONSTRAINT admin_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);

COMMENT ON COLUMN admin_TBL.MEMBER_ID IS '관리자 멤버 id';
COMMENT ON COLUMN admin_TBL.JOB_POSITION IS '직책';
COMMENT ON COLUMN admin_TBL.REGISTER_DATE IS '관리자 임명일';

-- ============================================================
-- 책
-- ============================================================
CREATE TABLE book_TBL (
	id						NUMBER			NOT NULL	PRIMARY KEY,
	cover_img 				varchar2(350)		NULL,
	title 					nvarchar2(1000)	NOT NULL,
	author_id 				NUMBER			NOT NULL,
	translator 				nvarchar2(1000)		NULL,
	price 					number(7)		NOT NULL,
	delivery_fee 			number(5)		DEFAULT 0,
	estimated_delivery_date number(3)			NULL,
	total_pages				number(5)		NOT NULL,
	weight 					number(10)			NULL,
	ISBN 					number(13)			NULL,
	book_category_id 		number(3)		NOT NULL,
	introduce 				nvarchar2(1000)		NULL,
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

ALTER TABLE book_TBL ADD CONSTRAINT book_author_id_FK FOREIGN KEY(author_id) REFERENCES author_TBL(member_id);
ALTER TABLE book_TBL ADD CONSTRAINT book_book_category_id_FK FOREIGN KEY(book_category_id) REFERENCES book_category_TBL(id);

COMMENT ON COLUMN book_TBL.ID  IS '책 고유 ID';
COMMENT ON COLUMN book_TBL.COVER_IMG  IS '이미지 링크';
COMMENT ON COLUMN book_TBL.TITLE  IS '제목';
COMMENT ON COLUMN book_TBL.AUTHOR_ID  IS '작가';
COMMENT ON COLUMN book_TBL.TRANSLATOR  IS '옮긴이';
COMMENT ON COLUMN book_TBL.PRICE  IS '가격';
COMMENT ON COLUMN book_TBL.DELIVERY_FEE  IS '배송비';
COMMENT ON COLUMN book_TBL.ESTIMATED_DELIVERY_DATE  IS '예상 배송일';
COMMENT ON COLUMN book_TBL.TOTAL_PAGES  IS '페이지 장수';
COMMENT ON COLUMN book_TBL.WEIGHT  IS '무게';
COMMENT ON COLUMN book_TBL.ISBN  IS 'ISBN 번호';
COMMENT ON COLUMN book_TBL.BOOK_CATEGORY_ID  IS '카테고리';
COMMENT ON COLUMN book_TBL.INTRODUCE  IS '소개글';
COMMENT ON COLUMN book_TBL.INTRODUCE_IMG  IS '소개 이미지 링크';
COMMENT ON COLUMN book_TBL.PUBLISHER  IS '출판사';
COMMENT ON COLUMN book_TBL.PUBLISHER_REVIEW  IS '출판사 리뷰';
COMMENT ON COLUMN book_TBL.CONTENTS  IS '목차';
COMMENT ON COLUMN book_TBL.VISIT  IS '조회수';
COMMENT ON COLUMN book_TBL.QUANTITY  IS '수량';
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

-- ============================================================
-- 리뷰
-- ============================================================
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

-- ============================================================
-- 보관함
-- ============================================================
CREATE TABLE locker_TBL(
	member_id 	NUMBER 	NOT NULL,
	book_id 	NUMBER	NOT NULL,
	CONSTRAINT member_id_and_book_id_PK PRIMARY KEY(member_id, book_id)
);

ALTER TABLE locker_TBL ADD CONSTRAINT locker_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);
ALTER TABLE locker_TBL ADD CONSTRAINT locker_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);

COMMENT ON COLUMN locker_TBL.MEMBER_ID IS '북마크한 멤버 id'; 
COMMENT ON COLUMN locker_TBL.BOOK_ID IS '북마크 당한 책 id'; 

-- ============================================================
-- 결제
-- ============================================================
CREATE TABLE payment_TBL(
	id 				varchar(10) NOT NULL	PRIMARY KEY,
	member_id		NUMBER		NOT NULL,
	book_id			NUMBER		NOT NULL,
	price			number(7)	NOT NULL,
	quantity		number(4)	DEFAULT 0,
	register_date 	DATE		DEFAULT sysdate
);

ALTER TABLE payment_TBL ADD CONSTRAINT payment_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);
ALTER TABLE payment_TBL ADD CONSTRAINT payment_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);

COMMENT ON COLUMN payment_TBL.ID IS '주문 번호';
COMMENT ON COLUMN payment_TBL.MEMBER_ID  IS '주문한 회원 id';
COMMENT ON COLUMN payment_TBL.BOOK_ID  IS '주문한 상품 id';
COMMENT ON COLUMN payment_TBL.PRICE  IS '주문 금액';
COMMENT ON COLUMN payment_TBL.QUANTITY  IS '주문 수량';
COMMENT ON COLUMN payment_TBL.REGISTER_DATE  IS '주문한 날짜';

	