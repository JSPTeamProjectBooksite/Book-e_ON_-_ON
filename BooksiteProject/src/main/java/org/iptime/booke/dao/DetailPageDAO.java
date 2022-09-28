package org.iptime.booke.dao;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.BookDTO;

public class DetailPageDAO extends JDBConnect {
	
	public BookDTO bidSearch(Long bid) {
		BookDTO book = new BookDTO();
		
		String query = "SELECT * FROM book_table";
		if(bid != null) {
			query += " WHERE bid = " + bid + " ";
		}
		query += " ORDER BY bid DESC ";
		
		System.out.println("작성완료된 쿼리문: " + query);
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				book.setBid(rs.getLong(1));
				book.setImage(rs.getString(2));
				book.setTitle(rs.getString(3));
				book.setAuthor(rs.getString(4));
				book.setTranslator(rs.getString(5));
				book.setPrice(rs.getLong(6));
				book.setDeliveryFee(rs.getLong(7));
				book.setEstimatedDeliveryDate(rs.getString(8));
				book.setTotal_pages(rs.getLong(9));
				book.setWeight(rs.getLong(10));
				book.setIsbn(rs.getLong(11));
				book.setBookCategoryId(rs.getString(12));
				book.setIntroduce(rs.getString(13));
				book.setIntroduceImage(rs.getString(14));
				book.setPublisher(rs.getString(15));
				book.setPublisherReview(rs.getString(16));
				book.setContents(rs.getString(17));
				book.setVisit(rs.getLong(18));
				book.setPublicationDate(rs.getString(19));
				book.setRegistDate(rs.getString(20));
				book.setUpdateDate(rs.getString(21));
				book.setAd(rs.getString(22));
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("bid 조회중 예외발생");
			e.printStackTrace();
		}
		
		return book;
	}
}
