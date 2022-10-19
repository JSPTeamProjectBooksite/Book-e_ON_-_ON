package org.iptime.booke.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.dto.BookReviewDTO;
import org.iptime.booke.dto.MemberDTO;

public class BookReviewDAO extends DBConnPool {
	//리뷰조회 메서드(디테일 사용중)
	public BookReviewDTO readReview(Long bid) {
		BookReviewDTO review = null;
		
		String query = "SELECT * FROM book_review_TBL WHERE BOOK_ID = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setLong(1, bid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				review = new BookReviewDTO(
						rs.getLong(1),
						rs.getLong(2),
						rs.getLong(3),
						rs.getShort(4),
						rs.getString(5),
						rs.getInt(6),
						new Timestamp(rs.getDate(7).getTime()).toLocalDateTime()
						);
				
				System.out.println("("+bid+")리뷰 불러옴");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 불러오는중 오류발생");
		}
		
		return review;
	}
	
	//리뷰작성 메서드(디테일 사용중)
	public boolean likeReview(Long reviewID){
		if(reviewID == null) {
			System.out.println("좋아요를 누를 리뷰 아이디가 null입니다.");
			return false;
		}
		
		boolean result = false;
		
		String query = "UPDATE BOOK_REVIEW_TBL SET LIKE_CNT = LIKE_CNT + 1 WHERE ID = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setLong(1, reviewID);
			psmt.executeUpdate();
			
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("좋아요 하는중 오류발생");
		}
		
		return result;
	}

	//좋아요 메서드(디테일 사용중)
	public boolean writeReview(Long bookID, Long memberID, int score,String comment){
		boolean result = false;
		
		String query = "INSERT INTO BOOK_REVIEW_TBL(ID, MEMBER_ID, BOOK_ID, SCORE, CONTENT) VALUES(BOOK_REVIEW_SEQ.nextval, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setLong(1, memberID);
			psmt.setLong(2, bookID);
			psmt.setInt(3, score);
			psmt.setString(4, comment);
			psmt.executeUpdate();
			
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 작성중 오류발생");
		}
		
		return result;
	}

	/**유저와 책정보를 모두 받는 메서드
	 * 
	 * @param bid
	 * @return
	 */
	public List<Map<String, Object>> detailReview(Long bid) {
		List<Map<String, Object>> reviewList = new ArrayList<Map<String,Object>>();
		
		String query = "SELECT * FROM book_review_TBL WHERE BOOK_ID = ? ORDER BY REGISTER_DATE DESC";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setLong(1, bid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> reviewMap = new HashMap<String, Object>();
				BookReviewDTO reviewDTO = new BookReviewDTO(
						rs.getLong(1),
						rs.getLong(2),
						rs.getLong(3),
						rs.getShort(4),
						rs.getString(5),
						rs.getInt(6),
						new Timestamp(rs.getDate(7).getTime()).toLocalDateTime()
						);
				
				BookDAO bookDAO = new BookDAO();
				BookDTO bookDTO = bookDAO.readBookforReview(reviewDTO.getBookId());
				bookDAO.close();
				
				MemberDAO memberDAO = new MemberDAO();
				MemberDTO memberDTO = memberDAO.readMemberForReview(reviewDTO.getMemberId());
				memberDAO.close();
				
				//키 이름에 맞게 DTO 저장
				reviewMap.put("review", reviewDTO);
				reviewMap.put("book", bookDTO);
				reviewMap.put("member", memberDTO);
				
				reviewList.add(reviewMap);
			}
			System.out.println("도서("+bid+")의 모든 리뷰 불러옴");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 불러오는중 오류발생");
		}
		
		
		return reviewList;
	}
}
