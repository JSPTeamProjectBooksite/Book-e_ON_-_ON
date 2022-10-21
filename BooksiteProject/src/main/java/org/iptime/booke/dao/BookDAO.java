package org.iptime.booke.dao;


import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.AuthorDTO;
import org.iptime.booke.dto.BookDTO;

public class BookDAO extends DBConnPool{
	
	public Long nextNumber() {
		String query = "SELECT * FROM book_review_TBL";
		
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
		String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID, TRANSLATOR, PRICE, DELIVERY_FEE, ESTIMATED_DELIVERY_DATE, book_category_id "
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
				dto.setBookCategoryId(rs.getInt(9));
			}
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	//책 읽어오기
	//메인 페이지
	//인기도서 읽어오기
	public List<Map<String, Object>> selectPopularList(int num){
		List<Map<String, Object>> booklist = new ArrayList<>();
		
		String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID FROM BOOK_TBL ORDER BY VISIT DESC";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			int i = 0;
			
			while(rs.next() && i++ < num) {
				Map<String, Object> book = new HashMap<>();
				
				BookDTO bookDto = new BookDTO();
				
				bookDto.setId(rs.getLong(1));
				bookDto.setCoverImg(rs.getString(2));
				bookDto.setTitle(rs.getString(3));
				bookDto.setAuthorId(rs.getLong(4));
				// 작가 아이디로 작가 조회
				AuthorDAO authorDao = new AuthorDAO();
				AuthorDTO authorDto = authorDao.findAuthor(bookDto.getAuthorId());
				authorDao.close();
				
				book.put("book", bookDto);
				book.put("author", authorDto);
				
				
				booklist.add(book);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("메인 인기항목 불러오는 중 오류발생");
			e.printStackTrace();
		}
		
		return booklist;
	}
	//디테일 페이지
	//책 정보 읽어오기
	public BookDTO bookDetail(Long bid) {
		BookDTO dto = new BookDTO();
		
		String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID, TRANSLATOR, PRICE, DELIVERY_FEE, ESTIMATED_DELIVERY_DATE, TOTAL_PAGES, WEIGHT, ISBN13, ISBN10, BOOK_CATEGORY_ID, 	INTRODUCE, INTRODUCE_IMG, PUBLISHER, PUBLISHER_REVIEW, CONTENTS, QUANTITY, CATCHPHRASE, PUBLICATION_DATE FROM BOOK_TBL";
		if(bid != null) {
			query += " WHERE ID = " + bid + " ";
		}
		query += " ORDER BY ID DESC ";
		
		//System.out.println("작성완료된 쿼리문: \n" + query);
		
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
				dto.setIsbn13(rs.getString(11));
				dto.setIsbn10(rs.getString(12));
				dto.setBookCategoryId(rs.getInt(13));
				dto.setIntroduce(rs.getString(14));
				dto.setIntroduceImg(rs.getString(15));
				dto.setPublisher(rs.getString(16));
				dto.setPublisherReview(rs.getString(17));
				dto.setContents(rs.getString(18));
				dto.setQuantity(rs.getInt(19));
				dto.setCatchphrase(rs.getString(20));
				dto.setPublicationDate(rs.getDate(21).toLocalDate());
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
	
	
	//BookAddController
	//책 추가
	public boolean insertBook(BookDTO dto) {
		boolean reselt = false;
		
		try {
			String query = "INSERT INTO BOOK_TBL( ID, COVER_IMG, TITLE, AUTHOR_ID, TRANSLATOR, PRICE, DELIVERY_FEE, ESTIMATED_DELIVERY_DATE, TOTAL_PAGES, WEIGHT, ISBN13, ISBN10, BOOK_CATEGORY_ID, INTRODUCE, INTRODUCE_IMG, PUBLISHER, PUBLISHER_REVIEW, CONTENTS, VISIT, CATCHPHRASE, PUBLICATION_DATE ) VALUES( BOOK_SEQ.nextval";
			
			System.out.println("쿼리문:");
			System.out.println(query);
			
			Date date = null;
			if(dto.getPublicationDate() != null)
				date = Date.valueOf(dto.getPublicationDate());
			
			query += ", ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getCoverImg());
			psmt.setString(2, dto.getTitle());
			psmt.setLong(3, dto.getAuthorId());
			psmt.setString(4, dto.getTranslator());
			psmt.setInt(5, dto.getPrice());
			psmt.setInt(6, dto.getDeliveryFee());
			psmt.setInt(7, 2); //예상 배송일
			psmt.setObject(8, dto.getTotalPages());
			psmt.setObject(9, dto.getWeight());
			psmt.setObject(10, dto.getIsbn13());
			psmt.setObject(11, dto.getIsbn10());
			psmt.setObject(12, dto.getBookCategoryId());
			psmt.setString(13, dto.getIntroduce());
			psmt.setString(14, dto.getIntroduceImg());
			psmt.setString(15, dto.getPublisher());
			psmt.setString(16, dto.getPublisherReview());
			psmt.setString(17, dto.getContents());
			psmt.setObject(18, 0);
			psmt.setString(19, dto.getCatchphrase());
			psmt.setDate(20, date);
			
//			query += ", '" + dto.getCoverImg() + "'";
//			query += ", '" + dto.getTitle() + "'";
//			query += ", " + dto.getAuthorId();
//			query += ", '" + dto.getTranslator() + "'";
//			query += ", " + dto.getPrice();
//			query += ", " + dto.getDeliveryFee();
//			query += ", " + 2; //예상 배송일
//			query += ", " + dto.getTotalPages();
//			query += ", " + dto.getWeight();
//			query += ", " + dto.getIsbn13();
//			query += ", " + dto.getIsbn10();
//			query += ", " + dto.getBookCategoryId();
//			query += ", '" + dto.getIntroduce() + "'";
//			query += ", '" + dto.getIntroduceImg() + "'";
//			query += ", '" + dto.getPublisher() + "'";
//			query += ", '" + dto.getPublisherReview() + "'";
//			query += ", '" + dto.getContents() + "'";
//			query += ", " + 0;
//			query += ", '" + dto.getCatchphrase() + "'";
//			query += ", '" + date + "')";
//			System.out.println("query: " + query);
			
			int applyResult = psmt.executeUpdate();
						
			System.out.println("psmt.executeUpdate() : " + applyResult);
			
			reselt = (applyResult == 1)? true: false;
			
		} catch (Exception e) {
			System.out.println("책 INSERT 중 예외 발생");
			e.printStackTrace();
		}
		
		return reselt;
	}
	//책 수정
	public boolean updateBook(BookDTO dto, Long id) {
		boolean reselt = false;
		
		try {
			String query = "UPDATE BOOK_TBL SET"
					+ "	COVER_IMG = ?,"
					+ " TITLE = ?,"
					+ "	AUTHOR_ID = ?,"
					+ " TRANSLATOR = ?,"
					+ " PRICE = ?,"
					+ " DELIVERY_FEE = ?,"
					+ " ESTIMATED_DELIVERY_DATE = ?,"
					+ "	TOTAL_PAGES = ?,"
					+ " WEIGHT = ?,"
					+ " ISBN13 = ?,"
					+ " ISBN10 = ?,"
					+ " BOOK_CATEGORY_ID = ?,"
					+ "	INTRODUCE = ?,"
					+ " INTRODUCE_IMG = ?,"
					+ "	PUBLISHER = ?,"
					+ " PUBLISHER_REVIEW = ?,"
					+ "	CONTENTS = ?,"
					+ " VISIT = ?,"
					+ "	CATCHPHRASE = ?,"
					+ "	PUBLICATION_DATE = ?"
					+ " WHERE ID = " + id;
			
			System.out.print("쿼리문:");
			System.out.println(query);
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getCoverImg());
			psmt.setString(2, dto.getTitle());
			psmt.setLong(3, dto.getAuthorId());
			psmt.setString(4, dto.getTranslator());
			psmt.setInt(5, dto.getPrice());
			psmt.setInt(6, dto.getDeliveryFee());
			psmt.setInt(7, 2);
			psmt.setObject(8, dto.getTotalPages());
			psmt.setObject(9, dto.getWeight());
			psmt.setObject(10, dto.getIsbn13());
			psmt.setObject(11, dto.getIsbn10());
			psmt.setObject(12, dto.getBookCategoryId());
			psmt.setString(13, dto.getIntroduce());
			psmt.setString(14, dto.getIntroduceImg());
			psmt.setString(15, dto.getPublisher());
			psmt.setString(16, dto.getPublisherReview());
			psmt.setString(17, dto.getContents());
			psmt.setObject(18, 0);
			psmt.setString(19, dto.getCatchphrase());
			
			Date date = null;
			if(dto.getPublicationDate() != null)
				date = Date.valueOf(dto.getPublicationDate());
			psmt.setDate(20, date);
			
//			System.out.print("만들어진 쿼리문 :");
//			System.out.println(psmt.toString());
			
			int applyResult = psmt.executeUpdate();
			
			System.out.println("psmt.executeUpdate() : " + applyResult);
			
			reselt = (applyResult == 1)? true: false;
			
		} catch (Exception e) {
			System.out.println("책 UPDATE 중 예외 발생");
			e.printStackTrace();
		}
		
		return reselt;
	}
	
	//책 수정
		public void updateVisit(Long id) {
			
			try {
				String query = "UPDATE BOOK_TBL SET VISIT = VISIT + 1 WHERE ID = " + id;
				
				psmt = con.prepareStatement(query);
				psmt.executeUpdate();
				
				System.out.println("("+id+")책을 조회합니다.");
			} catch (Exception e) {
				System.out.println("조회수 UPDATE 중 예외 발생");
				e.printStackTrace();
			}
		}
	
	
	//관리자페이지
	public ArrayList<BookDTO> ManagerBookInfo() {
		ArrayList<BookDTO> books = new ArrayList<BookDTO>();		
		try {
			String query = "SELECT * FROM BOOK_TBL ORDER BY ID";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery(query);

			while (rs.next()) {
				BookDTO dto = new BookDTO(
						rs.getLong(1), 
						rs.getString(2), 
						rs.getString(3), 
						rs.getLong(4) ,
						rs.getString(5), 
						rs.getInt(6), 
						rs.getInt(7), 
						rs.getInt(8), 
						rs.getString(9), 
						rs.getString(10), 
						rs.getInt(11), 
						rs.getString(12), 
						rs.getString(13), 
						rs.getString(14), 
						rs.getString(15), 
						rs.getInt(16), 
						rs.getInt(17), 
						rs.getString(18), 
						rs.getInt(19), 
						rs.getInt(20), 
						rs.getString(21), 
						rs.getDate(22).toLocalDate(), 
						rs.getTimestamp(23).toLocalDateTime(), 
						rs.getTimestamp(24).toLocalDateTime());
				
				books.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}
	public BookDTO ManagerBookInfo(Long ID) {
		BookDTO book = null;		
		try {
			String query = "SELECT * FROM BOOK_TBL WHERE ID = " + ID;
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery(query);

			if (rs.next()) {
				book = new BookDTO(
						rs.getLong(1), 
						rs.getString(2), 
						rs.getString(3), 
						rs.getLong(4) ,
						rs.getString(5), 
						rs.getInt(6), 
						rs.getInt(7), 
						rs.getInt(8), 
						rs.getString(9), 
						rs.getString(10), 
						rs.getInt(11), 
						rs.getString(12), 
						rs.getString(13), 
						rs.getString(14), 
						rs.getString(15), 
						rs.getInt(16), 
						rs.getInt(17), 
						rs.getString(18), 
						rs.getInt(19), 
						rs.getInt(20), 
						rs.getString(21), 
						rs.getDate(22).toLocalDate(), 
						rs.getTimestamp(23).toLocalDateTime(), 
						rs.getTimestamp(24).toLocalDateTime());
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}
	//책 소개 읽어오기
		public BookDTO bookIntroduce(Long bid) {
			BookDTO dto = new BookDTO();
			
			String query = "SELECT TITLE, INTRODUCE, INTRODUCE_IMG, PUBLISHER_REVIEW, CONTENTS, CATCHPHRASE FROM BOOK_TBL";
			if(bid != null) {
				query += " WHERE ID = " + bid + " ";
			}
			query += " ORDER BY ID DESC ";
			
			//System.out.println("작성완료된 쿼리문: \n" + query);
			
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				
				if(rs.next()) {
					dto.setTitle(rs.getString(1));
					dto.setIntroduce(rs.getString(2));
					dto.setIntroduceImg(rs.getString(3));
					dto.setPublisherReview(rs.getString(4));
					dto.setContents(rs.getString(5));
					dto.setCatchphrase(rs.getString(6));
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
	
	public int deleteBook(String idx) {
		int result = 0;
		
		try {
			System.out.println("도서를 삭제하기전, 해당페이지의 댓글을 우선 삭제합니다.");
			String sql = "DELETE FROM book_review_TBL WHERE BOOK_ID = ?";
			psmt = con.prepareStatement(sql);
			psmt.setNString(1, idx);
			result = psmt.executeUpdate();
			System.out.println("해당페이지의 댓글을 전부 삭제했습니다.");
			
			sql = "DELETE FROM BOOK_TBL WHERE ID = ?";
			psmt = con.prepareStatement(sql);
			psmt.setNString(1, idx);
			result = psmt.executeUpdate();
			System.out.println("도서 삭제가 완료되었습니다.");
			
		} catch (Exception e) {
			System.out.println("책 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//리뷰페이지용 메소드
	public BookDTO readBookforReview(Long bId) {
		BookDTO dto = null;
		
		String query = "SELECT ID, TITLE FROM book_TBL WHERE ID = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setLong(1, bId);
			
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new BookDTO();
				
				dto.setId(rs.getLong(1));
				dto.setTitle(rs.getString(2));
			}
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰용 책정보 조회중 오류 발생");
		}
		
		return dto;
	}

	
	public BookDTO paybookinfo(Long id) {
		BookDTO bookdto = null;
		
		try {
			String sql = "SELECT ID, TITLE, PRICE, QUANTITY FROM BOOK_TBL WHERE ID = " + id;
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery(sql);

			System.out.println("sql:"+sql);
			System.out.println("이건되냐?");
			while (rs.next()) {
				bookdto = new BookDTO(
						rs.getLong(1),
						rs.getString(2),
						rs.getInt(3),
						rs.getInt(4));
				System.out.println("책정보 불러옴");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("책정보 불러오는중 오류 발생");
		}
		return bookdto;
	}
}