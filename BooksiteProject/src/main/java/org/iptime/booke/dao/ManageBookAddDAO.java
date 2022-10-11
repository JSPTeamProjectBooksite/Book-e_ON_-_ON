package org.iptime.booke.dao;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.BookDTO;

public class ManageBookAddDAO extends DBConnPool {
	//책 정보를 입력합니다.
	public boolean insertBook(BookDTO dto) {
		boolean reselt = false;
		
		try {
			String query = "INSERT INTO BOOK_TBL ( "
					+ " id, coverImg, title, authorId, translator, price, deliveryFee, estimatedDeliveryDate, totalPages, weight, isbn13, isbn10, bookCategoryId, introduce, introduceImg, publisher, publisherReview, contents, visit, quantity, catchphrase, publicationDate, registDate, updateDate)"
					+ " VALUES ( "
					+ " BOOK_SEQ.nextval,  "
					;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return reselt;
	}
}
