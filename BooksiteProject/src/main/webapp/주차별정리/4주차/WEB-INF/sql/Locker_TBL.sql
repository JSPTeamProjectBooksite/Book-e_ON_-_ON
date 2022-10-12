--DROP TABLE locker_TBL;

CREATE TABLE locker_TBL(
	member_id 	NUMBER 	NOT NULL,
	book_id 	NUMBER	NOT NULL,
	CONSTRAINT member_id_and_book_id_PK PRIMARY KEY(member_id, book_id)
);

ALTER TABLE locker_TBL ADD CONSTRAINT locker_member_id_FK FOREIGN KEY(member_id) REFERENCES member_TBL(id);
ALTER TABLE locker_TBL ADD CONSTRAINT locker_book_id_FK FOREIGN KEY(book_id) REFERENCES book_TBL(id);

COMMENT ON COLUMN locker_TBL.MEMBER_ID IS '북마크한 멤버 id'; 
COMMENT ON COLUMN locker_TBL.BOOK_ID IS '북마크 당한 책 id'; 
