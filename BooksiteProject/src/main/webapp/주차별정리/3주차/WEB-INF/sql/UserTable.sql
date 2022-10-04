--테이블 조회
SELECT * FROM user_table;
--테이블 초기화
DROP TABLE user_table;
--시퀀스 초기화(이름 겹칠때)
DROP SEQUENCE PID_seq_board_num;

CREATE TABLE user_table (
	PID number(10), --유저 아이디(고유번호) 9로시작하면 관리자계정(90억 이상의 숫자)
	name varchar2(30), --이름(별명)
	id varchar2(25), --로그인 아이디
	password varchar2(30), --로그인 비밀번호
	birth date, -- 출생연월
	gender varchar2(1), -- 성별 0,1 이나 M W같은 한자리로 구분
	email varchar2(300), --이메일
	phone_number varchar2(20), --연락처
	is_SNS varchar2(1), --sns수신동의
	point number(10), --포인트
	register_date date, -- 가입일
	address varchar2(500), -- 주소
	post number(10) -- 글작성횟수
);

CREATE SEQUENCE PID_seq_board_num
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	nomaxvalue
	nocycle
	nocache;
	
INSERT INTO user_table (PID, name, id, password, birth, gender, email, phone_number, is_SNS, point, register_date, address, post)
	VALUES (
		PID_seq_board_num.nextval,
		'이현우',
		'lhw1234',
		'123123',
		'1997-10-14',
		'M',
		'lhw123@gmail.com',
		'010-1234-5678',
		'Y',
		35000,
		'2022-09-23',
		'경기도 어딘가 무슨곳 좋은동',
		12
	);
	
INSERT INTO user_table (PID, name, id, password, birth, gender, email, phone_number, is_SNS, point, register_date, address, post)
	VALUES (
		9000000001, -- 90억 이상의 수 인지 확인 >> 관리자계정 아니면 성별이 M 과 F도 아닌 다른무언가로 구별
		'메니져1',
		'ma1234',
		'123123',
		'2000-01-01',
		'M',
		'iammaster@gmail.com',
		'010-1234-5678',
		'Y',
		35000,
		'2022-09-23',
		'마스터계정',
		12
	);
	
INSERT INTO user_table (PID, name, id, password, birth, gender, email, phone_number, is_SNS, point, register_date, address, post)
	VALUES (
		PID_seq_board_num.nextval,
		'김하영',
		'khy1234',
		'123123',
		'1998-01-01',
		'F',
		'khy123@gmail.com',
		'010-3434-5645',
		'N', --비동의
		90000,
		'2022-09-23',
		'경기도...사시겠지?',
		56777
	);


INSERT INTO user_table (PID, name, id, password, birth, gender, email, phone_number, is_SNS, point, register_date, address, post)
	VALUES (
		PID_seq_board_num.nextval,
		'안성화니',
		'ash1234',
		'123123',
		'2003-01-01',
		'M',
		'ash123@gmail.com',
		'010-2121-5645',
		'Y', --비동의
		34200,
		'2022-09-23',
		'경기도 기흥 구청 어딘가',
		5
	);

-- 회원가입이라는 느낌?
-- 배송지 정보는 null이 들어가게 되고, 첫 주문시 DB의 값이 추가된다. 개시글(post)수는 0(초깃값)으로 만들어진다
INSERT INTO user_table (PID, name, id, password, birth, gender, email, phone_number, is_SNS, point, register_date, post)
	VALUES (
		PID_seq_board_num.nextval,
		'최진영',
		'cjy1234',
		'123123',
		'1996-01-01',
		'M',
		'chy123@gmail.com',
		'010-3784-5645',
		'Y', --비동의
		12000,
		'2022-09-23',
		0
	);
	





