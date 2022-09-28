package org.iptime.booke.dao;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.BookDTO;

public class DetailPageDAO extends JDBConnect {
	
	public BookDTO bidSearch(Long bid) {
		BookDTO dto = new BookDTO();
		
		String query = "SELECT * FROM book_table";
		if(bid != null) {
			query += " WHERE bid = " + bid + " ";
		}
		query += " ORDER BY bid DESC ";
		
//		System.out.println("작성완료된 쿼리문: " + query);
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				dto.setBid(rs.getLong(1));
				dto.setImage(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAuthor(rs.getString(4));
				dto.setTranslator(rs.getString(5));
				dto.setPrice(rs.getLong(6));
				dto.setDeliveryFee(rs.getLong(7));
				dto.setEstimatedDeliveryDate(rs.getString(8));
				dto.setTotal_pages(rs.getLong(9));
				dto.setWeight(rs.getLong(10));
				dto.setIsbn(rs.getLong(11));
				dto.setBookCategoryId(rs.getString(12));
				dto.setIntroduce(rs.getString(13));
				dto.setIntroduceImage(rs.getString(14));
				dto.setPublisher(rs.getString(15));
				dto.setPublisherReview(rs.getString(16));
				dto.setContents(rs.getString(17));
				dto.setVisit(rs.getLong(18));
				dto.setPublicationDate(rs.getString(19));
				dto.setRegistDate(rs.getString(20));
				dto.setUpdateDate(rs.getString(21));
				dto.setAd(rs.getString(22));
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("bid 조회중 예외발생");
			e.printStackTrace();
		}
		
		return dto;
	}
}
