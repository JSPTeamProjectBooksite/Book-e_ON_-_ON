package org.iptime.booke.dao;


import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.BookDTO;

public class BookDAO extends DBConnPool{
	
	public Long nextNumber() {
		String query = "SELECT seq_board_num.nextval FROM DUAL";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			rs.next();
			return rs.getLong(1);
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1L;
		}
	}
	
	public BookDTO readBook(Long bId) {
		BookDTO dto = new BookDTO();
		String query = "SELECT BID, IMAGE, TITLE, AUTHOR, TRANSLATOR, PRICE, DELIVERY_FEE, ESTIMATED_DELIVERY_DATE "
				+ "FROM book_table "
				+ "WHERE BID = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setLong(1, bId);
			
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setBid(rs.getLong("BID"));
				dto.setImage(rs.getString("IMAGE"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setAuthor(rs.getString("AUTHOR"));
				dto.setTranslator(rs.getString("TRANSLATOR"));
				dto.setPrice(rs.getLong("PRICE"));
				dto.setDeliveryFee(rs.getLong("DELIVERY_FEE"));
				dto.setEstimatedDeliveryDate(rs.getString("ESTIMATED_DELIVERY_DATE"));
			}
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
