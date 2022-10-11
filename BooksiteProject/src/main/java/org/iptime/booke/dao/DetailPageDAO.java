package org.iptime.booke.dao;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.BookDTO;

public class DetailPageDAO extends JDBConnect {
	
	public BookDTO bidSearch(Long bid) {
		BookDTO dto = new BookDTO();
		
		String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID, TRANSLATOR, PRICE, DELIVERY_FEE, ESTIMATED_DELIVERY_DATE, TOTAL_PAGES, WEIGHT, ISBN13, ISBN10, BOOK_CATEGORY_ID, 	INTRODUCE, INTRODUCE_IMG, PUBLISHER, PUBLISHER_REVIEW, CONTENTS, QUANTITY, CATCHPHRASE, PUBLICATION_DATE FROM BOOK_TBL";
		if(bid != null) {
			query += " WHERE ID = " + bid + " ";
		}
		query += " ORDER BY ID DESC ";
		
		System.out.println("작성완료된 쿼리문: \n" + query);
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				dto.setId(rs.getLong(1));
				dto.setCoverImg(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAuthorId(rs.getLong(4));
				dto.setTranslator(rs.getString(5));
				dto.setPrice(rs.getInt(6));
				dto.setDeliveryFee(rs.getInt(7));
				dto.setEstimatedDeliveryDate(rs.getInt(8));
				dto.setTotalPages(rs.getInt(9));
				dto.setWeight(rs.getInt(10));
				dto.setIsbn13(rs.getLong(11));
				dto.setIsbn10(rs.getLong(12));
				dto.setBookCategoryId(rs.getInt(13));
				dto.setIntroduce(rs.getString(14));
				dto.setIntroduceImg(rs.getString(15));
				dto.setPublisher(rs.getString(16));
				dto.setPublisherReview(rs.getString(17));
				dto.setContents(rs.getString(18));
				dto.setQuantity(rs.getInt(19));
				dto.setCatchphrase(rs.getString(20));
				dto.setPublicationDate(rs.getDate(21));
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("bid 조회중 예외발생");
			System.out.println("dto 저장내용");
			dto.DTOPrintOut();
			
			e.printStackTrace();
		}
		
		return dto;
	}
}
