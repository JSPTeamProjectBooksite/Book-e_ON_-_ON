package org.iptime.booke.dao;


import java.sql.Date;

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
	
	//BookAddController
	public boolean insertBook(BookDTO dto) {
		boolean reselt = false;
		
		try {
			String query = "INSERT INTO BOOK_TBL("
					+ "	ID,"
					+ "	COVER_IMG,"
					+ " TITLE,"
					+ "	AUTHOR_ID,"
					+ " TRANSLATOR,"
					+ " PRICE,"
					+ " DELIVERY_FEE,"
					+ " ESTIMATED_DELIVERY_DATE,"
					+ "	TOTAL_PAGES,"
					+ " WEIGHT,"
					+ " ISBN13,"
					+ " ISBN10,"
					+ " BOOK_CATEGORY_ID,"
					+ "	INTRODUCE,"
					+ " INTRODUCE_IMG,"
					+ "	PUBLISHER,"
					+ " PUBLISHER_REVIEW,"
					+ "	CONTENTS,"
					+ " VISIT,"
					+ "	CATCHPHRASE,"
					+ "	PUBLICATION_DATE"
					+ ")"
					+ "VALUES("
					+ "	BOOK_SEQ.nextval,"
					+ "	?,"
					+ " ?,"
					+ "	?," //작가 아이디
					+ " ?,"
					+ " ?,"
					+ " ?,"
					+ " ?,"
					+ "	?,"
					+ " ?,"
					+ " ?,"
					+ " ?,"
					+ " ?,"
					+ "	?,"
					+ " ?,"
					+ "	?,"
					+ " ?,"
					+ "	?,"
					+ " ?,"
					+ "	?,"
					+ "	?"
					+ ")";
			
			System.out.println("쿼리문:");
			System.out.println(query);
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getCoverImg());
			psmt.setString(2, dto.getTitle());
			psmt.setLong(3, dto.getAuthorId());
			psmt.setString(4, dto.getTranslator());
			psmt.setInt(5, dto.getPrice());
			psmt.setInt(6, dto.getDeliveryFee());
			//psmt.setInt(7, dto.getEstimatedDeliveryDate());
			System.out.println("예상 배송일 : " + dto.getEstimatedDeliveryDate());
			psmt.setInt(7, 2);
			psmt.setInt(8, dto.getTotalPages());
			psmt.setInt(9, dto.getWeight());
			psmt.setLong(10, dto.getIsbn13());
			psmt.setLong(11, dto.getIsbn10());
			psmt.setInt(12, dto.getBookCategoryId());
			psmt.setString(13, dto.getIntroduce());
			psmt.setString(14, dto.getIntroduceImg());
			psmt.setString(15, dto.getPublisher());
			psmt.setString(16, dto.getPublisherReview());
			psmt.setString(17, dto.getContents());
			psmt.setInt(18, 0);
			psmt.setString(19, dto.getCatchphrase());
			psmt.setDate(20, new Date(dto.getPublicationDate().getTime()));
			
//			System.out.println("만들어진 쿼리문 :");
//			System.out.println(psmt.toString());
			
			int applyResult = psmt.executeUpdate();
			
			System.out.println("psmt.executeUpdate() : " + applyResult);
			
			reselt = (applyResult == 1)? true: false;
			
		} catch (Exception e) {
			System.out.println("책 INSERT 중 예외 발생");
			e.printStackTrace();
		}
		
		return reselt;
	}
}
