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
	gender			nchar(2) 			NULL, 
	phone_num		CHAR(11) 			NULL,
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
COMMENT ON COLUMN member_TBL.gender IS '성별 (남자, 여자, 기타)';
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
	member_id 			NUMBER 			NOT NULL	PRIMARY KEY,
	profile_Img			varchar2(300)		NULL,
	name 				varchar2(30)	NOT NULL,
	nationality			nvarchar2(20)		NULL,
	profile_contents	nvarchar2(1000)		NULL,
	register_date		DATE			DEFAULT sysdate,
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
	translator 				nvarchar2(1000)		NULL,
	price 					number(7)		NOT NULL,
	delivery_fee 			number(5)		DEFAULT 0,
	estimated_delivery_date number(3)			NULL,
	total_pages				number(5)		NOT NULL,
	weight 					number(10)			NULL,
	ISBN13 					number(13)			NULL,
	ISBN10 					number(10)			NULL,
	book_category_id 		number(3)		NOT NULL,
	introduce 				varchar(4000)		NULL,
	introduce_img 			varchar2(350)		NULL,
	publisher 				varchar2(300)		NULL,
	publisher_review 		varchar2(4000)		NULL,
	contents				varchar2(4000)		NULL,
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
COMMENT ON COLUMN book_TBL.ISBN13  IS 'ISBN13 번호';
COMMENT ON COLUMN book_TBL.ISBN10  IS 'ISBN10 번호';
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

-- ==================================================================================================================================
-- ==================================================================================================================================
-- ==================================================================================================================================

-- 더미값 세팅

-- ==================================================================================================================================
-- ==================================================================================================================================
-- ==================================================================================================================================

-- ============================================================
-- 멤버 상태
-- ============================================================
INSERT INTO member_state_TBL(id, name) VALUES(0, '활동');
INSERT INTO member_state_TBL(id, name) VALUES(1, '삭제 유예');
INSERT INTO member_state_TBL(id, name) VALUES(2, '정지');
INSERT INTO member_state_TBL(id, name) VALUES(3, '휴면');

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
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address) VALUES(member_SEQ.nextval, 'user01', 'user01@gmail.com', 'user01', '2022-10-01', '남자', '0100010001', '경기도 어딘가 무슨곳 좋은동');
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address) VALUES(member_SEQ.nextval, 'user02', 'user02@gmail.com', 'user02', '2022-10-01', '여자', '0100010002', '경기도 어딘가 무슨곳 좋은동');
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address) VALUES(member_SEQ.nextval, 'user03', 'user03@gmail.com', 'user03', '2022-10-01', '기타', '0100010003', '경기도 어딘가 무슨곳 좋은동');
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender, phone_num, address) VALUES(member_SEQ.nextval, 'user04', 'user04@gmail.com', 'user04', '2022-10-01', NULL, '0100010004', '경기도 어딘가 무슨곳 좋은동');
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
-- ============================================================
-- 문의
-- ============================================================
INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, 1, '404에러나요', '404에러나요');
INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, 1, '405에러나요', '405에러나요');
INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, 1, '500에러나요', '500에러나요');


-- ============================================================
-- 저자
-- ============================================================
INSERT INTO author_TBL (member_id, profile_Img, name, nationality, PROFILE_CONTENTS) VALUES(1, NULL, '나겨울', '국내작가', '글이 사람들에게 선한 영향력을 미치는 수단이라고 믿는다.');
INSERT INTO author_TBL (member_id, profile_Img, name, nationality, PROFILE_CONTENTS) VALUES(2, NULL, '김욱동', '국내작가', '한국외국어대학교 영문과 및 동 대학원을 졸업한 뒤 미국 미시시피대학교에서 영문학 문학석사 학위를, 뉴욕주립대학교에서 영문학 문학박사를 받았다.');
INSERT INTO author_TBL (member_id, profile_Img, name, nationality, PROFILE_CONTENTS) VALUES(3, NULL, '손원평', '국내작가', '서울에서 태어났다. 서강대학교에서 사회학과 철학을 공부했고 한국영화아카데미 영화과에서 영화 연출을 전공했다.');

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
	AUTHOR_ID, TRANSLATOR, PRICE, DELIVERY_FEE, ESTIMATED_DELIVERY_DATE, 
	TOTAL_PAGES, WEIGHT, ISBN13, ISBN10, BOOK_CATEGORY_ID, 
	INTRODUCE, INTRODUCE_IMG, 
	PUBLISHER, PUBLISHER_REVIEW, 
	CONTENTS, QUANTITY, 
	CATCHPHRASE, 
	PUBLICATION_DATE
)
VALUES(
	BOOK_SEQ.nextval, 
	'source/book/기분이_태도가_되지_않으려면.png', '기분이 태도가 되지 않으려면', 
	1, null, 13500, 5000, 3, 
	224, 306, 9791197080845, 1197080848, 80, 
	'<p><h3>‘남들 챙기느라 정작 나를 사랑하는 법을<br>잊어버린 당신에게 바치는 따뜻한 감정 수업’</h3></p><br>우리는 지금까지 나 자신보다 상대방의 감정을 더 배려하고 존중해왔다. 상대방에게 불편한 사람, 싫은 사람이 되고 싶지 않았기 때문. 하지만 정작 상대방의 감정을 배려하느라 내가 느끼고 있는 솔직한 감정들을 마주 볼 시간 없이 몸만 큰 ‘어른아이’가 됐다.<br>문자로 진행되는 ‘텍스트테라피’를 통해 1만 건이 넘는 상담을 했고, 글쓰기를 통해 마음을 치유하는 ‘상담&치유 글쓰기 수업’도 진행하고 있는 나겨울 작가는 남들을 챙기느라 정작 자신의 감정을 챙기지 못하고 살아가는 ‘어른아이’들에게 이렇게 말한다. ‘치유의 기본은 자신을 알아가는 것이고, 자신을 알아가기 위해선 스스로의 감정을 정확하게 파악해야 한다.’그녀는 이번 책을 통해 우리가 일상에서 익숙하게 느끼는 감정들을 정확히 파악하는 법과, 그 감정들을 바람직하게 받아들이는 구체적인 방법을 제시한다.', null, 
	'떠오름(RISE)', '나겨울 작가는 1만건이상의 상담을 진행하며, 자신에게 고민을 털어놓는 사람들의 대부분의 문제는 ‘내’가 아니라 ‘남’에게 있다는 것을 알게 되었다. 이들은 겉으로는 아무렇지 않은 듯 보이고, 굉장히 건강해보이지만 실제로는 언제 무너질지 모르는, 위태한 상황에 좌절하고 있었다. 이들에게 부정적으로 느껴지는 감정의 원인은 대부분 ‘남’에게 있었고, 정작 자신의 감정을 돌보는데는 한 없이 어색하며, 내가 어떤 상황인지를 정확히 인지할 생각조차 하지 못하고 있었던 것이다.', 
	'자존감이 낮아서 고민이에요------------------ 015', 1, 
	'<br><b>감정 기복이 심한 당신에게 필요한 기분 수업<b>', 
	'2021-08-30'
);

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


	
	