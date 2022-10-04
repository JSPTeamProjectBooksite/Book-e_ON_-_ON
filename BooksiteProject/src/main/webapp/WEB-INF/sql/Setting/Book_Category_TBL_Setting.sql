-- YES24 사이트 카테고리 참고했습니다 (YES24 카테고리 보기 : http://www.yes24.com/Main/default.aspx)

-- level 1 분류
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'국내도서', null);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'외국도서', null);

-- ==level 2 분류
-- 국내도서
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'인문', 1);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'역사', 1);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'사회 정치', 1);

-- 외국도서
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'ELT 사전', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'경제 경영', 2);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'인문 사회', 2);

-- ====level 3 분류
-- 국내도서> 인문
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'인문/교양', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'글쓰기', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'독서/비평', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'출판/서점', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'주제로 읽는 인문학', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'심리', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'철학/사상', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'서양철학', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'동양철학', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'한국철학', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'명리/주역/풍수', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'논리학', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'윤리학', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'기호학/언어학', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'미학/예술철학', 3);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'종교학/신화학', 3);

-- 국내도서> 역사
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'역사와 문화 교양서', 4);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'역사학 이론/비평', 4);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'한국사/한국문화', 4);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'동양사/동양문화', 4);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'서양사/서양문화', 4);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'세계사/세계문화', 4);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'아프리카/중동/중남미/오세아니아 역사', 4);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'주제로 읽는 역사', 4);

-- 국내도서> 사회 정치
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'사회비평/비판', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'사회단체/NGO', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'정치/외교', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'사회학', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'여성/젠더', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'교육', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'언론학/미디어론', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'생태/환경', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'미래예측', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'행정', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'법', 5);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'국방/군사', 5);

-- 외국도서> ELT 사전
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'영영사전', 6);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'수험서', 6);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'비즈니스 영어', 6);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'듣기 읽기 말하기 쓰기', 6);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'영어학 & 영어교육', 6);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'유학준비', 6);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'제2외국어/백과사전', 6);

-- 외국도서> 문학 소설
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'문학일반', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'소설', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'시/희곡', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'신화/전설', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'에세이', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'오디오북', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'Harry Potter', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'Chronicles of Narnia', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'Percy Jackson & the Olympians', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'Lord of the Rings', 7);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'The Twilight Saga', 7);

-- 외국도서> 경제 경영
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'경영/비즈니스', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'경제학/경제이론', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'마케팅/세일즈', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'오디오북 (경제경영)', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'자기계발/처세술', 8);
INSERT INTO book_category_TBL VALUES(book_category_SEQ.nextval,'투자/재테크', 8);


SELECT * FROM book_category_TBL;