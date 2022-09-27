package org.iptime.booke.dao;

import java.sql.SQLException;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.BookDTO;

public class BookDAO extends DBConnPool{
	
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
				dto.setEstimatedDeliveryDate(rs.getLong("ESTIMATED_DELIVERY_DATE"));
			}
			
			return dto;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
}
