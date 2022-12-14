
SELECT * FROM book_table;

SELECT BID, IMAGE, TITLE, AUTHOR,TRANSLATOR, PRICE, DELIVERY_FEE, ESTIMATED_DELIVERY_DATE 
FROM book_table 
WHERE BID = 1;

SELECT * FROM MEMBER_TBL;
SELECT * FROM AUTHOR_TBL;
SELECT * FROM BOOK_TBL;
SELECT * FROM INQUIRY_TBL;

DELETE FROM MEMBER_TBL WHERE id = 18;

UPDATE MEMBER_TBL SET MEMBER_STATE_ID = 1 WHERE ID = ?

SELECT * FROM MEMBER_TBL WHERE id = 16;

UPDATE MEMBER_TBL SET name = '북이온앤온', EMAIL = 'b', PASSWORD = 'a', BIRTH = '2022-10-12', GENDER ='W', PHONE_NUM = '01011112222', ADDRESS ='a', POINT = 1000, MEMBER_STATE_ID = 1, REGISTER_DATE ='2022-10-12' WHERE id = 18;

-- 알림페이지 페이징 기능 실험
SELECT * FROM ( 	
	SELECT Tb.*, ROWNUM rNum FROM (
		SELECT ID, MEMBER_ID, TITLE, CATEGORY, CONTENT, TARGET_MEMBER_ID, REGISTER_DATE  FROM NOTICE_TBL
		ORDER BY ROWNUM DESC	
	) Tb
)WHERE rNum BETWEEN 1 AND 10

SELECT EMAIL FROM MEMBER_TBL WHERE NAME='d'AND ADDRESS ='d'

SELECT PASSWORD FROM MEMBER_TBL WHERE EMAIL='user01@gmail.com' AND NAME ='user01' and PHONE_NUM ='0100010001';

SELECT password FROM MEMBER_TBL WHERE id = 6 AND PASSWORD = 12345;

SELECT * FROM INQUIRY_TBL ORDER BY ID;