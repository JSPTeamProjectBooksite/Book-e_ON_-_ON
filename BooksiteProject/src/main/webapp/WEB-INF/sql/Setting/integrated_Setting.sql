-- ==================================================================================================================================
-- ==================================================================================================================================
-- ==================================================================================================================================

-- DB테이블 세팅

-- ==================================================================================================================================
-- ==================================================================================================================================
-- ==================================================================================================================================

-- 모든 테이블 삭제
-- 만약 삭제가 안된다면 부모까지 삭제해주는 삭제 옵션 추가 -> CASCADE CONSTRAINTS
DROP TABLE BOOK_CATEGORY_TBL CASCADE CONSTRAINTS;
DROP TABLE BOOK_REVIEW_TBL;
DROP TABLE LOCKER_TBL;
DROP TABLE NOTICE_TBL;
DROP TABLE ORDER_TBL;
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
DROP SEQUENCE payment_SEQ;
DROP SEQUENCE order_SEQ;
DROP SEQUENCE author_SEQ;

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
	id 				number 			NOT NULL	PRIMARY KEY,
	name 			nvarchar2(30)	NOT NULL, 
	email 			nvarchar2(320) 	NOT NULL, 
	password 		varchar2(30)	NOT NULL, 
	birth 			DATE 				NULL, 
	gender			nchar(1) 			NULL, 
	phone_num		CHAR(13) 			NULL,
	address 		nvarchar2(100) 		NULL,
	point 			number(8) 		DEFAULT 0,
	member_state_id	number(1)		DEFAULT 0,
	register_date 	DATE 			DEFAULT sysdate
);

ALTER TABLE member_TBL ADD CONSTRAINT member_member_state_id_FK FOREIGN KEY(member_state_id) REFERENCES member_state_TBL(id);

COMMENT ON COLUMN member_TBL.id IS '유저의 고유번호';
COMMENT ON COLUMN member_TBL.name IS '이름(=별명)';
COMMENT ON COLUMN member_TBL.email IS '이메일';
COMMENT ON COLUMN member_TBL.PASSWORD IS '비밀번호';
COMMENT ON COLUMN member_TBL.birth IS '출생연월 (YYYYMMdd)';
COMMENT ON COLUMN member_TBL.gender IS '성별 (M:남자, W:여자, E:기타)';
COMMENT ON COLUMN member_TBL.phone_num IS '연락처 (01012345678)';
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
	title			varchar(500)	NOT NULL,
	content 		varchar2(4000) 	NOT NULL,
	reply 			varchar2(4000) 		NULL,
	categroy 		varchar2(100) 	NOT NULL,
	state			varchar2(50)	DEFAULT '답변 대기중',
	rigister_DATE 	DATE 			DEFAULT sysdate 
);

ALTER TABLE INQUIRY_TBL ADD CONSTRAINT inquiry_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);

COMMENT ON COLUMN inquiry_TBL.ID IS '식별 id';
COMMENT ON COLUMN inquiry_TBL.MEMBER_ID  IS '문의를 쓴 멤버 id';
COMMENT ON COLUMN inquiry_TBL.TITLE  IS '문의 제목';
COMMENT ON COLUMN inquiry_TBL.CONTENT  IS '문의 내용';
COMMENT ON COLUMN inquiry_TBL.REPLY  IS '문의 답변';
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

-- ============================================================
-- 작가
-- ============================================================
CREATE TABLE author_TBL (
	id 					NUMBER 			NOT NULL	PRIMARY KEY,
	profile_Img			varchar2(300)		NULL,
	name 				varchar2(30)	NOT NULL,
	birth 				DATE 				NULL, 
	death 				DATE 				NULL, 
	nationality			nvarchar2(20)		NULL,
	profile_contents	nvarchar2(1000)		NULL,
	register_date		DATE			DEFAULT sysdate,
	update_date			DATE			DEFAULT sysdate
);

COMMENT ON COLUMN author_TBL.id IS '저자 식별 id';
COMMENT ON COLUMN author_TBL.PROFILE_IMG  IS '프로필 이미지 경로';
COMMENT ON COLUMN author_TBL.NAME  IS '저자 이름';
COMMENT ON COLUMN author_TBL.birth IS '출생일 (YYYYMMdd)';
COMMENT ON COLUMN author_TBL.death IS '사망일 (YYYYMMdd)';
COMMENT ON COLUMN author_TBL.NATIONALITY  IS '국적';
COMMENT ON COLUMN author_TBL.PROFILE_CONTENTS  IS '저자 소개 글';
COMMENT ON COLUMN author_TBL.REGISTER_DATE  IS '생성 일자';
COMMENT ON COLUMN author_TBL.UPDATE_DATE IS '마지막 수정 일자';

CREATE SEQUENCE author_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;

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

CREATE SEQUENCE notice_SEQ 
	INCREMENT BY 1 
	START WITH 1 
	MINVALUE 1 
	nomaxvalue 
	nocycle 
	nocache;

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
	translator 				nvarchar2(300)		NULL,
	price 					number(7)		NOT NULL,
	total_pages				number(5)			NULL,
	weight 					number(10)			NULL,
	ISBN13 					varchar2(13)		NULL,
	ISBN10 					varchar2(10)		NULL,
	book_category_id 		number(3)			NULL,
	introduce 				CLOB				NULL,
	introduce_img 			varchar2(350)		NULL,
	publisher 				nvarchar2(50)		NULL,
	publisher_review 		CLOB				NULL,
	delivery_fee 			number(5)		DEFAULT 2500,
	estimated_delivery_date number(3)			NULL,
	contents				CLOB				NULL,
	visit 					number(7)		DEFAULT 0,
	quantity				number(4)			NULL,
	catchphrase 			varchar2(1000)		NULL,
	publication_date 		DATE				NULL,
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
COMMENT ON COLUMN book_TBL.DELIVERY_FEE  IS '배송비';
COMMENT ON COLUMN book_TBL.ESTIMATED_DELIVERY_DATE  IS '예상 배송일';
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
	id 					nchar(12) 		NOT NULL	PRIMARY KEY,
	member_id			NUMBER			NOT NULL,
	total_amount		number(7)		NOT NULL,
	point_amount		NUMBER(7)		DEFAULT 0,		
	actual_amount		NUMBER(7)		NOT NULL,	
	shipping_state		nvarchar2(10)	DEFAULT '배송준비중',
	payment_method		varchar2(100)	NOT NULL,
	shipping_message	nvarchar2(2000) 	NULL,	
	register_date 		DATE			DEFAULT sysdate
);

ALTER TABLE payment_TBL ADD CONSTRAINT payment_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);
--ALTER TABLE payment_TBL ADD CONSTRAINT payment_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);

COMMENT ON COLUMN payment_TBL.ID IS '결제 식별 번호';
COMMENT ON COLUMN payment_TBL.MEMBER_ID  IS '결제한 회원 id';
COMMENT ON COLUMN payment_TBL.TOTAL_AMOUNT  IS '총 결제 금액';
COMMENT ON COLUMN payment_TBL.ACTUAL_AMOUNT  IS '실제 결제 금액';
COMMENT ON COLUMN payment_TBL.POINT_AMOUNT  IS '적립금 결제 금액';
COMMENT ON COLUMN payment_TBL.PAYMENT_METHOD  IS '결제 방법';
COMMENT ON COLUMN payment_TBL.SHIPPING_STATE  IS '배송 상태는 배송중으로 고정';
COMMENT ON COLUMN payment_TBL.SHIPPING_MESSAGE  IS '배송 메시지';
COMMENT ON COLUMN payment_TBL.REGISTER_DATE  IS '결제한 날짜';

CREATE SEQUENCE payment_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;

-- ============================================================
-- 주문
-- ============================================================
CREATE TABLE order_TBL (
	id				NUMBER			NOT NULL	PRIMARY KEY,
	payment_id		nchar(12)		NOT NULL,
	book_id			NUMBER 			NOT NULL,
	quantity		NUMBER(4)		DEFAULT 1,
	register_date 	DATE			DEFAULT sysdate
);

--ALTER TABLE order_TBL ADD CONSTRAINT order_payment_id_FK FOREIGN KEY(payment_id) REFERENCES payment_TBL(id);
ALTER TABLE order_TBL ADD CONSTRAINT order_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);

COMMENT ON COLUMN order_TBL.ID  IS '주문 번호';
COMMENT ON COLUMN order_TBL.PAYMENT_ID  IS '주문 번호';
COMMENT ON COLUMN order_TBL.BOOK_ID  IS '주문한 책 ID';
COMMENT ON COLUMN order_TBL.QUANTITY  IS '주문 수량';
COMMENT ON COLUMN order_TBL.REGISTER_DATE  IS '생성 일자';

CREATE SEQUENCE order_SEQ
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;

-- ==================================================================================================================================
-- ==================================================================================================================================
-- ==================================================================================================================================

-- 더미값 세팅

-- * 책 더미데이터의 값을 넣는 순서
-- 1. 카테고리
-- 2. 작가
-- 3. 책

-- ==================================================================================================================================
-- ==================================================================================================================================
-- ==================================================================================================================================

-- ============================================================
-- 멤버 상태
-- ============================================================
INSERT INTO member_state_TBL(id, name) VALUES(0, '사용가능');
INSERT INTO member_state_TBL(id, name) VALUES(1, '로그인 중');
INSERT INTO member_state_TBL(id, name) VALUES(2, '삭제 유예');
INSERT INTO member_state_TBL(id, name) VALUES(3, '정지');
INSERT INTO member_state_TBL(id, name) VALUES(4, '휴면');

-- ============================================================
-- 카테고리
-- ============================================================


-- level 1 분류
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'eBook', null);

-- level 2 분류
-- eBook>
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '일반', 1); -- 2
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '로맨스', 1);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, 'BL', 1);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '판타지', 1);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '라이트노벨', 1);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '코믹스', 1);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '오디오북', 1);

-- level 3 분류
-- eBook> 일반>
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '소설', 2); -- 9
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '시/에세이', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경제경영', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '자기계발', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '인문', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '역사/문화', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '정치/사회', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '국어/외국어', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '건강/의학', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '교재/수험서', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, 'IT/프로그래밍', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '과학/공학', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '예술/대중문화', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '종교', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '가정/생활/요리', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '여행/취미', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '매거진', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년교양', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '아동', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '유아', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '북모닝CEO', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '외국도서', 2);

-- eBook> 일반> 소설
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '한국소설', 9);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '영미소설', 9);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '일본소설', 9);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '중국소설', 9);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '기타나라소설', 9);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '러시아소설', 9);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '프랑스소설', 9);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '독일소설', 9);

-- eBook> 일반> 시/에세이
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '시', 10);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '에세이', 10);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '테마시/에세이', 10);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '시/에세이 문고', 10);

-- eBook> 일반> 경제경영
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경영일반/경영이론', 11);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '마케팅/세일즈', 11);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '재테크/금융', 11);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경제일반/경제이론', 11);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경영관리/CEO', 11);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경영전략/e비즈니스', 11);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '기업실무관리', 11);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '유통/창업', 11);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '각국경제', 11);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '무역/교통/관광', 11);

-- eBook> 일반> 자기계발
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '성공/처세', 12);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '자기능력계발', 12);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '비즈니스소양', 12);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '인간관계', 12);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '화술/협상', 12);

-- eBook> 일반> 인문
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '문학의이해', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '문학이론', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '한국문학이론', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '한문학/한자', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '영미문학이론', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '중국문학이론', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '세계문학이론', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '언어학', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '국어학', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '글쓰기', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '독서법/독서지도', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '교양철학', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '철학이론', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '동양철학', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '서양철학', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '논리학/윤리학', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '인문학일반', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '인문교양', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '교육일반', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '교육이론/교육방법', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '유/초등부교육', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '특수교육', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '교양심리', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '심리이론', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '심리치료/정신분석', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '역학/사주', 13);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '문헌정보학', 13);

-- eBook> 일반> 역사/문화
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '역사일반', 14);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '세계사', 14);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '서양사', 14);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '동양사', 14);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '한국사', 14);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '풍속/민속', 14);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '문화사', 14);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '인류학/고고학', 14);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '신화/신화학', 14);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '지리학', 14);

-- eBook> 일반> 정치/사회
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '사회문제/사회복지', 15);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '언론/신문/방송', 15);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '사회조사/통계', 15);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '정치/외교', 15);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '행정/정책', 15);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '국방/군사/통일', 15);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '법률/소송', 15);

-- eBook> 일반> 국어/외국어
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '영어회화/청취', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '문법/단어/독해/작문', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '영어교재/문고', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, 'EBS라디오어학', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '수험영어', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '비즈니스영어', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '어린이영어', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '일본어', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '중국어', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '프랑스어', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '독일어', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '기타외국어', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '한자', 16);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '한국소개도서/한국어교재', 16);

-- eBook> 일반> 건강/의학
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '성/사랑', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '건강일반', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '질병치료/예방', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '한방치료', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '다이어트/헬스', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '자연요법/대체의학', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '의학', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '각과의학', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '약학', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '간호학', 17);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '한의학', 17);

-- eBook> 일반> 교재/수험서
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '대학입시면접', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '취업전략', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '기타수험서', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '대학입시논술', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '대입검정고시', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '취업수험서', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '공무원수험서', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '고등학교', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '중학교', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '초등학교', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '사전/연감', 18);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '교재', 18);

-- eBook> 일반> IT/프로그래밍
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '컴퓨터수험서 관련', 19);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '컴퓨터입문/활용', 19);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '컴퓨터공학', 19);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, 'OS/네트워크', 19);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '데이터베이스구축/관리', 19);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '게임', 19);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '프로그래밍 및 언어', 19);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, 'OA(사무자동화)', 19);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '웹사이트/홈페이지만들기', 19);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '그래픽/멀티미디어', 19);

-- eBook> 일반> 과학/공학
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '교양과학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '과학이론', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '수학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '물리학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '화학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '생물학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '지구과학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '천문학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '자연/과학시리즈', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '건축/인테리어', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '토목/건설', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '환경/도시/조경', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '기계/역학/항공', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '자동차 공학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '전기/전자', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '농수산/축산/수의학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '공학일반/산업공학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '금속/제조/화학', 20);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '생활과학', 20);

-- eBook> 일반> 예술/대중문화
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '예술입문서', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '예술론/미학', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '미술', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '디자인/도안', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '음악', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '사진/영상', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '연극/희곡', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '영화/드라마', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '만화작법/애니메이션', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '대중문화이론', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '대중연예/음악', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '체육/무용', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '갤러리북/포토북/도록', 21);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '패션/의류', 21);

-- eBook> 일반> 종교
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '종교일반', 22);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '불교', 22);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '기독교', 22);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '가톨릭', 22);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '그외 종교', 22);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '역학/사주', 22);

-- eBook> 일반> 가정/생활/요리
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '결혼과부부생활', 23);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '가정생활 일반', 23);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '태교/출산준비', 23);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '육아', 23);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '좋은부모', 23);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '홈인테리어', 23);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '요리', 23);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '와인/칵테일/음료', 23);

-- eBook> 일반> 여행/취미
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '국내여행', 24);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '해외여행', 24);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '테마여행', 24);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '이민/유학', 24);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '취미', 24);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '스포츠', 24);

-- eBook> 일반> 매거진
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '패션지', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '여성지', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경제/경영', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '인문/사회/종교', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '자연/공학/건축', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '문학/교양', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '어학/교육', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '예술/대중문화', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '여행/취미/레포츠', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '컴퓨터/게임', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '기타잡지', 25);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '성인잡지', 25);

-- eBook> 일반> 청소년교양
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 시/에세이', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 고전', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 문학', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 정치/사회', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 예술', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 인문교양', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 역사', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 경제', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '공부방법', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '진로', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 교양과학', 26);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '청소년 자기계발', 26);

-- eBook> 일반> 아동
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '호기심/창의력/습관', 27);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '학습참고서', 27);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '어린이문학', 27);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '아동교양만화', 27);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '아동학습만화', 27);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '초등1~2학년', 27);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '초등3~4학년', 27);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '초등5~6학년', 27);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '초등공통1~6학년', 27);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '상식/취미/실용', 27);

-- eBook> 일반> 유아
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '유아놀이', 28);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '그림책', 28);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '유아 교양', 28);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '0~3세', 28);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '4~7세', 28);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '0~7세(유아공통)', 28);

-- eBook> 일반> 북모닝CEO
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '자기계발', 29);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경영관리', 29);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '직장처세', 29);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '리더십', 29);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경제/재테크', 29);

-- eBook> 일반> 외국도서
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '문학', 30);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '취미/실용/여행', 30);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '생활/요리/건강', 30);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '예술/건축', 30);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '인문/사회', 30);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경제/경영', 30);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '과학/기술', 30);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '아동/청소년', 30);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '구텐베르크 프로젝트', 30);


-- eBook> 로맨스>
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '현대로맨스', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '동서양시대물', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '로맨스판타지', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '할리퀸', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, 'TL/관능', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '성인소설', 3);

-- eBook> BL>
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '국내 BL', 4);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '해외 BL', 4);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, 'GL', 4);

-- eBook> 판타지>
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '정통판타지', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '현대판타지', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '전쟁/대체역사', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '퓨전판타지', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '게임/레이드', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '정통무협', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '신무협', 5);

-- eBook> 라이트노벨>
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '국내라이트노벨', 6);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '해외라이트노벨', 6);

-- eBook> 코믹스>
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '웹툰', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '교양/역사만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '드라마', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '성인만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '순정만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '스포츠만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '액션/무협 만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '명랑/코믹 만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '기타 만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '학원 만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, 'BL 만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '요리 만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, 'SF/판타지 만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '그래픽 노블', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '탐정/추리 만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '공포/스릴러 만화', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '만화잡지', 7);

-- eBook> 오디오북>
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '소설', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '경제경영', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '자기계발', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '시에세이', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '가정/생활/요리', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '건강/취미', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '인문/사회/역사', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '아동/청소년', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval, '기타', 8);


-- ============================================================
-- 멤버
-- ============================================================
--DECLARE
--	user_name varchar2(6) := 'user_';
--
--BEGIN
--    FOR I IN 1..10
--    LOOP
--	    INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address) 
--	   	VALUES(member_SEQ.nextval, user_name || I, user_name || I || '@gmail.com', user_name || I, '2002-02-02', '기타', '01012345678', '경기도 어딘가 무슨곳 좋은동');
--    END LOOP;
--END;

INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address, point) VALUES(member_SEQ.nextval, 'user01', 'user01@gmail.com', 'user01', '2022-10-01', 'M', '0100010001', '경기도 어딘가 무슨곳 좋은동', 30000);
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address, point) VALUES(member_SEQ.nextval, 'user02', 'user02@gmail.com', 'user02', '2022-10-01', 'W', '0100010002', '경기도 어딘가 무슨곳 좋은동', 30000);
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address, point) VALUES(member_SEQ.nextval, 'user03', 'user03@gmail.com', 'user03', '2022-10-01', 'E', '0100010003', '경기도 어딘가 무슨곳 좋은동', 30000);
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address, point) VALUES(member_SEQ.nextval, 'user04', 'user04@gmail.com', 'user04', '2022-10-01', NULL, '0100010004', '경기도 어딘가 무슨곳 좋은동', 30000);

INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address, point) VALUES(member_SEQ.nextval, 'd', 'd', 'd', '2022-10-20', 'M', '0100010005', 'd', 10000);




-- ============================================================
-- 문의
-- ============================================================
INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, TITLE, CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, 1, '404에러나요', '404에러나요', '에러');
INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, TITLE, CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, 1, '405에러나요', '405에러나요', '에러');
INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, TITLE, CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, 1, '500에러나요', '500에러나요', '에러');


-- ============================================================
-- 저자
-- ============================================================
INSERT INTO author_TBL (id, profile_Img, name, nationality, PROFILE_CONTENTS) VALUES(author_SEQ.nextval, './source/author/나겨울_소개이미지.png', '나겨울', '국내작가', '글이 사람들에게 선한 영향력을 미치는 수단이라고 믿는다.');
INSERT INTO author_TBL (id, profile_Img, name, nationality, PROFILE_CONTENTS) VALUES(author_SEQ.nextval, NULL, '김욱동', '국내작가', '한국외국어대학교 영문과 및 동 대학원을 졸업한 뒤 미국 미시시피대학교에서 영문학 문학석사 학위를, 뉴욕주립대학교에서 영문학 문학박사를 받았다.');
INSERT INTO author_TBL (id, profile_Img, name, nationality, PROFILE_CONTENTS) VALUES(author_SEQ.nextval, NULL, '손원평', '국내작가', '서울에서 태어났다. 서강대학교에서 사회학과 철학을 공부했고 한국영화아카데미 영화과에서 영화 연출을 전공했다.');
-- 10.24 추가
INSERT INTO AUTHOR_TBL (ID,PROFILE_IMG,NAME,BIRTH,DEATH,NATIONALITY,PROFILE_CONTENTS,REGISTER_DATE,UPDATE_DATE) VALUES (author_SEQ.nextval,'https://contents.kyobobook.co.kr/dtl/author/1000698301.jpg','김난도',TIMESTAMP'1963-03-02 00:00:00.0',NULL,'국내 작가','김난도<br>교수, 트렌드 연구자, 컨설턴트, 작가, 유튜버. 서울대학교 생활과학대학 소비자학과 교수와 서울대학교 생활과학연구소 소비트렌드분석센터장으로 일하며, 유튜브 채널 ‘트렌드코리아TV’를 진행하고 있다. 〈트렌드 코리아〉 시리즈를 2008년부터, 그 영문판인 〈Consumer Trend Insights〉 시리즈를 2020년부터 매년 출간하고 있다.',TIMESTAMP'2022-10-24 09:37:55.0',TIMESTAMP'2022-10-24 09:37:55.0');
INSERT INTO AUTHOR_TBL (ID,PROFILE_IMG,NAME,BIRTH,DEATH,NATIONALITY,PROFILE_CONTENTS,REGISTER_DATE,UPDATE_DATE) VALUES (author_SEQ.nextval,'https://contents.kyobobook.co.kr/dtl/author/2002138601.jpg','아니 에르노',TIMESTAMP'1940-09-01 00:00:00.0',NULL,'프랑스 작가','아니 에르노는 1940년 릴본에서 태어나, 노르망디의 이브토에서 자랐다. 루앙 대학에서 문학을 공부한 후, 정식 교원, 현대문학 교수 자격증을 획득했다. 1974년 『빈 옷장』으로 등단해 『남자의 자리』로 르노도상을 수상했으며, 자전적인 글쓰기와 역사, 사회를 향한 작가만의 시선을 가공이나 은유 없이 정확하게 담아내는 작품세계를 구축해 온 작가다.<br><br>대표작으로는 『단순한 열정』 『사진의 용도』 『한 여자』 『부끄러움』 『다른 딸』 등이 있으며, 2008년 『세월』로 마그리트 뒤라스상, 프랑수아 모리아크상, 프랑스어상, 텔레그램 독자상을 수상했다.',TIMESTAMP'2022-10-24 09:47:00.0',TIMESTAMP'2022-10-24 09:47:00.0');
INSERT INTO AUTHOR_TBL (ID,PROFILE_IMG,NAME,BIRTH,DEATH,NATIONALITY,PROFILE_CONTENTS,REGISTER_DATE,UPDATE_DATE) VALUES (author_SEQ.nextval,'https://t1.daumcdn.net/thumb/R720x0.fpng/?fname=http://t1.daumcdn.net/brunch/service/user/9lr1/image/N15DZgdj9tWOXMCdGEwJsbC2jbY.png','고코더 (이진현)',NULL,NULL,'국내 작가','코딩보다 글 쓰는 걸 좋아하는 프로그래머. 한진정보통신에서 개발자로 재직 중이다. 오프라인에서 강의와 세미나를 진행하고, 온라인에서는 코딩 강의와 글쓰기 활동을 하고 있다. 모든 사람이 IT를 더 쉽고 재미있게 즐겼으면 하는 바람에서 글을 쓰고 이야기를 나눈다.<br>『오늘도, 우리는 코딩을 합니다』, 『이야기로 다가가는 HTML』을 집필했다.',TIMESTAMP'2022-10-24 09:52:02.0',TIMESTAMP'2022-10-24 09:52:02.0');
INSERT INTO AUTHOR_TBL (ID,PROFILE_IMG,NAME,BIRTH,DEATH,NATIONALITY,PROFILE_CONTENTS,REGISTER_DATE,UPDATE_DATE) VALUES (author_SEQ.nextval,'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Cathy_Hackl.jpg/800px-Cathy_Hackl.jpg','캐시 해클 외 2명',NULL,NULL,'미국 작가','CATHY HACKL<br>캐시 해클은 HTC 바이브, 매직 리프 및 아마존 웹 서비스 등 메타버스 분야에서 세계적으로 인정받는 메타버스 전문가이자, 기술 미래학자이다. 또한 그녀는 메타버스 성장 전략, NFT, 게임, 가상 패션 및 브랜드를 가상 세계로 확장하는 방법에 대해 세계 최고의 브랜드와 협력하는 선도적 메타버스 컨설팅 회사인 퓨처스 인텔리전스 그룹의 CEO다. 캐시는 ‘메타버스 대모’로 불리며 링크드인에서 최고의 기술 전문가 중 한 명이며, ‘빅 싱크Big Think’는 2020년 기술 분야에서 가장 영향력 있는 여성 10인 중 한 명으로 선정했다. 2021년에는 ‘싱커스 50Thinkers 50 Radar’ 목록에 이름을 올려 조직 관리 방식의 미래를 만들어갈 경영 사상가 30인으로 선정됐다.',TIMESTAMP'2022-10-24 09:57:29.0',TIMESTAMP'2022-10-24 09:57:29.0');
INSERT INTO AUTHOR_TBL (ID,PROFILE_IMG,NAME,BIRTH,DEATH,NATIONALITY,PROFILE_CONTENTS,REGISTER_DATE,UPDATE_DATE) VALUES (author_SEQ.nextval,'https://contents.kyobobook.co.kr/dtl/author/1000093701.jpg','김용섭',NULL,NULL,'국내 작가','Trend Insight & Business Creativity를 연구하는 ‘날카로운상상력연구소’ 소장. 트렌드 분석가이자 경영전략 컨설턴트, 비즈니스 창의력 연구자다. 삼성전자, 현대자동차, LG, GS, CJ, SK, 한화, 롯데, 포스코, 신세계 등 대기업 그룹사 및 주요 계열사와 기획재정부, 국토교통부, 외교부 등 정부기관에서 2800회 이상의 강연과 비즈니스 워크숍을 수행했고, 300여 건의 컨설팅 프로젝트를 수행했다.',TIMESTAMP'2022-10-24 09:54:03.0',TIMESTAMP'2022-10-24 09:54:03.0');



-- ============================================================
-- 알림
-- ============================================================
INSERT INTO NOTICE_TBL(ID, MEMBER_ID, TITLE, CATEGORY, CONTENT) VALUES(notice_SEQ.nextval, 1, '올해 놓치면 안되는 특가 상품 TOP 10', '이벤트', '이벤트 경로& 안내');
INSERT INTO NOTICE_TBL(ID, MEMBER_ID, TITLE, CATEGORY, CONTENT) VALUES(notice_SEQ.nextval, 1, '올해 놓치면 애매한 특가 상품 TOP 10', '이벤트', '이벤트 경로& 안내');
INSERT INTO NOTICE_TBL(ID, MEMBER_ID, TITLE, CATEGORY, CONTENT) VALUES(notice_SEQ.nextval, 1, '버전1.2.2 업데이트 알림', '공지', '버전 안내');

-- ============================================================
-- 관리자
-- ============================================================
INSERT INTO ADMIN_TBL(MEMBER_ID, JOB_POSITION) VALUES(1, '최고위직');


-- ============================================================
-- 책
-- ============================================================

INSERT INTO BOOK_TBL(
	ID, 
	COVER_IMG, TITLE, 
	AUTHOR_ID, TRANSLATOR, PRICE, 
	TOTAL_PAGES, WEIGHT, ISBN13, ISBN10, BOOK_CATEGORY_ID, 
	INTRODUCE, INTRODUCE_IMG, 
	PUBLISHER, PUBLISHER_REVIEW, 
	CONTENTS, QUANTITY, 
	CATCHPHRASE, 
	PUBLICATION_DATE
) VALUES(
	BOOK_SEQ.nextval, 
	'/source/book/기분이_태도가_되지_않으려면.png', '기분이 태도가 되지 않으려면', 
	1, null, 13500, 
	224, 306, 9791197080845, 1197080848, 80, 
	'<p><b>‘남들 챙기느라 정작 나를 사랑하는 법을<br>잊어버린 당신에게 바치는 따뜻한 감정 수업’</b></p><br>우리는 지금까지 나 자신보다 상대방의 감정을 더 배려하고 존중해왔다. 상대방에게 불편한 사람, 싫은 사람이 되고 싶지 않았기 때문. 하지만 정작 상대방의 감정을 배려하느라 내가 느끼고 있는 솔직한 감정들을 마주 볼 시간 없이 몸만 큰 ‘어른아이’가 됐다.<br>문자로 진행되는 ‘텍스트테라피’를 통해 1만 건이 넘는 상담을 했고, 글쓰기를 통해 마음을 치유하는 ‘상담&치유 글쓰기 수업’도 진행하고 있는 나겨울 작가는 남들을 챙기느라 정작 자신의 감정을 챙기지 못하고 살아가는 ‘어른아이’들에게 이렇게 말한다. ‘치유의 기본은 자신을 알아가는 것이고, 자신을 알아가기 위해선 스스로의 감정을 정확하게 파악해야 한다.’그녀는 이번 책을 통해 우리가 일상에서 익숙하게 느끼는 감정들을 정확히 파악하는 법과, 그 감정들을 바람직하게 받아들이는 구체적인 방법을 제시한다.', './source/book/기분이_태도가_되지_않으려면_소개이미지.png', 
	'떠오름(RISE)', '나겨울 작가는 1만건이상의 상담을 진행하며, 자신에게 고민을 털어놓는 사람들의 대부분의 문제는 ‘내’가 아니라 ‘남’에게 있다는 것을 알게 되었다. 이들은 겉으로는 아무렇지 않은 듯 보이고, 굉장히 건강해보이지만 실제로는 언제 무너질지 모르는, 위태한 상황에 좌절하고 있었다. 이들에게 부정적으로 느껴지는 감정의 원인은 대부분 ‘남’에게 있었고, 정작 자신의 감정을 돌보는데는 한 없이 어색하며, 내가 어떤 상황인지를 정확히 인지할 생각조차 하지 못하고 있었던 것이다.', 
	'자존감이 낮아서 고민이에요------------------ 015', 1, 
	'<br><b>감정 기복이 심한 당신에게 필요한 기분 수업</b>', 
	'2021-08-30'
);


-- 10.24 추가

INSERT INTO BOOK_TBL (ID,COVER_IMG,TITLE,AUTHOR_ID,TRANSLATOR,PRICE,TOTAL_PAGES,WEIGHT,ISBN13,ISBN10,BOOK_CATEGORY_ID,INTRODUCE,INTRODUCE_IMG,PUBLISHER,PUBLISHER_REVIEW,DELIVERY_FEE,ESTIMATED_DELIVERY_DATE,CONTENTS,VISIT,QUANTITY,CATCHPHRASE,PUBLICATION_DATE,REGISTER_DATE,UPDATE_DATE) VALUES (BOOK_SEQ.nextval,'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788959897094.jpg',
'트렌드 코리아 2023',4,NULL,19000,424,746,'9788959897094','8959897094',NULL,TO_CLOB('<b>RABBIT JUMP <br>더 높은 도약을 준비하는 검은 토끼의 해</b><br><br><br>세계화의 종말, 갈등과 분열, 그리고 전쟁. 수십 년간 이어져 온 평화와 공존의 시대는 막을 내리고 엄청난 위기감 속에서 사람들은 다가올 미래를 두려워한다. 자산시장 및 증시의 버블붕괴는 마치 2008년 글로벌 경제위기의 데자뷔를 보는 듯하다. 제2의 외환위기 경고도 
들려온다. 매우 부정적인 전망이 압도하는 2023년을 목전에 두고 있는 지금, 소비 트렌드 전망에서 가장 중요한 것은 무엇이 반복되고 무엇이 달라질 것인가를 구별하는 작업일 것이다. 즉, ‘불황기의 소비 패턴’을 과거와 비교해보는 것이고, 또 하나는 ‘소비의 전형성’이 사라지는 시대의 흐름을 분석하는 것이다. 이른바 ‘평균 실종’이 가장 첫 번째 키워드인 이유다. 변화의 속도가 더욱 빨라지는 2023 대한민국. 소비자들은 어떤 선택을 할 것인가?')
,NULL,'미래의창',TO_CLOB('‘평균 실종’과 ‘오피스 빅뱅’의 2023. 관계, 일터, 나이, 공간..... 모든 것이 재정의된다 <br>중고거래 사이트에서 5천 원짜리 모바일 상품권 거래가 빈번하게 이루어지고 외식비를 아끼기 위해 대형마트의 밀키트 판매가 늘어나는 와중에도, 한 끼에 몇십만 원을 호가하는 한우 오마카세와 고급 호텔의 망고빙수 열풍은 나날이 더 뜨거워지고 있다. 중요한 것은 이들이 각기 다른 소비자들이 아니라는 점이다. <br>사원이 대리 되고, 
대리가 과장 되고, 과장이 차장 되고, 차장이 부장 되고, 임원이라는 별을 따는 승진 체계는 이제 과거의 유물로 전락하기 일보 직전이다. 아예 승진을 거부하는 움직임까지 감지된다. 그냥 일만 하고 ‘책임’은 맡고 싶지 않다는 것이다. 어차피 오래 다닐 생각이 없기 때문이다. <br>전교 1등, 엄친아. 요즘 아이들인 알파세대가 가장 부러워하지 ‘않는’ 부류다. 운동이면 운동, 노래면 노래, 게임이면 게임, 자기만의 ‘필살기’를 가지고 있는 아이들은 스스로를 
‘셀럽’이라고 여기며 누구와 비교하는 것 자체를 거부한다. 이들의 최애 놀이터는 무인문구점과 다이소 그리고 셀프 사진관. <br>“어쩜, 너는 그대로니~~!”')||TO_CLOB('동창회에서 가장 인기 높은 말이다. 청춘을 미화하고 젊음을 동경하며 나이 드는 것에 대한 거부감이 팽배한 사회에서, ‘어른스럽지 못하다’ 혹은 ‘나잇값을 못한다’라는 말은 함부로 할 수 없게 됐다. 어른이란 무엇인가에 대한 생각이 세대별로 다르기 때문이다. <br>친구도 마찬가지다. 가까운 
이웃이 먼 친척보다 낫다는 속담처럼, 자주 소통하는 SNS 친구가 1년에 한번 만날까말까 하는 동창이나 가족들보다 더 가까운 게 현실이다. 목적지향성 관계 맺기가 일상이 된 오늘날, 나의 친구는 누구인가, 어디까지 친구라고 부를 수 있는가에 대해 사람들은 저마다 다른 답을 내민다. <br>평균이 사라진 시대, 보통 사람들의 평균적인 사고, 대다수 소비자들이 찾는 무난한 상품으로는 이제 어디에도 명함을 내밀지 못한다. 현대판 보릿고개를 넘는 사람들은 점점 
지갑을 여는 데 까다로워지고 있으며 시장은 양극화, N극화, 파편화되고 있다. 이제 어디에도 중간은 없다. <br><br>2023 10대 트렌드 키워드 <br><br>ㆍ Redistribution of the Average 평균 실종<br>평균, 기준, 통상적인 것들에 대한 개념이 무너지고 있다. 소득의 양극화는 정치, 사회 분야로 확산되고 갈등과 분열이 전 세계적인 현상이 되었다. 소비 역시 극과 극을 넘나들고 시장은 ‘승자독식’으로 굳혀지고 있다. 중간이 사라지는 시대, 평균을 뛰어넘는 
당신만의 대체불가한 전략은 무엇인가?<br><br>ㆍ Arrival of a New Office Culture: ‘Office Big Bang’ 오피스 빅뱅<br>팬데믹 이후 일터로의 복귀를 거부하는 ‘대사직’, 최소한의 일만 하는 ‘조용한 사직’ 현상이 나타나고 있다. 출퇴근과 워라밸, 재택과 하이브리드 근무가 뒤섞이는 가운데 과거의 직장문화는 이제 역사 속으로 사라진다. 송두리째 달라지는 일터에서, ')||TO_CLOB('조직과 개인은 무엇을 준비해야 하는가?<br><br>ㆍ Born Picky, Cherry-s
umers 체리슈머<br>구매는 하지 않으면서 혜택만 챙겨가는 소비자를 ‘체리피커’라고 한다면, ‘체리슈머’는 한정된 자원을 극대화하기 위해 최대한 알뜰하게 소비하는 전략적 소비자를 일컫는다. 무지출과 조각, 반반, 공동구매 전략을 구사하는 이들은 현대판 보릿고개를 지혜롭게 넘고자 하는 진일보한 합리적 소비자들이다.<br><br>ㆍ Buddies with a Purpose: ‘Index Relationships’ 인덱스 관계<br>관계의 ‘밀도’보다 ‘스펙트럼’이 더 중요해지고 있다. 로빈 
던바가 말한 인간관계의 적정한 수 150명은 이 시대에도 맞는 걸까? SNS를 통한 목적지향적 만남이 대세가 된 오늘날, 소통의 스펙트럼이 넓어지면서 관계는 여러 인덱스(색인)로 분류되고 정리된다. 이제 나의 친구는 어디까지인가?<br><br>ㆍ Irresistible! The ‘N')||TO_CLOB('ew Demand Strategy’ 뉴디맨드 전략<br>아이폰을 내놓은 스티브 잡스는 말했다. “사람들은 자신이 뭘 원하는지 모른다.” 소비자가 아예 생각지도 못한 제품을 내놓았을 때 그들은 줄
을 서고 지갑을 연다. 사지 않고는 배길 수 없는 대체불가능한 상품, 지금껏 써 왔지만 더 새롭고 매력적인 상품, 결제 방식이 유연한 상품 등, 다채로운 뉴디맨드 전략을 만나보자.<br><br>ㆍ Thorough Enjoyment: ‘Digging Momentum’ 디깅모멘텀<br>파고, 파고, 또 파고, 끝까지 파고 들어가 행복한 ‘과몰입’을 즐기는 사람들, 디깅러의 세상이 오고 있다. 자신의 열정과 돈, 시간을 아낌없이 투자하는 이들은 과거 오타쿠와 달리 현실도피적이지 않으며 덕후와 
팬슈머보다 더 진일보한 사람들이다. 우리 모두 다같이, Let’s dig in!<br><br>ㆍ Jumbly Alpha Generation 알파세대가 온다<br>2010년 이후에 태어난 진짜 신세대, 알파세대가 떠오르고 있다. 태어나서 처음 한 말이 ‘엄마’가 아닌 ‘알렉사’였다는 이들은 단순히 Z세대의 다음 세대가 아니라 완전히 새로운 종족의 시작이다. 100퍼센트 디지털 원주민이자 벌써부터 세상을 놀라게 하는 알파세대, 그들의 미래가 곧 우리의 미래다.<br><br>ㆍ Unveiling Proacti
ve Technology 선제적 대응기술<br>지금 기분에 맞는 노래 뭐가 있을까? 실내가 좀 어두운데 밝으면 좋겠어. 냉장고에 남은 우유가 있던가? 살면서 마주하게 되는 이 모든 순간에, 요구하기 전에 미리 알아서 배려해주는 기술이 나오고 있다. 이른바 ‘선제적 대응기술’이다. 삶의 각종 편의를 넘어서, 사회적 약자를 돕고 사고를 미리 예방하는 차원에서도 매우 중요한 기술이다.<br><br>ㆍ Magic of Real Spaces 공간력<br>멋지다고 소문이 난 공간은 어디에 있든 
늘 사람들로 붐빈다. 실제공간은 단지 온라인의 상대 개념이 아니라 우리 삶의 근본적인 토대이자 터전이다. 아무리 정교한 가상공간이라도 실제를 이길 수는 없다.')||TO_CLOB(' 소매의 종말이 언급되는 시기지만, 매력적인 컨셉과 테마를 갖추고 ‘비일상성’을 제공하는 공간력은 리테일 최고의 무기가 될 것이다. <br><br>ㆍ Peter Pan and the Neverland Syndrome 네버랜드 신드롬<br>요즘 어른 되기를 한껏 늦추는 사람들이 늘어나고 있다. 모두가 어린아이로 
영원히 살아가는 곳, 이른바 ‘네버랜드’의 피터팬이 되고자 하는 것이다. 젊음을 미화하고 우상시하는 분위기 속에서 진짜 어른을 만나기 힘든 오늘날, 우리는 어떻게 청춘의 열정과 어른의 지혜를 조화시킬 수 있을 것인가?'),2500,2,TO_CLOB('서문 5<br>2023년 10대 소비트렌드 키워드 22<br><br>1 2022 대한민국<br> 나노사회로의 전환 27<br> 대투자 시대 생존법 45<br> 슬기로운 엔데믹 생활 61<br> 일상 속 오아시스를 찾아서 79<br> 메타버스와 내러티브가
 만드는 새로운 현실 97<br><br> 〈트렌드 코리아〉 선정 2022년 대한민국 10대 트렌드 상품 113<br><br>2 2023 트렌드<br> Redistribution of the Avera')||TO_CLOB('ge 평균 실종 142<br> Arrival of a New Office Culture: ‘Office Big Bang’ 오피스 빅뱅 170<br> Born Picky, Cherry-sumers 체리슈머 196<br> Buddies with a Purpose: ‘Index Relationships’ 인덱스 관계 222<br> Irresistible! The ‘New Demand Strategy’ 뉴디맨드 전략 2
 48<br> Thorough Enjoyment: ‘Digging Momentum’ 디깅모멘텀 276<br> Jumbly Alpha Generation 알파세대가 온다 302<br> Unveiling Proactive Technology 선제적 대응기술 330<br> Magic of Real Spaces 공간력 352<br> Peter Pan and the Neverland Syndrome 네버랜드 신드롬 380<br><br>주 404<br>부록 418'),0,500,NULL,TIMESTAMP'2022-10-05 00:00:00.0',TIMESTAMP'2022-10-24 09:38:06.0',TIMESTAMP'2022-10-24 09:38:06.0');
INSERT INTO BOOK_TBL (ID,COVER_IMG,TITLE,AUTHOR_ID,TRANSLATOR,PRICE,TOTAL_PAGES,WEIGHT,ISBN13,ISBN10,BOOK_CATEGORY_ID,INTRODUCE,INTRODUCE_IMG,PUBLISHER,PUBLISHER_REVIEW,DELIVERY_FEE,ESTIMATED_DELIVERY_DATE,CONTENTS,VISIT,QUANTITY,CATCHPHRASE,PUBLICATION_DATE,REGISTER_DATE,UPDATE_DATE) VALUES (BOOK_SEQ.nextval,'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190533126.jpg',
'세월',5,'신유진',15500,332,454,'9791190533126','119053312X',NULL,TO_CLOB('자전적 요소와 사회학적 방법론이 결합된, 자신만의 글쓰기 스타일을 만들며 전세계 독자들에게 사랑을 받고 있는 아니 에르노의 소설 『세월』 개정판이 1984Books에서 출간되었다.<br>출간 직후 문학적 성취를 인정받아, 〈마르그리트 뒤라스상〉, 〈프랑수아즈 모리아크상〉, 〈프랑스어상〉, 〈텔레그램 독자상〉을 수상했으며 2019년 맨부커 인터내셔널상 최종후보에 오르기도 한, 
아니 에르노의 대표작으로 여겨지는 소설 『세월』은 1941년에서부터 2006년까지, 
노르망디에서 노동자 계급으로 태어나 자란 것에서 시작해 파리 교외의 세르지에서 프랑스 문학을 가르치던 교수 그리고 작가인 현재에 이르기까지, 가족 사진첩을 넘기듯 시간의 흐름과 함께 변화하는 자신의 굴곡진 전 생애를 다룬다. <br><br>그러나 이 책은 단지 자서전으로 그치지 않는다. 아니 에르노는 이 책을 자서전에서 일반적으로 택하는 일인칭 시점이 아닌, ‘나’를 배제한 ‘그녀’와 ‘우리’, 그리고 ‘사람들’로 서술하는 방식을 택했다. 이야기 속 ‘그녀’는 아니 에')||TO_CLOB('르노 자신이면서 동시에 사진 속의 인물, 1941년부터 2006년까지 
프랑스의 사회를 바라보는 여성의 시각이고, ‘우리’와 ‘사람들’은 언급된 시대 속에 형체 없이 숨어 버린 조금 더 포괄적인, 비개인적인 시선이라고 할 수 있다. “하나의 삶을 이야기하거나 자신을 설명하는 것을 추구하는, 우리가 일반적으로 생각하는 회고 작업이 되지는 않을 것”이라고 책 속에서 스스로 밝혔듯이, 아니 에르노는 자신의 이야기를 자신의 세대의 이야기 속에 위치시키면서 개인의 역사에 공동의 기억을 투영하여 글을 쓰는 것이 가능하다는 것을 보여주었고, ‘비개인적인 자서전’이라는 새로운 형식을 탄생시키며 커다란 문학적 성취를 이뤘다.'),
'https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/126/i9791190533126.jpg','1984BOOKS',TO_CLOB('마르그리트 뒤라스상, 프랑수아즈 모리아크상, 프랑스어상, 텔레그램 독자상<br>*2019 맨부커상 최종후보작*<br><br>주의 깊은 방식으로 공동의 기억을 담은, 진정으로 새로운 작품인 아니 에르노의 『세월』은<br>그야말로 놀라운 업적이다.<br>- 올리비아 랭, 『이상한 날씨』 저자<br><br>의심할 여지없이, 위대한 현대 문학 작품 중 하나!<br>- 엠마뉴엘 카레르, 『왕국』 저자<br><br>“?여자의 운명 같은 것?에 대한 글을 써야겠
다는 생각이 그녀의 머릿속에 떠올랐다. 역사 속에서 그녀의 내면과 그녀의 외부에 흐르는 시간을 느끼게 해주는 모파상의 인생 같은 어떤 것, 존재와 사물들의 상실, 부모, 남편, 집을 떠나는 자식들, 팔아 버린 가구들 속에서 끝이 날 ?완전한 소설?을.”<br><br>자전적 요소와 사회학적 방법론이 결합된, 자신만의 글쓰기 스타일을 만들며 전세계 독자들에게 사랑을 받고 있는 아니 에르노의 소설 『세월』 개정판이 1984Books에서 출간되었다.<br>출간 직후 문학적 성취를 인정받아, 〈마르그리트 뒤라스상〉, 〈프랑수아즈 모리아크상〉, 〈프랑스어상〉, 〈텔레
그램 독자상〉을 수상했으며 2019년 맨부커 인터내셔널상 최종후보에 오르기도 한, 아니 에르노의 대표작으로 여겨지는 소설 『세월』은 1941년에서부터 2006년까지, 노르망디에서 노동자 계급으로 태어나 자라온 것에서 시작해 파리 교외의 세르지에서 프랑스 문학을 가르치던 교수 그리고 작가인 현재에 이르기까지, 가족 사진첩을 넘기듯 시간의 흐름과 함께 변화하는 자신의 굴곡진 전 생애를 다룬다. <br><br>“하나의 삶을 이야기하거나 자신을 설명하는 것을 추구하는, 우리가 일반적으로 생각하는 회고 작업이 되지는 않을 것이다. 그녀는 생각과 믿음, 감각의
 변화, 사람과 주제의 변환을 포착하고 세상과 세상의 과거에 대한 기억과 상상을 되찾기 위해서만 자신의 내면을 들여다볼 것이다. 어쩌면 그녀가 경험한 것은 그녀의 손녀와 2070년의 인간들이 경험할 것들에 비하면 아무것도 아닐 수도 있지만, 그녀를 쓰게 만드는, 이미 거기에 있는, 아직 이름 없는 감각들을 뒤쫓는다.”<br><br>그러나 이 책은 단지 자서전으로 그치지 않는다. 아니 에르노는 이 책을 자서전에서 일반적으로 택하는 일인칭 시점이 아닌, ‘나’를 배제한 ‘그녀’와 ‘우리’, 그리고 ‘사람들’로 서')||TO_CLOB('술하는 방식을 택했다. 이야기 속 ‘그
 녀’는 아니 에르노 자신이면서 동시에 사진 속의 인물, 1941년부터 2006년까지 프랑스의 사회를 바라보는 여성의 시각이고, ‘우리’와 ‘사람들’은 언급된 시대 속에 형체 없이 숨어 버린 조금 더 포괄적인, 비개인적인 시선이라고 할 수 있다. “하나의 삶을 이야기하거나 자신을 설명하는 것을 추구하는, 우리가 일반적으로 생각하는 회고 작업이 되지는 않을 것”이라고 책 속에서 스스로 밝혔듯이, 아니 에르노는 자신의 이야기를 자신의 세대의 이야기 속에 위치시키면서 개인의 역사에 공동의 기억을 투영하여 글을 쓰는 것이 가능하다는 것을 보여주었고, ‘비개인
 적인 자서전’이라는 새로운 형식을 탄생시키며 커다란 문학적 성취를 이뤘다.<br><br>다시는 돌아갈 수 없는 시간의 무언가를 구하는 것.<br><br>아니 에르노는 자신의 글쓰기를 ‘하강하는 것’이라고 표현한 적이 있다. 제자리에 서서 흘러가는 것들을 쓰다듬거나 지나간 것들을 불러들이는, 즉 회상의 과정이 아닌, 시간의 결을 스스로 거스름을 말하는 것이다. 그런 면에서 이 책에 적힌 모든 언어는 하강하고 있는 것이 분명하다. 물론 거기에는 시간이란 한쪽으로 기울어져 흘러가 버리거나 사라지는 것만이 다가 아닌 어딘가에 쌓일 수 있는 것, 그것이 바로 세
 월이라는 믿음이 필요할 것이다. 다치고, 깨지고, 풍화되나 단단하게 쌓여 가는 층들, 그녀의 언어는 그것을 하나씩 더듬으며 하강한다. 어느 시절의 목소리들이 다시 들릴 때까지, 어느 순간의 감각들이 되살아날 때까지.<br><br>하강의 과정은 재연이 아니다. 그녀는 책에 기록된 모든 순간을, 모든 시대를 다시 산다. 그것은 관념적이거나 추상적인')||TO_CLOB(' 느낌이 아닌, 육체를 통해 감지하는 감각의 부활이다. 시간의 불가역성 속에서 하강하는 것, 그것이 그녀가 쌓아 올린 혹은 더듬어 내려간 세월이 아닐까. 그러니 책의 첫 문장 ‘모든 장면들은 사라질 
 것이다’라는 그녀의 예언은 틀렸다고 해야 할 것이다. 모든 장면은 여기, 그녀만의 언어로 기록되어 사라지지 않는다. 이미 방향이 정해진 시간과 시간의 등에 올라탄 우리는 어쩔 수 없을지라도, 이곳에 적힌 ‘삶’만큼은 사라지는 모든 것들 사이에서 구원받은 것이 아니겠는가.'),2500,2,TO_CLOB('세월 - 7p<br>기억을 말하는 방식 (옮긴이의 말) - 326p'),0,500,NULL,TIMESTAMP'2022-05-15 00:00:00.0',TIMESTAMP'2022-10-24 09:47:48.0',TIMESTAMP'2022-10-24 09:47:48.0');
INSERT INTO BOOK_TBL (ID,COVER_IMG,TITLE,AUTHOR_ID,TRANSLATOR,PRICE,TOTAL_PAGES,WEIGHT,ISBN13,ISBN10,BOOK_CATEGORY_ID,INTRODUCE,INTRODUCE_IMG,PUBLISHER,PUBLISHER_REVIEW,DELIVERY_FEE,ESTIMATED_DELIVERY_DATE,CONTENTS,VISIT,QUANTITY,CATCHPHRASE,PUBLICATION_DATE,REGISTER_DATE,UPDATE_DATE) VALUES (BOOK_SEQ.nextval,'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190533140.jpg',
'남자의 자리',5,'신유진',12000,116,260,'9791190533140','1190533146',NULL,TO_CLOB('자신의 개인적 체험을 보편적 차원으로 확장해나가는 독보적인 글쓰기와 꾸준한 작품 활동으로 전 세계 독자들에게 사랑받고 있는 아니 에르노의 『남자의 자리』 개정판이 1984Books에서 출간되었다.<br><br>아버지의 삶을 회고하며 그의 말과 제스처, 취향, 인생에 영향을 미쳤던 사건들, 자신과 함께 나눴던 한 존재의 모든 객관적인 표적을 사실을 바탕으로 ''필요한 단어''만을 사용해 옮겨 적은 이 작품은, ''어떤 현대 문학과도 닮지 않은 압도적인 걸작''이라는 평과 
함께 1984년 르노도상을 수상하기도 했다.<br><br>소설은 중등교사 자격시험에 합격하고 정확히 두 달 후에 있었던 아버지의 죽음으로부터 시작한다. 비명도 오열도 없이 진행되었던, ''고상한 세계''와는 전혀 다른 방식으로 덤덤하게 흘러가는 장례식과 사망 이후의 형식적이고 통상적인 절차들을 끝내고 돌아가는 기차 안에서 ''이 모든 것을 설명해야만 한다''는 생각이 작가에게 찾아온다.<br><br>''시처럼 쓴 추억도 환희에 찬 조롱도'' 없는 단조로운 방식으로, 현실이 스스로 제 모습을 투명하게 드러내도록 쓰인 이 소설은 쓰지 않으면 더는 존재하지 않는 어느
 불투명한 삶을 구하는 한편, 그 과정에서 벌어진 나와 아버지와의 거리, 계층간의 거리 역시 드러낸다. 언제나 ''두 강 사이를 건너''게 해준 ''뱃사공''이자, 자신을 멸시하는 세상에 자식이 속해 있다는 사실이 커다란 자부심, 심지어 존재의 이유였던 ''한 아버지, 한 남자의 자리''는 다시 한번 개인적 차원을 넘어서 우리 옆의 ''자리''를 돌아보게 할 것이다.'),'https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/140/i9791190533140.jpg','1984BOOKS',TO_CLOB('1984년 르노도상 수상작<br><br>"어떤 작품과도 닮지 않은 압도적인 걸
 작" - 패리스 매치<br>"감정을 억제하고 필요한 단어만으로 쓰인 강렬한 작품이자 훌륭한 문학적 성공" - 르몽드<br><br>시처럼 쓴 추억도<br>환희에 찬 조롱도 없을 것이다<br><br>프랑스 현대문학의 거장 ''아니 에르노''가 그리는 아버지의 삶과 죽음<br><br>"몇 시간 만에 아버지의 얼굴은 알아볼 수 없을 만큼 변해 있었다. 오후가 끝날 무렵 방에 혼자 남겨졌다. 차양을 통과한 햇살이 장판 위로 슬며시 들어왔다. 그것은 더 이상 내 아버지가 아니었다. 퀭한 얼굴에 코만 보였다. 흐물흐물한 파란색 양복에 감싸인 그가 마치 누워 있는 한 마리의 새처럼 보였
 다. 눈을 커다랗게 부릅뜬 남자의 얼굴은 그가 숨을 거두자마자 이미 사라지고 없었다. 이제 다시 그 얼굴조차도 보지 못하게 된 것이다." - 본문 중에서<br><br>자신의 개인적 체험을 보편적 차원으로 확장해나가는 독보적인 글쓰기와 꾸준한 작품 활동으로 전 세계 독자들에게 사랑받고 있는 아니 에르노의 『남자의 자리』가 1984Books에서 출간되었다.<br>관계 후 남겨진 흔적을 사진 찍고 그 흔적 이면의 보이지 않는 것을 글로 적은 『사진의 용도』, 개인의 역사를 공동의 역사로 확장하며 커다란 문학적 성취를 이뤄내 프랑스 유수의 문학상과 2019년 맨부커 국제
 상 최종심에도 오른 대표작 『세월』, 글쓰기에 대한 자신만의 철학을 밝힌 『진정한 장소』, 날 것 그대로의 폭력성을 감추지 않고 드러낸 강렬한 첫 소설 『빈 옷장』에 이어, 이번 소설 『남자의 자리』에서 작가는 자신의 아버지의 생애를 다룬다.<br><br>아버지의 삶을 회고하며 그의 말과 제스처, 취')||TO_CLOB('향, 인생에 영향을 미쳤던 사건들, 자신과 함께 나눴던 한 존재의 모든 객관적인 표적을 사실을 바탕으로 ''필요한 단어''만을 사용해 옮겨 적은 이 작품은, ''어떤 현대 문학과도 닮지 않은 압도적인 걸작''이라는 평과 함께 1984년 르노도상을 수상
 하기도 했다.<br><br>소설은 중등교사자격시험에 합격하고 정확히 두 달 후에 있었던 아버지의 죽음으로부터 시작한다. 비명도 오열도 없이 진행되었던, ''고상한 세계''와는 전혀 다른 방식으로 덤덤하게 흘러가는 장례식과 사망 이후의 형식적이고 통상적인 절차들을 끝내고 돌아가는 기차 안에서 ''이 모든 것을 설명해야만 한다''는 생각이 작가에게 찾아온다.<br><br>"아버지와 그의 인생에 대해 그리고 사춘기 시절 그와 나 사이에 찾아온 이 거리에 대해 말하고 쓰고 싶었다. 계층 간의 거리나 이름이 없는 특별한 거리에 대해. 마치 이별한 사랑처럼." - 본문 중
 에서<br><br>『남자의 자리』 에는 아니 에르노의 아버지의 삶이 있다. 그는 ''읽지도 쓰지도 못하는'' 농가의 일꾼이었던 할아버지의 자식으로 태어나서 공장 노동자로 살다가 같은 노동자였던 어머니를 만나 카페 겸 식료품점을 운영한다. 노동자보단 상인이기를 원했고, 쾌활한 사람이었으나 부부관계는 원만하지 못했다. 미술관 같은 곳은 가본 적이 없고, 사는 데 책이나 음악 같은 것은 필요하지 않다고 말하며 물질적 필요에 얽매인 삶이다. 이것이 그녀가 기록한 아버지의 삶이며, 한 남자의 자리이다. 그리고 그것은 자신에게 있어서 ''교양있는 부르주아의 세상
 으로 들어갈 때, 그 문턱에 두고 왔던 유산이기도 하다.<br><br>작가는 ''시처럼 쓴 추억도 환희에 찬 조롱도'' 없는 ''단조로운 글쓰기'' 방식으로 아버지의 생애를 서술한다. 소설의 시작 부분에서 밝힌 ''물질적 필요에 굴복하는 삶을 설명하기 위해서는 무엇보다 예술적인 것, 무언가 〈흥미진진한 것〉 혹은 〈감동적인 것〉을 추구해서는 안 된다''는 그녀의 글쓰기 태도는 특히 인상적이다. 인터뷰집 〈진정한 장소〉에서 아니 에르노는 아래와 같이 말한 바 있다.<br><br>"저는 아버지가 겪은 지배에 - 실제로 - 글에 의한 지배를 더하고 싶지 않았어요. 이 지배
 에 덧붙이는 방법은 두 가지가 있는데, 사회적 참상 묘사주의 - 적대감만을 보여주기, 묘사를 비관적으로 하기 - 와 포퓰리즘 - 경제적인, 문')||TO_CLOB('화적인 지배에 속하는 모든 것들을 감추고 지우는, 노동자 신분의 위대함이라는 찬사를 보여주기 - 이죠. 이 양쪽의 함정에 빠지지 않기 위해 제가 생각했던 유일한 방법은, 제가 썼던 사실을 바탕으로 하는 "단조로운" 글쓰기였어요. 그렇지만 기사 형식의 글을 말하려는 것은 아니었죠. 어떤 것도 추구하지 않는 확인된 사실의 글쓰기, 가치에 대한 판단을 철저하게 없앤, 현실에 가장 가까운, 정서를 벗겨낸 글쓰
 기. 그것은 저의 것이었던, 결국 더 이상 저 자신을 분리하지 않게 된 세계의 바람과 한계를 느끼게 만들기 위해, 필요한 단어만으로 아버지의 세계에 뛰어드는 일이었죠. 그렇게 남자의 자리에서는 더 이상 폭력성이 표현되지 않았어요. 말하자면 그것을 감정처럼 "억누른 거죠" - 〈진정한 장소〉 중에서"<br><br>그렇다면 문학적 요소를 뺀 문학의 가치는 무엇일까? "기억 속 불투명한 혹은 어두컴컴한 곳에 불을 밝히는 것, 나는 그것이 작가, 아니 에르노의 문학의 방식이라 생각한다. 그저 보여주는 것, 화자의 감정에 붙잡히지 않도록 칸막이를 없애는 것. 이 모든 것
 은 불투명한 인생을 밝히기 위함이다. 쓰지 않으면 더는 존재하지 않는 어느 불투명한 삶을 구하기 위함이다. 그러니 이보다 더 완벽한 오마주가 어디 있을까? 그녀의 글은 아버지를 향한, 그녀가 내려놓고 떠났던 세상을 향한 오마주다. 그리고 이 오마주는 예술의 편에 서 있지 않다. 삶이 먼저, 문학은 그다음이다. 삶이 문학이 되기 위해 꾸며야 할 이유도 필요도 없다." (옮긴이의 말)<br><br>소설은 쓰지 않으면 더는 존재하지 않는 어느 불투명한 삶을 구하는 한편, 그 과정에서 벌어진 나와 아버지와의 거리, 계층 간의 거리 역시 드러낸다. 언제나 ''두 강 사이를 건
 너''게 해준 ''뱃사공이자, 자신을 멸시하는 세상에 자식이 속해 있다는 사실이 커다란 자부심, 심지어 존재의 이유였던 ''한 아버지, 한 남자의 자리''는 다시 한번 개인적 차원을 넘어서 우리 옆의 ''자리''를 돌아보게 할 것이다.'),2500,2,TO_CLOB('남자의 자리 - 7p<br>기억을 말하는 방식 (옮긴이의 말) - 108p'),0,500,NULL,TIMESTAMP'2022-05-15 00:00:00.0',TIMESTAMP'2022-10-24 09:50:13.0',TIMESTAMP'2022-10-24 09:50:13.0');
INSERT INTO BOOK_TBL (ID,COVER_IMG,TITLE,AUTHOR_ID,TRANSLATOR,PRICE,TOTAL_PAGES,WEIGHT,ISBN13,ISBN10,BOOK_CATEGORY_ID,INTRODUCE,INTRODUCE_IMG,PUBLISHER,PUBLISHER_REVIEW,DELIVERY_FEE,ESTIMATED_DELIVERY_DATE,CONTENTS,VISIT,QUANTITY,CATCHPHRASE,PUBLICATION_DATE,REGISTER_DATE,UPDATE_DATE) VALUES (BOOK_SEQ.nextval,'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791169210065.jpg',
'오늘부터 IT를 시작합니다',6,NULL,18000,264,587,'9791169210065','1169210066',NULL,TO_CLOB('어렵고 딱딱하게 느껴지는 IT에도 이야기가 필요하다! <br>IT 지식이 필수인 시대, 알아두면 쓸모 있는 친절한 IT 이야기<br><br>이 책은 비전공자도 기죽지 않고 당당하게 IT를 안다고 말할 수 있도록 IT 지식을 친숙한 비유와 이야기로 풀어낸다. 컴퓨터와 인터넷, 프런트엔드와 백엔드, 서버, 데이터베이스, 코딩으로 나눠서 IT 전반을 다루며 IT 기술 개념과 배경지식을 익힌다. 비전공자나 일반인도 쉽게 이해할 수 있고, 어려운 내용을 최대한 배제하여 IT에 관심이 있
다면 중, 고등학생도 어렵지 않게 읽을 수 있다. 아메리카노 한 잔과 함께 에세이처럼 읽다 보면 어느새 IT에 눈뜬 자신을 발견하게 될 것이다.'),'https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/065/i9791169210065.jpg','한빛미디어',TO_CLOB('IT가 낯선 당신이 먼저 읽어야 할 바로 그 책!<br>우리가 기다린 스토리텔링 잇(IT) 북 <br><br>IT는 어렵습니다. 낯선 이름과 개념은 이해하기 쉽지 않습니다. 그렇지만 어렵다고 해서 재미없을 필요는 없습니다. 이 책은 에세이처럼 가볍게 읽으면서 IT 지식을 쉽고 재미있게 이해할 수 있도록 구성되어 있
습니다.<br>이 책의 마지막 장을 넘길 때쯤이면 IT가 조금은 덜 부담스럽게 느껴지실 겁니다. 어디 가서 기죽지 않고 당당하게 IT를 안다고 말하고 싶다면 이 책을 추천합니다. <br><br>★ 대상 독자 <br>● 자신의 업무를 더 잘하기 위해 IT 지식이 필요한 비개발자/일반인 <br>● 개발자와 소통이 어려운 기획자, 디자이너 <br>● IT 지식의 개념을 확실하게 이해하고 싶은 사람<br>● IT 분야에 입문하고자 하는 비전공자/청소년 <br>● IT 기초부터 다시 시작하고 싶은 개발자 <br>● IT 코딩 교육에 관심은 있으나 어려움을 느끼는 학부모'),2500,2,TO_CLOB('프롤로그<br>Part 1 컴
퓨터와 인터넷 이야기<br>0과 1 그리고 왼쪽 눈꺼풀: 친절한 대필가 이진법<br>__ 0과 1, 컴퓨터의 언어<br>__ 컴퓨터의 이상한 언어, 기계어<br>__한쪽 눈으로 대화하는 컴퓨터 <br><br>지금 막 내 트위터 계정을 설정했다: 최초의 컴퓨터 파일<br>__ 최초의 파일은 ‘종이’였다? <br>__ 정보를 담는 논리적 단위, 파일 <br>__ 역할을 구분하는 확장자 <br>__ 디지털 사회의 구성원, 파일 <br><br>불에 타지 않는 종이?: 디지털 저장 혁명 <br>__ 대형 서점을 손바닥 위에 <br>__암기는 외주로 맡겨 버리자 <br>__코끼리는 절대 잊지 않는다, 온라인 노트의 대표 주자 ‘에버노트
와 노션’ <br><br>웹, 인터넷, 네트워크? 같은 거 아닌가요?: 웹, 인터넷, 네트워크 <br>__인터넷으로 가면 되지 <br>__ 그래서 인터넷이 뭐야? <br>__ 인터넷 연결은 해저에 깔린 선 덕분일까? <br>__ 웹이 뭐야? <br>__ 네트워크가 뭐야? <br>__ 이젠 빛의 속도도 부족해 <br><br>인터넷은 어떻게 탄생한 거지?: 인터넷의 탄생 <br>__ 인터넷의 시초<br>__ 인터넷은 대화? <br>__ 좋은 대화가 뭘까? <br><br>생각과 문서를 인터넷으로 연결하다: 하이퍼텍스트 <br>__ 마우스의 탄생 <br>__ 연결의 연결 <br><br>검색으로 사용되는 전기의 양: 환경과 인터넷 <br>__ 인터넷이 사
용하는 전기량은 2% <br>__ IT와 환경보호 <br>__ 인터넷 사용량과 비례하는 환경 보호 실천 <br><br>지렁이 키우기 게임: 크롤링 <br>__ 지렁이 키우기 게임 <br>__ 웹 크롤러, 스크래핑, 파싱 <br>__ 스파이더 프로그램 <br>__ 1분 동안 생성되는 ‘정보’라는 먹잇감 <br>__ 이 순간에도 구글의 지렁이 키우기 게임은 계속된다 <br><br>정보 맛집을 찾는 방법: 페이지랭크 <br>__ 정보 맛집, 페이지 랭크 <br>__ 맛집 조작단 <br>__ 구글에게 맛집 홍보하기, SEO <br>__ 진정한 정보 맛집을 위한 노력 <br><br>Part 2 프런트엔드와 백엔드 이야기<br>무대 ‘위’를 꾸미는 그들: 프
런트엔드 <br>__ 프런트엔드란? <br>__ 화려한 온라인 무대 <br><br>무대를 공사하다: HTML <br>__ 안녕! 마크업 언어<br>__ 20개 태그로 시작된 HTML <br>__ 이젠 HTML5 <br><br>‘스타일시트’라는 예술의 탄생: CSS <br>__ 정보에서 디자인으로 <br>__ 웹의 아')||TO_CLOB('름다움을 탐하다 <br>__ CSS라는 옷을 입는 방법 <br><br>무대를 위한 기술: 자바스크립트 <br>__ 자바스크립트의 탄생 <br>__ 자바스크립트 혁명 <br>__ 브라우저를 벗어난 자바스크립트, Node.js <br>__ 더욱 확장하는 자바스크립트 <br><br>무대 ‘뒤’를 꾸미는 그들: 백엔드 <br>__ 백엔드란? <br>__ 시
나리오 작가, 데이터베이스 <br>__ 촬영 감독, 서버 <br><br>프런트엔드와 백엔드를 이어주는: JSON <br>__ 가장 많이 사용되는 프로그래밍 언어는? <br>__ 프로그래밍 언어들의 공용어, JSON <br>__ XML vs JSON <br>__ 프런트엔드와 백엔드 개발자를 연결하다 <br><br>Part 3 서버 이야기 <br>육지가 된 서버: 데이터센터 <br>__ IDC? DC 코믹스? <br>__ 한국 최초의 서버는 나무? <br>__ IDC가 필요한 이유 <br>__ IDC라는 호텔<br>__ 장애가 발생해도 시스템을 이어가는 다중화<br>__ ‘서버’라는 숲속 <br><br>하늘로 간 서버: 클라우드 <br>__구름처럼 지구를 연결하는 시스템
<br>__ 클라우드는 왜 하필 구름일까? <br>__ 하늘로 올라간 구름, 클라우드 서버<br>__ 클라우드 서비스 방식 <br><br>서버를 지켜내기 위한 이야기: 서버 관리<br>__ 서버와 바다 <br>__ 오염된 바다<br>__ 디도스 공격 <br>__ 서버의')||TO_CLOB(' 온도<br>__ 바다로 돌아간 서버 이야기<br><br> 그냥 재미로 만든 그것: 리눅스<br>__외할아버지의 유산, 코딩<br>__ 재미로 만든 1만 행짜리 소스 코드, ‘리눅스’의 탄생<br>__ 배부른 펭귄<br>__ 일반인이 리눅스를 사용할 일이 있을까?<br>__ 리눅스를 사용하는 이유 <br>__ 인류 역사상 최대의 공조 프로젝트<br><br>Part 4 데이
터베이스 이야기 <br> 디지털 쓰레기를 정리하면 OO 된다?: 데이터베이스<br>__ 재활용 센터<br>__데이터베이스 정리, 정돈<br>__ 데이터베이스의 수납<br>__ 정리, 정돈의 힘<br><br>데이터들의 일촌: 관계형 데이터베이스 <br>__ 관계형 데이터베이스 <br>__ 테이블, 키, 값 <br>__ 고유 값 <br>__ 데이터의 관계 <br>__ 공존<br><br>쿼리로 만드는 데이터 요리 방법: SQL <br>__ 데이터베이스를 요리하는 SQL <br>__ 맛있는 요리를 만드는 쿼리 <br>__ 쿼리로 만드는 데이터 요리 방법<br><br>책을 한번에 찾는 방법: 인덱스 <br>__ 목차와 인덱스 <br>__ 인덱스를 사용하지 않으면
<br>__ 인덱스가 필요하지 않을 때 <br>__인덱스가 필요 없던 시절 <br><br>데이터로 예언이 가능할까?: 오라클 데이터베이스 <br>__오라클 데이터베이스<br>__ 오라클 데이터베이스의 역사 <br>__ 정말 데이터로 미래를 예측할 수 있는 시대가 올까? <br><br> 돌고래 vs 물개, 무료 데이터베이스의 전쟁: MySQL vs MariaDB <br>__ 돌고래 vs 물개, 승자는? <br>__ 무료 데이터베이스의 ')||TO_CLOB('대표 주자 <br>__ 세상에서 가장 많이 사용하는 DBMS, MySQL <br>__ 돌고래에서 물개로, MariaDB <br>__ 치열한 전쟁에서 선택은 개발자의 몫 <br><br>데이터베이스계의 악동: NoSQL
 <br>__ 관계형 데이터베이스의 한계<br>__ No! SQL <br>__ 그렇다면 NoSQL은 무엇인가? <br>__ NoSQL 대체 뭐가 좋은데? <br>__ 틀을 벗어난 혁신<br><br>Part 5 코딩 이야기<br>Do It Yourself: 프레임워크<br>__ 가죽 지갑 만들기 <br>__ 집 수리에서 시작, DIY <br>__작은 집을 만들 수 있는 프레임워크 <br>__개발자와 프레임워크<br>__집을 짓는 프레임워크 <br><br>코드를 빌리다: 라이브러리 <br>__ 뉴욕 라이브러리에서 <br>__라이브러리<br>__ 라이브러리를 사용하는 이유<br>__라이브러리의 종류<br>__ 코딩을 빌리다<br><br>약속에 늦은 친구를 기다릴까? 먼저 갈까? : 동
 기화 vs 비동기화<br>__ 지각대장 존 <br>__ 동기화와 비동기화 <br>__ 푸드코트는 비동기화 방식 <br>__ 개발자의 선택 <br>__ 지각한 데이터 기다릴까? 먼저 갈까? <br><br>코딩으로 붕어빵을 만드는 방법: 객체 지향 프로그래밍 <br>__프로그래밍의 패러다임 <br>__ 붕어빵을 만드는 방법 <br>__붕어빵과 틀, 객체 <br>__ 비법이 담긴 밀가루 반죽과 팥앙금, 캡슐화<br>__ 잉어빵의 탄생, 상속 <br>__ 추상화 <br><br>단 한 사람을 위해 움직인다: API <br>__ API는 한 사람을 위해 <br>__ API와 라이브러리의 차이 <br>__ 세 가지 API 정책 <br>__ 당신을 위해 움직이는 API <br><br>
 컴퓨터에게 보내는 편지: 코딩 <br>__ 컴퓨터에게 보내는 편지 <br>__ 언어의 선택 <br>__ 개발자가 쓰는 편지<br><br> 코딩을 세이브하다: 깃<br>__쉬운 게임을 위한 버전 관리<br>__혼자 하는 숙제, 중앙 집중 버전 관리 방식<br>__ 함께 하는 숙제, 분산 버전 관리 방식 <br>__ 깃은 꼭 필요할까?'),0,500,'비유와 이야기로 풀어낸 비전공자를 위한 필수 IT 교양서',TIMESTAMP'2022-08-12 00:00:00.0',TIMESTAMP'2022-10-24 09:52:11.0',TIMESTAMP'2022-10-24 09:52:11.0');
INSERT INTO BOOK_TBL (ID,COVER_IMG,TITLE,AUTHOR_ID,TRANSLATOR,PRICE,TOTAL_PAGES,WEIGHT,ISBN13,ISBN10,BOOK_CATEGORY_ID,INTRODUCE,INTRODUCE_IMG,PUBLISHER,PUBLISHER_REVIEW,DELIVERY_FEE,ESTIMATED_DELIVERY_DATE,CONTENTS,VISIT,QUANTITY,CATCHPHRASE,PUBLICATION_DATE,REGISTER_DATE,UPDATE_DATE) VALUES (BOOK_SEQ.nextval,'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788925577494.jpg',
'메타노믹스',7,'권보라',18000,300,583,'9788925577494','8925577496',NULL,TO_CLOB('<b>“메타버스, 이제는 피할 수 없는 미래다!”<br>초연결 시대인 웹 3.0 디지털 세계는 누가 지배하게 될 것인가?</b><br><br><br>★★★ 《메타버스》저자 김상균 교수 감수 및 추천<br>★★★ 메타버스의 거장, 얏 시우 애니모카 그룹 회장 강력 추천 <br>★★★ 2023년 뉴테크 트렌드를 이끌 메타버스 경제 이야기<br>★★★ 개방형 메타버스 생태계에 대해 최초로 정의한 책<br><br>메타버스는 유행에 불과한 것일까? 아니면 새 시대를 이끌 트렌드인가? 여전히 많은 사람들이 메타버스 세계에 대한 의
심의 고리를 끊지 못하고 있는 가운데 《메타노믹스》 책이 출간됐다. 메타버스는 온라인과 오프라인 세상을 새로운 형태로 엮으면서 이 모든 것을 바꾸어버릴 잠재력이 있다고 강조하는 이 책은, 특별히 메타버스 세상 속에서 부를 창출할 수 있는 경제 시스템을 집중 탐구하고 있다. <br>메타버스는 지금까지 우리가 봤던 기술이나 플랫폼과는 완전히 다른 경험을 제공한다. 사용자 참여에 크게 의존한다는 점에서 소셜 미디어나 온라인 게임과 유사한 점이 있지만, 메타버스는 사람들이 애플리케이션과 디지털 커뮤니티에 차원이 다르게 몰입하고, 통제하며, 소유권을 갖게 하기 때문에 특별하다. 이
렇게 경제가 가진 힘에 의존하는 회사는 더 많은 영향력과 수익을 창출할 기회를 만들어낼 것이다. <br>그렇다면 메타버스가 비즈니스와는 어떤 연관이 있을까? 책에서는 메타버스 경제라는 새로운 시대는 이미 도래했으며 필연적이기 때문에 준비가 필요하다고 강조하고 있다. 그리하여 우리가 메타버스 경제에 대한 결정을 내리는 데 도움을 줄 뿐 아니라 새로운 세대의 소비자와 새롭게 연결되고 수익원을 만드는 데 도움이 되는 정보과 의견을 제시하고 있다. 메타버스와 그 기원 그리고 메타버스 경제가 어떻게 작동하는지 이해하는 데 이 책 하나로 충분할 것이다.'),
'https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/494/i9788925577494.jpg','알에이치코리아',TO_CLOB('“부의 변곡점이 메타버스의 세계로 이동하고 있다”<br>2023년 새로운 경제 시스템, 메타노믹스가 돌파구다! <br><br>“암호화폐, NFT의 특성과 현황을 다룬 서적은 국내외에 적잖게 나와 있으나, 경제 시스템을 이야기하는 책은 드물다. 이런 상황에서 필자는 이 책의 탄생이 몹시 흥미로웠다.” <br>_김상균 교수 감수의 글 중에서 <br><br>새로운 패러다임의 출발점은 바로 메타버스다. 인터넷 및 소셜 미디어와 마찬가지로 일찍 뛰어드는 사람과 기업이 획기적인 기회
를 발견하고 경험할 것이다. 메타버스는 웹 1.0, 웹 2.0 및 성장하는 디지털 우선 소비주의의 정점이라고 할 수 있다. 아직 초기 단계지만, 얼리 어답터는 우위를 선점한다는 사실을 기업은 과거 경험으로부터 알고 있어야 한다. 어떤 회사는 뒤늦게 뛰어들다 고생만 하게 될지도 모른다. 2006년 구글은 유튜브를 16억 5천만 달러에 인수하여 소셜 미디어 공유를 시작했다. 마이크로소프트(Microsoft)는 2014년 마인크래프트 지식재산권에 25억 달러를 투자하면서 커뮤니티 기반 게임의 힘과 젊은 디지털 네이티브 소비자를 활용할 가능성을 모색했다. 페이스북은 2012년 인스타그램을 10억 달러에 인수
하여 소셜 미디어의 동영상 전환을 따라잡았다. 페이스북은 기술이 발전하는 궤도 위에서 스스로 어떤 위치에 있어야 하는지 깨닫고, 2021년 10월, 메타버스를 주요 기술로 내세우며 사명을 ‘메타(Meta)’로 변경했다. 메타버스가 주류가 되기 전 인스타그램을 제외하고도 29억 명의 활성 사용자가 있는 회사였다. 이것이 메타버스가 향하는 지표가 아니라면 무엇이겠는가.<br>메타버스를 선도하는 사람들은 새로운 영역에')||TO_CLOB('서 청중과 소통하고 경쟁에서 앞서 나갈 수 있는 좋은 위치에 있다. 이 모든 것은 메타버스 경제 덕분이다. 따라서 메타버스 경제의 원리를 이해하는 것은 가장 중요한 부
분이기에 책에서는 기업이 메타버스로 뛰어들어서 새로운 디지털 제품을 만들고 다양한 경험을 설계하도록 프레임워크, 전문가 인터뷰, 저자의 통찰을 통해 실질적인 도움을 주고 있다.<br><br>“디지털 경제를 주도할 솔루션이 이 책 안에 있다”<br>혁신의 아이콘이 될 개방형 메타버스에 집중하자!<br><br>메타버스는 1990년대 후반 월드 와이드 웹의 부상이나, 스마트폰이라는 개인용 컴퓨팅 기기의 등장만큼이나 중요한 기회다. 만약 이러한 혁명을 놓치고 살아왔다면, 이 책이 이제 혁명의 한가운데 참여할 수 있는 기회가 되어줄 것이라 확신한다. <br>_메타버스의 거장 얏 시우 추천의 글 중<br><br>
이 책은 메타버스의 기초부터 심층적인 내용까지 다루고 트렌드 분석, 경제학, 제품 개발 및 사업 개발에 적용되는 개념까지 담고 있다. 처음에는 메타버스가 무엇인지 고차원적인 주제를 다루고 점점 메타버스 전략과 NFT 프로젝트를 구축하기 위한 구체적인 지식과 행동으로 나아간다. 각 챕터에는 저자들이 큰 주제를 서로 다른 관점으로 요약해놓은 인사이트 부분도 있다. 그들의 공통점 중 하나는 블록체인, 분산 프로그램, 사용자 중심 거래 및 프로그램 거버넌스, NFT 및 웹 3.0은 메타버스가 가져올 미래라고 확신한다는 점이다. 이러한 저자들의 인사이트는 이 책의 방향뿐만 아니라 메타버스 세계
의 나침반 역할을 해주기에 충분할 것이다.'),2500,2,TO_CLOB('감수의 글 <br>추천의 글 <br>서문 <br><br>1부 메타버스와 메타버스 경제 이해하기<br>1장 메타버스 입문 <br>용어 <br>메타버스란 무엇인가? <br>역사적 맥락에서의 메타버스 <br>손바닥 안의 세상 <br>메타버스 미래의 핵심은 상호 운용성이다 <br><br>2장 메타버스 경제란 무엇인가? <br>메타버스에서 화폐는 어떻게 작동하는가? <br>메타버스로의 진입과 전진 <br>토큰 경제 <br>커뮤니티 거래의 부상 <br>플레이어에게 힘을 실어주는 분산 거버넌스 <br>네 가지 주요 NFT 유통 채널 <br>NFT 기반 메타버스 수익 모델 <br>저자의 인
사이트 <br><br>2부 메타버스 경제 전략 세우기<br>3장 메타버스의 비즈니스 사례 구축 <br>사업적 도전 <br>메타버스는 잠깐의 유행에 불과한가? <br>NFT 시장 통계 <br>브랜드를 위한 메타버스 경제의 핵심 가치 제안 <br>시간이 전부다 <br>메타버스 도입의 골짜기를 건너다 <br>웹 3.0 기술이 기업에 미치는 영향 <br>저자의 인사이트 <br><br>4장 메타버스 소비자를 만나다 <br>사람들 <br>사용자 참여의 세 가지 특징 <br>메타버스에 임하는 마음가짐 <br>메타버스와 디지털 정체성에서 아바타의 중요성 <br>저자의 인사이트 <br><br>5장 메타버스의 새로운 사업 기')||TO_CLOB('회 <br>메타버
스 사업의 콘셉트 <br>메타버스 측정 <br>저자의 인사이트 <br><br>6장 NFT 상용화의 핵심 요소 <br>마켓플레이스 <br>팬 토큰 제공 <br>가상 수집 게임 <br>메타버스 디앱 <br>또 다른 탐험 영역 <br>저자의 인사이트 <br><br>3부 메타버스 제품 개발, 실행 프레임워크 및 향후 전망<br>7장 NFT 파고들기 <br>NFT란 무엇인가? <br>NFT의 유형 <br>NFT는 메타버스 경제에 어떻게 적합해지는가? <br>NFT 설계 및 목적에 대한 주요 고려 사항 <br>저자의 인사이트 <br><br>8장 실행 계획 세우기 <br>발견 <br>학습 <br>사례 구축 <br>커뮤니티에 연결 <br>메타버스에 지식재산권 가져오기 <br>내일을 위
한 준비 <br>저자의 인사이트 <br><br>9장 내일의 메타버스를 바라보는 관점 <br>커뮤니티 동반 성장 <br>기술 삼각편대 <br>경험이 왕이다 <br>메타버스 경제 활용 <br>저자의 마지막 인사이트 <br><br>업랜드 소개 <br>감사의 글 <br>참고 자료'),0,500,'메타버스 시대 경제 패러다임을 이끌 전략서',TIMESTAMP'2022-10-10 00:00:00.0',TIMESTAMP'2022-10-24 09:57:36.0',TIMESTAMP'2022-10-24 09:57:36.0');
INSERT INTO BOOK_TBL (ID,COVER_IMG,TITLE,AUTHOR_ID,TRANSLATOR,PRICE,TOTAL_PAGES,WEIGHT,ISBN13,ISBN10,BOOK_CATEGORY_ID,INTRODUCE,INTRODUCE_IMG,PUBLISHER,PUBLISHER_REVIEW,DELIVERY_FEE,ESTIMATED_DELIVERY_DATE,CONTENTS,VISIT,QUANTITY,CATCHPHRASE,PUBLICATION_DATE,REGISTER_DATE,UPDATE_DATE) VALUES (BOOK_SEQ.nextval,'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788960519466.jpg',
'라이프 트렌드 2023',8,NULL,18000,360,656,'9788960519466','8960519464',NULL,TO_CLOB('<b>소비하지 않는 것이 취향인 시대, <br>소비 욕망의 진화와 새로운 과시 패러다임을 주목하라!,</b><br><br><br>2003년 방영된 〈만 원의 행복〉은 단돈 만 원으로 하루를 사는 연예인들의 짠 내 나는 모습을 관찰하는 예능 프로그램이다. 프로그램 자체도 인기가 높았지만 이 프로그램을 따라 시청자들도 일상에서 절약을 실천하는 데 큰 영향을 미쳤다. 약 20년이 지난 2022년 현재, 하루에 만 원은커녕 단 1원도 쓰지 않는 ‘무지출 챌린지’가 2030세대를 중심으로 유행하고 있다. 외식은 절대 하지 않
고 직접 싼 도시락과 냉장고 속 식재료만으로 삼시 세끼를 해결하고, 걷거나 자전거로 출퇴근한다. 커피나 음료도 집에서 챙겨 다닌다. 이런 무지출 일상은 하루 이틀이나 한두 주까지 이어진다. 이렇게 노력한 무지출 기간과 내역(가계부)을 SNS에 인증하며 ‘0원의 행복’을 실천한다. (37쪽)<br><br>욜로, 플렉스, 오픈 런, 호캉스 등 지금까지 대중의 욕망은 ‘과시적 소비’를 향했다. 그런데 2022년부터 무지출 챌린지, 투자 감소와 저축 증가, 중고 시장 확대, 소식 먹방 출현 등 변화를 보이기 시작했고 이제 ‘과시적 비소비’가 2023년을 주도할 트렌드로 부각되고 있다. 대한민국의 소비 욕망과 라이
프스타일은 왜, 어떻게 바뀌고 있을까? 딱딱한 지표와 복잡한 통계를 나열하는 대신 일상 속 사례와 스토리텔링을 활용하여 내년의 트렌드를 소개하는 《라이프 트렌드》 시리즈는 2013년부터 시작된 이래 2022년까지 꾸준하게 소비 주체와 성향의 변화, 라이프스타일 플랫폼의 성장, 산업 구조와 조직 문화의 변화, 취향 소비와 경험 공유, 전방위적 디지털 트랜스포메이션, 기후 변화와 경제 위기 등의 이슈를 주목해 왔다. 이 주제들은 해를 거듭할수록 빠르고 폭넓게 진화해 메가 트렌드가 되었다.<br><br>과시적 소비의 전성기에 아이러니하게도 비소비를 선택한 사람들이 만들어 갈 2023년의 대한민국을 한
발 앞서 만나 보자. 한국인의 라이프스타일과 문화, 비즈니스와 마케팅에 영향을 미칠 트렌드에 대한 남다른 인사이트를 얻을 수 있을 것이다.'),'https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/466/i9788960519466.jpg','부키',TO_CLOB('2023년 라이프 트렌드를 주도할 10가지 키워드<br><br>2019년의 라이프 트렌드는 기존의 관성과 선입견이라는 경계를 허무는 사람들을, 2020년에는 전통적 가치관과 경계를 확장하는 사람들을 주목했다. 또 2021년에는 코로나19 팬데믹으로 인한 사회적 거리 두기와 대봉쇄 등 물리적 경계 안에서 뉴 노멀을 구축하는 사람들을, 2022년에는 또 다
른 일상과 더 나은 일상을 지향하는 사람들을 주목했다. 이제 2023년에는 어떤 키워드와 사람들을 주목해야 할까? <br><br>ㆍ 비소비 & 무지출: 소비하지 않는 것을 선택하고 과시하는 사람들<br>2022년 7월 말 기준, 구글 트렌드와 네이버 트렌드 검색 결과 ‘무지출’ 키워드에 대한 관심도가 ‘욜로’를 넘어섰다. 그동안 욜로 트렌드는 너무 흔해졌고 너무 많이 소비되었다. 게다가 인플레이션과 경기 침체, 자산 가치 하락으로 인해 욜로를 실천할 돈도 없다.(34쪽) 그래서 욜로를 대신해 우리의 취향과 선택을 과시할 수단으로 비소비와 무지출이 대두되었다. 전 세계적으로 ‘아무것도 사지 않는 날(Buy Nothing Day)’이 지
정되는가 하면(우리나라의 경우 녹색연합에 의해 매년 11월 마지막 주 금요일이다), 미니멀리즘 트렌드가 다시 각광을 받기 시작한 것이다.(42쪽)<br>무지출, 비소비 트렌드는 다양한 분야로 확장되고 있다. 매년 1월 한 달간 채식을 하는 비건 리셋 챌린지, 월요일마다 고기를 먹지 않는 ‘고기 없는 월요일’ 캠페인은 육류에 대한 일종의 비소비다.(45쪽) 소식 먹방의 유행은 무분별한 음식 낭비를 줄이고 절제해야 한다는 인식을 반영한다.(49쪽) 리셀과 명품 컬래버레이션의 열풍이 잦아들고 중고 시장, 리퍼브 시장이 크게 성장하는 것도 불필요한 지출을 끊으려는 소비자들의 태도를 보여 주고 있다.<br><br>ㆍ 빈티지: 개
성, 히스토리, 지속 가능성에 더 큰 가치를 두는 소비자<br>2016년, 한 사람이 온라인 경매로 1968년에 제작된 오메가 시계를 5600달러(약 670만 원)에 낙찰받았다. 그런데 자료를 찾아보니 그 시계는 세계적인 베스트셀러 작가 랠프 엘리슨의 것이었다. 결국 이 시계는 2021년 12월, 한 경매에서 66만 7800달러(약 8억 원)에 다시 팔렸다.(131쪽) 이 ‘중고’ 시계의 가치(가격)가 높아진 것은 바로 유명 작가의 소유물이었다는 특별함 때문이다. <br>새 제품을 사지 않으면서도 희소성으로 차별화를 과시할 수 있는 빈티지 제품 시장이 급성장하고 있다. 시계, 자동차, 가구, 음반 등 다양한 품목들이 취급되고 있으며 전 세계
적으로 빈티지 거래 플랫폼들이 속속 등장하고 있다. 우리나라의 경우 국내 점유율 1위 암호 화폐 거래소인 업비트를 소유한 기업 두나무가 런칭한 중고 명품 시계 거래 플랫폼 ‘바이버’가 대표적이며 이 외에도 무신사, 현대백화')||TO_CLOB('점, 중고 거래 플랫폼 ‘번개장터’ 등 다양한 기업이 빈티지 시장에 뛰어들고 있다.(126쪽)<br><br>ㆍ 테린이: 직접 테니스를 배우고 즐기고 소비하는 사람들<br>개성, 취향, 특별함, 차별화에 대한 욕망은 스포츠에서도 계속된다. 2030세대 여성을 중심으로 대세는 골프에서 테니스로 이동하고 있다. 골프를 치는 것이 흔해진 시대에 오히려 테니스를 치는 것이 훨씬 희소하다. 개성을 드
러내고 차별화를 보여 주는 데 테니스가 효과적이다.<br>BC카드가 2022년 헬스케어 결제 데이터를 분석한 결과 테니스 매출은 2019년과 비교했을 때 440%나 증가했지만 골프는 57%에 그쳤는데, 테니스의 성장세를 주도한 것은 2030세대 여성 소비자였다. 골프장은 도심이 아닌 외곽에 있고, 라운딩을 하려면 4명이 필요하며, 비용도 비싸고, 새로 골프장을 건설하거나 잔디를 관리할 때 종종 환경 문제가 대두된다. 테니스는 골프에 비해 비용, 시간, 접근성, 편의성 모두 유리하다. 즉, 테니스는 골프에 비해 덜 지출하면서도 충분히 과시할 수 있는 ‘가성비 좋은’ 스포츠인 것이다.(148쪽) 그러므로 테니스의 위상과 시장
은 더욱 높아질 것으로 기대된다.<br><br>ㆍ 워케이션: 워케이션')||TO_CLOB(' 시행에 적극적인 경영인과 지방 자치 단체<br>푸른 바다나 산속 수풀이 내다보이는 호텔에서 일하는 사람의 자유분방한 모습은 어느 특별한 디지털 노마드만의 전유물이 아니다. 국내외 대기업을 중심으로, 여행지나 휴가지에서 휴식을 하면서 동시에 원격 근무를 하는 워케이션 제도가 점점 확산되고 있기 때문이다. 코로나19 팬데믹으로 인한 재택근무, 원격 근무를 경험한 직장인과 기업들은 워케이션 제도에 대해서도 긍정적이다. 휴양지에서 일하는 자기 모습을 SNS에 공유하는 직장인들, 대외적으로 사내 복지를 홍보하는 기업들에게 워케이션은 과시
의 수단이다.(164쪽)<br>워케이션 제도의 또 다른 수혜자는 지방 자치 단체다. 호텔, 리조트 등의 관광업계도 수혜를 받겠지만 궁극적으로 지자체가 지역 경제 활성화, 새로운 인구 유입 등의 측면에서 이득을 얻는다.(171쪽) 실제로 강원도, 제주, 경상남도, 전라남도, 미국 오클라호마주의 털사를 비롯한 70여 개 도시, 일본의 자그마한 섬들 등 전 세계 지자체들이 적극적으로 워케이션 인구를 유치하고 있다. 워케이션 관련 시장이 커질 수밖에 없는 이유다.<br><br>ㆍ 주 4일 근무제: 조직 내 생산성과 효율성을 강화하려는 조직 관리 담당자<br>워케이션 제도의 궁극적인 목적은 휴식이 아닌 업무의 효율성에 있다. 효율과 성과
가 나온다면 어디서 일해도 상관없는 것이다. 마찬가지로 효율과 성과가 나온다면 주 5일이 아닌 4일만 일해도 상관없을 것이다. 실제로 벨기에, 프랑스, 영국, 독일, 스페인, 미국, 칠레, 일본, 아랍에미리트 등 세계 많은 나라가 이미 주 4일 근무제를 도입했거나 실험 중이다.')||TO_CLOB('(185쪽)<br>하지만 우리나라에는 주 4일제 논의가 시기상조라고 생각하는 사람이 많다. 주 4일제를 시행하면 경제가 망가지고 나라가 망한다고 주장하는 사람도 있다. 한국의 연간 평균 노동 시간은 OECD 국가 중 최상위다. 2020년 기준 OECD 국가 평균 노동 시간은 1687시간인데 우리나라는 1908시간이다. 하지만 시간당 노동 생산성은 OE
CD 38개국 중 27위다. 우리나가의 GDP 순위가 8위인 것을 감안하면 매우 낮다. 노동 생산성을 높이지 않고서는 결코 GDP를 높일 수 없다. 과도한 노동 시간으로 떠받치는 것은 한계가 있다.(192쪽) 그러므로 주 4일 근무제는 하루 더 쉬자는 복지 차원이 아니라 경영과 경제적 관점, 효율성과 생산성의 문제로 바라보고 논의되어야 한다.<br><br>ㆍ 세컨드 하우스: 5도 2촌, 4도 3촌에서 비즈니스 기회를 찾는 사람들<br>디지털 노마드, 워케이션, 주 4일 근무제가 확산되면 더불어 세컨드 하우스에 대한 수요도 증가한다. 평일에는 도시에서 생활하다가 주말이 되면 자신의 세컨드 하우스를 찾아 휴식하고 여가를 즐기는 것이다. 그
러므로 세컨드 하우스는 일상 공간의 확장이자 새로운 라이프스타일 트렌드가 된다. <br>또 워케이션 제도와 마찬가지로 세컨드 하우스 트렌드도 지방 자치 단체와 사업가들에게 큰 기회다. 국내의 경우 전라도, 경상도, 충청도, 강원도 전역에 방치된 빈집이 많다. 전라도만 해도 약 2만 채에 이른다. 영국, 캐나다 밴쿠버, 일본 도쿄도 빈집 문제를 겪고 있는데 이를 해결하기 위해 빈집세를 도입했다.(216쪽) 세컨드 하우스 유치는 빈집세의 대안이 된다. 대도시를 탈출하려는 사람들, 대도시의 기업에서 일하지만 원격 근무가 가능한 사람들, 5도 2촌과 4도 3촌을 하며 도시와 농어촌의 삶을 병행하려는 사람들을 유치하면 지방 소
멸 방지, 지역 경제 활성화, 빈집 재활용 등이 가능하기 때문이다.(220쪽)<br><br>ㆍ 잘코사니 & 샤덴프로이데: 불행과 불안에 대응하는 마케팅을 수립하는 마케터<br>2021년 11월 한국경제연구원의 발표에 따르면, 청년들이 느끼는 체감 경제 고통 지수는 역대 최악이었다. 2022년 7월에 발표한 2022년 1분기 국민 고통 지수 또한 역대 최고치였다. 팬데믹, 인플레이션, 경기 침체, 자산 가치 하락 등으로 이러한 수치는 2023년에도 이어질 것이다.(229쪽) 그 결과 안타깝지만 남의 불행을 목')||TO_CLOB('격할 일이 많아지고, 남의 불행에서 위안을 얻는 이도 많아질 것이다. <br>독일어 ‘샤덴프로이데(Schadenfreude)’는 남의 불
행이 곧 나의 행복이 된다는 아주 못된 단어다. 그런데 우리말에도 이와 비슷한 말이 있다. ‘잘코사니’는 미운 사람의 불행을 고소하게 여길 때 내는 감탄사다.(223쪽) 샤덴프로이데와 잘코사니를 느끼는 건 내가 사악하거나 못나서가 아니다. 치열한 경쟁과 승자 독식 사회를 살아가는 우리에게 그만큼 여유가 없고 불안해서가 아닐까? 이런 불안감과 위기의식은 정부와 지자체에게는 해결 과제가 될 것이고, 기업에게는 활용해야 할 소비 욕구가 될 것이다. 그러므로 위기가 증폭될수록 불안과 위안을 대상으로 한 산업은 커질 수밖에 없다.<br><br>ㆍ 클린 테크: 지속 가능 경영이 만들 기회에 투자하는 스타트업과 투자자<br>2010년 설
립된 스타트업 프론티어 펀드는 2021년에 944억 달러의 기업 가치를 평가받으며 역사상 가장 비싼 유니콘이 되었다. 그런데 프런티어 펀드는 탄소 제거 기술을 개발하는 스타트업, 즉 클린 테크(Clean tech) 기업을 지원하는 펀드다.(253쪽) 그만큼 기후 위기 대응이 시급하고, 이를 위해 ')||TO_CLOB('탄소 제거 기술 개발이 필수적이며, 클린 테크는 강력한 비즈니스 기회인 것이다.<br>클린 테크는 에너지 및 자원의 소비와 오염 물질 발생을 줄이고, 탄소 감축과 제거 등을 하는 환경 기술이다. 생산과 소비를 중단하는 것, 육식을 끊고 비건을 실천하는 것, 중고와 빈티지 제품을 애용하여 자원 낭비를 막고 자원 순환(재활용)을 촉
진하는 것은 개인 차원에서 기후 위기에 대응하려는 노력의 일환이다. 클린 테크는 지구적 스케일에서 기후 위기에 대응하려는 노력이다. 게다가 전 세계의 산업과 비즈니스가 지속 가능 경영으로 재편되는 상황에서 클린 테크는 전방위적으로 확장되고 있다.(247쪽) 태양광과 풍력 같은 재생 에너지, 저전력, 탄소 포집, 폐기물 처리, 배터리와 전기차 분야뿐 아니라 로봇 산업, 농업, 축산업, 식품 산업, 건축업, 유통업 등 일상의 거의 모든 영역에 적용되고 있는 것이다. 그러므로 IT가 모든 산업을 주도하며 세계의 돈을 빨아들였던 것처럼, 클린 테크도 강력한 주도자가 될 것으로 예상된다.(271쪽)<br><br>ㆍ 절제 & 축소: 관계도 소
비도 절제하면서 본질에 집중하는 자발적 아싸<br>기성세대는 어안이 벙벙하겠지만 지인의 결혼식이나 돌잔치에 축의금을 내지 않겠다는 미혼 2030이 늘고 있다. 현금 부조가 부담이 되고 무엇보다 혼인율과 출산율이 떨어지는 상황에서 ‘주고 못 받는’ 경우가 생길 수 있기 때문이다. 상호 부조라는 낡은 유산과 단절하겠다는 명분이 있지만 그 이면에는 인간관계에 대한 비소비 태도가 있다.(306쪽)<br>코로나19 팬데믹을 거치면서 느슨한 연대와 극단적 개인주의는 더 심화되었다. 불필요한 관계를 끊어 내고 자신과 본질에 더 집중하면서 자발적으로 고립되고 아싸가 되는 것이다. 과거에는 여러 사람과 관계를 맺고 무리의 중심에 선 인
싸가 과시의 대상이었는데 이제는 SNS를 중심으로 자신의 아싸 기질을 과시하듯 드러낸다.(305쪽) 축소와 절제 지향은 인간관계를 넘어 가정, 직장, 소비 등 일상의 모든 영역으로 확대된다. 카페, 술집, 직장의 회의실에서 커피, 한 잔의 술, 회의라는 본질에 집중하도록 스탠딩 문화가 강조되고 있다.(317쪽) 또 무알코올 맥주와 제로 콜라 시장이 크게 성장하는 등 관성적인 소비문화와의 단절이 이루어지고 있다.(324쪽)<br><br>ㆍ 스케일 & 디테일: 더 커지고 더 다채로워지는 취향 비즈니스를 주목하는 사람들<br>취향 소비는 한국인의 중요한 트렌드로서 오래도록 이어져 왔다. 이제 취향의 상향 평준화 속에서 차별화되고 과시할 수 있
는 건 디테일의 차이다.(331쪽) 자신만의 취향 디테일을 보여 줄 수 있는 대표적인 방법이 바로 미술품 소유다. 2022년 9월에 열린 아트 페어 프리즈(FRIEZE)와 한국국제아트페어(키아프)에는 약 7만 명이 다녀갔고 수천억 원대 미술품이 거래되었는데, 방문객 중 절반을')||TO_CLOB(' 2030세대가 차지했다. 취향 소비에 민감한 이들이 명품 가방 대신 미술품을 구매하고 이를 과시하는 것이다.(336쪽) <br>취향의 디테일은 우리의 여가와 의식주 등 광범위한 영역에도 큰 영향을 미친다. 이제 여행은 단순히 휴식을 넘어, 남들은 모르는 곳이나 희소하고 특별한 경험을 과시하는 수단이 되었다. 그래서 잘 알려지지 않은 소도시가 많은 전라
남도와 경상북도가 새로운 휴가지로 떠오르고 있다.(347쪽) 혼밥과 혼술 문화가 보편화되면서 이에 최적화된 식당, 카페, 술집이 늘어나고,(351쪽) ‘꾸안꾸(꾸민 듯 안 꾸민)’ 대신 ‘꾸꾸(꾸미고 꾸민)’ 패션이 유행하면서 과시 욕구를 부추긴다.(354쪽) 결국 같은 취향이더라도 디테일에서 강한 쪽이 선택받고 살아남을 것이며 더 강력하게 소비될 것이다.<br><br>10가지 키워드에 담긴 공통 트렌드 <br>비소비는 과시의 새로운 수단이자 취향이 된다<br><br>1899년, 미국의 경제학자 소스타인 베블런은 “부자들은 편리성이 아니라 과시적인 가치가 있는 옷을 선택한다”고 말했다. 소비자는 남들보다 돋보이거나 자신의 능력을 과시하기 위
해 명품이나 고가의 수입차 등 사치품을 소비한다는 것이다. 이를 ‘베블런 효과’라 하는데, 초고가 전략과 마케팅이 이를 활용한 것이다. 프랑스의 사회학자 장 보드리야르가 정의한 ‘파노플리 효과’도 이와 유사하다. 특정 상품을 소비함으로써 자신이 그 특정 계층에 속한다는 사실을 과시하는 것인데, VIP 전략이나 멤버십 마케팅이 이를 활용한 것이다. <br>반대로 미국의 경제학자 하비 라이벤스타인이 발표한 ‘스놉 효과’는 다른 사람들이 많이 소비하는 상품을, 자신은 오히려 줄이거나 소비하지 않는 것이다. 나는 다른 사람과 다르다는 차별성을 과시하고 싶은 욕망이 소비 중단으로 이어지는 것이다.(30쪽)<br>그동안 우리는 소비 욕
망을 베블런 효과, 파노플리 효과, 스놉 효과 등으로 설명해 왔다. 기업의 마케팅도, 소비 트렌드의 방향성도 이 이론들이 바탕이 되었다. 그리고 이 이론들이 가장 강조하는 부분은 바로 ‘과시’다. 그런데 예전보다 더 영리해지고 자기중심적이며 자기 주도적인 소비자들은 더 이상 베블런 효과, 스놉 효과, 파노플리 효과의 힘에 속수무책 휘둘리지 않는다. 지금까지는 소비가 과시의 가장 좋은 도구였지만 이제 비소비가 새로운 도구로 부상한 것이다.(33쪽)<br>비소비 트렌드가 대두된 것은 코로나19 팬데믹, 인플레이션, 기후 위기, 러시아-우크라이나 전쟁과 불안정한 국제 관계 등의 영향 때문이다. 우리는 팬데믹을 겪으
며 대')||TO_CLOB('인 관계를 절제해야 했고, 인플레이션과 러시아-우크라이나 전쟁, 불안정한 국제 관계로 인한 경기 침체, 고용 불안, 자산 가치 하락 속에서 소비 다이어트가 필요해졌다. 또 기후 위기에 대응하기 위해 생산과 소비를 줄이려고 노력한다.(6쪽)<br>하지만 과시적 비소비는 결국 소비자의 선택이다. 단순히 소비를 ‘못 하는 것’이 아니라 ‘안 하는 것’이니까. 그저 돈이 많으면 얼마든지 가능했던 과시적 소비와 달리, 과시적 비소비는 얼마나 더 희소하고 유니크한 경험인지가 중요하다. 플라스틱 프리와 친환경 소비, 모피 반대와 동물 윤리, 젠더 뉴트럴과 공정, 돈쭐 내기 같은 미닝 아웃도 과시의 수단이다.(117쪽) 그
런 의미에서 과시적 비소비는 취향의 확장이자 진화인 셈이다.<br>과시적 소비와 과시적 비소비는 서로 반대말이 아니다. 과시의 욕망이라는 공통분모를 가졌기 때문이다. 기업 입장에서는 반대말로 보이지만 소비자 입장에서는 비슷한 말이다. 그러므로 기업과 소비자는 과시적 비소비를 전혀 다른 관점으로 볼 수밖에 없고, 대응도 달라야 한다.(120쪽) 여기서 비롯되는 라이프스타일의 변화는 누군가에게는 기회가 되고, 누군가에게는 위기가 된다.'),2500,2,TO_CLOB('프롤로그 : 당신의 욕망은 얼마나 바뀌고 있는가?<br>Guide to Reading : 2023년을 위한 20가지 질문, 그리고 16부류의 사람들<br><br>1. 과시적 비소비<br>과시
적 소비만 우리의 본성일까?／무지출이 욜로를 앞서다／무지출 챌린지와 만 원의 행복／소비하지 않는 삶과 ‘Buy Nothing Day’／비거뉴어리 챌린지와 고기 없는 월요일／소식 먹방은 트렌드가 될 수 있을까?／주식 투자보다 절약? 관심도의 역전?／B 소비와 리퍼브, 이것도 과시할 만한가?／재고 떨이! 사장님은 안 미쳤다, 이번 블랙 프라이데이를 놓치지 마라／소비의 극단적 양극화: 아주 싼 것과 아주 비싼 것만 팔린다?／경제 위기에 대한 당신의 관심도와 위기감은 고조되는가?／2023년은 스태그플레이션의 해일까?／리셀도 컬래버레이션도 명품도 지겨워／왜 팬데믹 기간 중 명품 시장은 뜨거웠을까?／플렉스는 계속된다. 하지만!／오
픈 런을 둘러싼 상반된 2가지 욕망／당신은 무엇을 자랑하고, 과시하고 싶은가?／중고 패션 시장은 패션 산업의 새로운 미래다／당근마켓이 이마트와 기업 가치가 같다고?／왜 비소비가 부각되는 걸까? 어떤 욕망에 대응해야 할까?<br><br>2. 빈티지 시계와 빈티지 카, 욕망은 히스토리를 탐한다<br>왜 가상 화폐 거래소는 빈티지 시계 시장을 주목했을까?／신상품보다 훨씬 비싼 중고: 빈티지 시계는 과시적이다／빈티지 카, 욕망의 끝판왕인가 자원 순환인가?<br><br>3. 테니스 붐, 왜 테니스는 새로운 욕망이 되었을까?<br>왜 2030 여성들이 테니스를 배울까?／골프는 가고 테니스가 왔다?／테니스는 패션과 시계, 스타일의 새로운 중심
이 된다<br><br>4. 워케이션과 디지털 노마드 비자<br>워케이션은 보편적 제도로 자리 잡을까?／왜 기업들은 워케이션에 지원하는가?／워케이션, 대기업은 가능하지만 중소기업은 쉽지 않다／워케이션은 지방 자치 단체에게 중요한 기회다／발리는 왜 디지털 노마드 비자를 발급할까?<br><br>5. 주 4일 근무는 이미 시작된 미래!<br>주 4일은 하루 더 놀자는 것이 아니다／왜 보수 정당인 일본 자민당은 주 4일제를 추진할까?／주 5일 근무제는 자본가의 선택이었다／한국에서 누가 주 4일 근무제를 하고 있는가?<br><br>6. 대도시를 탈출하는 사람들과 세컨드 하우스<br>농어촌 주택을 세')||TO_CLOB('컨드 하우스로 만든다면?／5도 2촌, 4
도 3촌: 우린 삶의 방향을 바꾼다／집이 가벼워지면 라이프스타일이 달라진다／빈집세와 인구 소멸, 그리고 세컨드 하우스에 대한 욕망<br><br>7. 잘코사니와 샤덴프로이데<br>누가 남의 불행에 기뻐할까?／왜 그들은 차별주의를 지지하는가?／왜 이혼율, 자살률이 급등한 시기와 경제 위기 시기가 일치할까?／무엇이 우릴 불안하게 만드는가?／과잉 근심 사회: 세상이 우릴 이렇게 만들었다!<br><br>8. 전방위로 확장하는 클린 테크<br>클린 테크를 주도하는 빌 게이츠／왜 글로벌 기업들이 클린 테크에 투자할까?／도대체 어디까지가 클린 테크인가?／왜 유니레버는 팜유를 대체하려고 거액을 투자할까?／결국 클린 테크가 새로운 부
의 중심이 된다<br><br>9. 일상에 들어온 로봇 택시와 무인 공장, 그리고 당신의 위기<br>왜 삼성전자는 무인 공장을 원하는가?／왜 현대자동차는 SW R&D 인력을 분리시키는가?／왜 현대자동차는 송창현을 원했는가?／당신도 이제 로봇 택시를 탈 것인가?／왜 “최악의 상황에 대비하라”는 말이 유행할까?<br><br>10. 절제의 시대, 축소 지향과 극단적 효율성<br>결혼식 축의금을 안 내겠다는 사람들／자발적 고립을 받아들인 자발적 아싸의 시대／축소 지향과 스탠딩 : 관계를 줄여라, 본질에 집중해라!／축소 지향과 제로: 무엇을 버릴 것인가?<br><br>11. 취향의 디테일, 디테일의 과시<br>당신은 어떤 작가의 어떤 작품을 소유하고 있
는가?／왜 나이키는 세계 최초의 새로운 매장을 홍대에 차렸을까?／DE&I : 배려의 디테일은 중요한 욕망이자 비즈니스 기회다／선택받는 트렌드는 디테일에서 결정된다／왜 상대적으로 덜 관심받던 지역에 관심이 늘어났을까?／디테')||TO_CLOB('일이 바꾸는 트렌드: 의식주의 작지만 큰 변화／왜 집에 대한 욕망이 바뀔 수 있을까?<br><br>참고자료'),0,500,'과시적 비소비',TIMESTAMP'2022-10-12 00:00:00.0',TIMESTAMP'2022-10-24 09:54:19.0',TIMESTAMP'2022-10-24 09:54:19.0');








-- ============================================================
-- 리뷰
-- ============================================================
INSERT INTO BOOK_REVIEW_TBL(ID, MEMBER_ID, BOOK_ID, SCORE, CONTENT) VALUES(BOOK_REVIEW_SEQ.nextval, 1, 1, 0, '나보다 항상 남이 우선이었던 나에게, 칭찬이 인색했던 나에게. 나에 대해 다시 한번 생각할 수 있게 해준 책.');
INSERT INTO BOOK_REVIEW_TBL(ID, MEMBER_ID, BOOK_ID, SCORE, CONTENT) VALUES(BOOK_REVIEW_SEQ.nextval, 1, 1, 0, '과정이 어렵고 힘든 사람들에게 도움이 될 수 있는 책');
INSERT INTO BOOK_REVIEW_TBL(ID, MEMBER_ID, BOOK_ID, SCORE, CONTENT) VALUES(BOOK_REVIEW_SEQ.nextval, 1, 1, 0, '나겨울 작가님 응원합니다:)');

-- ============================================================
-- 보관함
-- ============================================================


-- ============================================================
-- 결제
-- ============================================================


		