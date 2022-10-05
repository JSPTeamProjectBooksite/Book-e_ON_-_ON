-- 모든 테이블 삭제
TRUNCATE TABLE BOOK_CATEGORY_TBL;
TRUNCATE TABLE BOOK_REVIEW_TBL;
TRUNCATE TABLE LOCKER_TBL;
TRUNCATE TABLE NOTICE_TBL;
TRUNCATE TABLE PAYMENT_TBL;
TRUNCATE TABLE BOOK_TBL;
TRUNCATE TABLE AUTHOR_TBL;
TRUNCATE TABLE ADMIN_TBL;
TRUNCATE TABLE INQUIRY_TBL;
TRUNCATE TABLE MEMBER_TBL;
TRUNCATE TABLE MEMBER_STATE_TBL;
TRUNCATE TABLE GENDER_TBL;

DROP SEQUENCE book_category_SEQ;
DROP SEQUENCE BOOK_REVIEW_SEQ;
DROP SEQUENCE BOOK_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE notice_SEQ;
DROP SEQUENCE inquiry_SEQ;

CREATE SEQUENCE book_category_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 nomaxvalue nocycle nocache;
CREATE SEQUENCE BOOK_REVIEW_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 nomaxvalue nocycle nocache;
CREATE SEQUENCE BOOK_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 nomaxvalue nocycle nocache;
CREATE SEQUENCE MEMBER_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 nomaxvalue nocycle nocache;
CREATE SEQUENCE notice_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 nomaxvalue nocycle nocache;
CREATE SEQUENCE inquiry_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 nomaxvalue nocycle nocache;

-- 모든 테이블 생성
-- ============================================================
-- 성별
-- ============================================================
INSERT INTO GENDER_TBL(id, name) VALUES(0, '기타');
INSERT INTO GENDER_TBL(id, name) VALUES(1, '남자');
INSERT INTO GENDER_TBL(id, name) VALUES(2, '여자');

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
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'국내도서', null);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'외국도서', null);


-- ============================================================
-- 멤버
-- ============================================================
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender_id, phone_num, address) VALUES(member_SEQ.nextval, 'user01', 'user01@gmail.com', 'user01', '2022-10-01', 1, '0100010001', '경기도 어딘가 무슨곳 좋은동');
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender_id, phone_num, address) VALUES(member_SEQ.nextval, 'user02', 'user02@gmail.com', 'user02', '2022-10-01', 1, '0100010002', '경기도 어딘가 무슨곳 좋은동');
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender_id, phone_num, address) VALUES(member_SEQ.nextval, 'user03', 'user03@gmail.com', 'user03', '2022-10-01', 1, '0100010003', '경기도 어딘가 무슨곳 좋은동');
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender_id, phone_num, address) VALUES(member_SEQ.nextval, 'user04', 'user04@gmail.com', 'user04', '2022-10-01', 1, '0100010004', '경기도 어딘가 무슨곳 좋은동');
INSERT INTO MEMBER_TBL(id, name, email, password, birth, gender_id, phone_num, address) VALUES(member_SEQ.nextval, 'user05', 'user05@gmail.com', 'user05', '2022-10-01', 1, '0100010005', '경기도 어딘가 무슨곳 좋은동');


-- ============================================================
-- 문의
-- ============================================================
INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, 1, '404에러나요', '404에러나요');
INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, 1, '405에러나요', '405에러나요');
INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, 1, '500에러나요', '500에러나요');


-- ============================================================
-- 저자
-- ============================================================
INSERT INTO author_TBL (member_id, profile_Img, name, nationality, profile) VALUES(1, NULL, '나겨울', '국내작가', '글이 사람들에게 선한 영향력을 미치는 수단이라고 믿는다.');
INSERT INTO author_TBL (member_id, profile_Img, name, nationality, profile) VALUES(2, NULL, '김욱동', '국내작가', '한국외국어대학교 영문과 및 동 대학원을 졸업한 뒤 미국 미시시피대학교에서 영문학 문학석사 학위를, 뉴욕주립대학교에서 영문학 문학박사를 받았다.');
INSERT INTO author_TBL (member_id, profile_Img, name, nationality, profile) VALUES(3, NULL, '손원평', '국내작가', '서울에서 태어났다. 서강대학교에서 사회학과 철학을 공부했고 한국영화아카데미 영화과에서 영화 연출을 전공했다.');

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
	COVER_IMG, 
	TITLE, 
	AUTHOR_ID, 
	TRANSLATOR, 
	PRICE, 
	DELIVERY_FEE, 
	ESTIMATED_DELIVERY_DATE, 
	TOTAL_PAGES, 
	WEIGHT, 
	ISBN, 
	BOOK_CATEGORY_ID, 
	INTRODUCE, 
	INTRODUCE_IMG, 
	PUBLISHER, 
	PUBLISHER_REVIEW, 
	CONTENTS, 
	QUANTITY, 
	CATCHPHRASE, 
	PUBLICATION_DATE
)
VALUES(
	BOOK_SEQ.nextval, 
	'source/book/기분이_태도가_되지_않으려면.png', 
	'기분이 태도가 되지 않으려면', 
	0, 
	null, 
	13500, 
	0, 
	0, 
	224, 
	306, 
	9791197080845, 
	1, 
	'<p><h3>‘남들 챙기느라 정작 나를 사랑하는 법을<br>잊어버린 당신에게 바치는 따뜻한 감정 수업’</h3></p><br>우리는 지금까지 나 자신보다 상대방의 감정을 더 배려하고 존중해왔다. 상대방에게 불편한 사람, 싫은 사람이 되고 싶지 않았기 때문. 하지만 정작 상대방의 감정을 배려하느라 내가 느끼고 있는 솔직한 감정들을 마주 볼 시간 없이 몸만 큰 ‘어른아이’가 됐다.<br>문자로 진행되는 ‘텍스트테라피’를 통해 1만 건이 넘는 상담을 했고, 글쓰기를 통해 마음을 치유하는 ‘상담&치유 글쓰기 수업’도 진행하고 있는 나겨울 작가는 남들을 챙기느라 정작 자신의 감정을 챙기지 못하고 살아가는 ‘어른아이’들에게 이렇게 말한다. ‘치유의 기본은 자신을 알아가는 것이고, 자신을 알아가기 위해선 스스로의 감정을 정확하게 파악해야 한다.’그녀는 이번 책을 통해 우리가 일상에서 익숙하게 느끼는 감정들을 정확히 파악하는 법과, 그 감정들을 바람직하게 받아들이는 구체적인 방법을 제시한다.', 
	null, 
	'떠오름(RISE)', 
	'나겨울 작가는 1만건이상의 상담을 진행하며, 자신에게 고민을 털어놓는 사람들의 대부분의 문제는 ‘내’가 아니라 ‘남’에게 있다는 것을 알게 되었다. 이들은 겉으로는 아무렇지 않은 듯 보이고, 굉장히 건강해보이지만 실제로는 언제 무너질지 모르는, 위태한 상황에 좌절하고 있었다. 이들에게 부정적으로 느껴지는 감정의 원인은 대부분 ‘남’에게 있었고, 정작 자신의 감정을 돌보는데는 한 없이 어색하며, 내가 어떤 상황인지를 정확히 인지할 생각조차 하지 못하고 있었던 것이다.', 
	'자존감이 낮아서 고민이에요------------------ 015', 1, '<br><b>감정 기복이 심한 당신에게 필요한 기분 수업<b>', 
	''
);

-- ============================================================
-- 리뷰
-- ============================================================


-- ============================================================
-- 보관함
-- ============================================================


-- ============================================================
-- 결제
-- ============================================================


	