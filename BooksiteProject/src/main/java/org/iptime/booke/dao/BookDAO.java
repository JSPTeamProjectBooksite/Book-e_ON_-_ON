package org.iptime.booke.dao;


import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.BookDTO;

public class BookDAO extends DBConnPool{
	
	public Long nextNumber() {
		String query = "SELECT board_SEQ.nextval FROM DUAL";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			rs.next();
			return rs.getLong(1);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public BookDTO readBook(Long bId) {
		BookDTO dto = new BookDTO();
		String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID, TRANSLATOR, PRICE, DELIVERY_FEE, ESTIMATED_DELIVERY_DATE "
				+ "FROM book_TBL "
				+ "WHERE ID = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setLong(1, bId);
			
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getLong("ID"));
				dto.setCoverImg(rs.getString("COVER_IMG"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setAuthorId(rs.getLong("AUTHOR_ID"));
				dto.setTranslator(rs.getString("TRANSLATOR"));
				dto.setPrice(rs.getInt("PRICE"));
				dto.setDeliveryFee(rs.getInt("DELIVERY_FEE"));
				dto.setEstimatedDeliveryDate(rs.getInt("ESTIMATED_DELIVERY_DATE"));
			}
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
