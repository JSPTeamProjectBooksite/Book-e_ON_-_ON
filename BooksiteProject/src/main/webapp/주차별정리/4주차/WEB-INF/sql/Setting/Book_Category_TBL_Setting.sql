-- 교보문고eBook 사이트 카테고리 참고했습니다 (교보문고eBook 카테고리 보기 : http://digital.kyobobook.co.kr/digital/ebook/ebookMain.ink?orderClick=c14)
--SELECT book_category_SEQ.nextval from DUAL;
SELECT id FROM BOOK_CATEGORY_TBL WHERE name = '교양심리';

TRUNCATE TABLE BOOK_CATEGORY_TBL;
DROP SEQUENCE book_category_SEQ;
CREATE SEQUENCE book_category_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 nomaxvalue nocycle nocache;

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



SELECT * FROM book_category_TBL;