package org.iptime.booke.dao;


import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.AuthorDTO;
import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.dto.MemberDTO;

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
	//책 읽어오기
	//메인 페이지
	//인기도서 읽어오기
	public List<Map<String, Object>> selectPopularList(long[] popbid){
		List<Map<String, Object>> booklist = new ArrayList<>();
		
		String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID " + "FROM BOOK_TBL " + "WHERE ID = ? ";
		
		for(long l : popbid) {
			try {
				psmt = con.prepareStatement(query);
				psmt.setLong(1, l);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
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
	
	
	//BookAddController
	//책 추가
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
	
	public ArrayList<Map<String, Object>> ManagerBookInfo(String list) {
		ArrayList<Map<String, Object>> values = new ArrayList<Map<String, Object>>();		
		try {

			String query = "SELECT * FROM BOOK_TBL bt, AUTHOR_TBL at2 WHERE bt.AUTHOR_ID = at2.MEMBER_ID";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery(query);

			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
	
				BookDTO bookDto = new BookDTO(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getLong(4) ,rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getLong(9), rs.getLong(10), rs.getInt(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getInt(16), rs.getInt(17), rs.getString(18), rs.getInt(19), rs.getInt(20), rs.getString(21), rs.getTimestamp(22).toLocalDateTime(), rs.getTimestamp(23).toLocalDateTime(), rs.getTimestamp(24).toLocalDateTime());
				
//				String memberState = rs.getString(13);

				map.put("memberDto", bookDto);
//				map.put("memberState", memberState);
				
				values.add(map);
				
				System.out.println(rs.getLong(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return values;
	}
	
	public static void main(String[] args) {
		BookDAO dao = new BookDAO();
		dao.ManagerBookInfo("");
	}
}
