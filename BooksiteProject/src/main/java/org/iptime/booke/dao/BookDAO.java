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
		BookDTO dto = null;
		String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID, TRANSLATOR, PRICE, DELIVERY_FEE, ESTIMATED_DELIVERY_DATE "
				+ "FROM book_TBL "
				+ "WHERE ID = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setLong(1, bId);
			
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new BookDTO();
				dto.setId(rs.getLong(1));
				dto.setCoverImg(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAuthorId(rs.getLong(4));
				dto.setTranslator(rs.getString(5));
				dto.setPrice(rs.getInt(6));
				dto.setDeliveryFee(rs.getInt(7));
				dto.setEstimatedDeliveryDate(rs.getInt(8));
			}
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
