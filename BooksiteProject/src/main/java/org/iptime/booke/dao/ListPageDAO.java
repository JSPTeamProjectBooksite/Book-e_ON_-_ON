package org.iptime.booke.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.BookDTO;

public class ListPageDAO extends DBConnPool{
	public ListPageDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM BOOK_TBL";
		
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" +map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1); //검색된 게시물 개수 저장
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("검색페이지 책검색 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount; //게시물 개수를 서블릿으로 반환
	}
	
	// 검색도서 목록 반환
	public List<BookDTO> selectListPage(Map<String, Object> map){
		List<BookDTO> board = new Vector<BookDTO>();
		
		String query = " "
				+ "SELECT * FROM ( "
				+ "	SELECT Tb.*, ROWNUM rNum FROM ( "
				+ "		SELECT * FROM BOOK_TBL ";
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchFeild")
					+ " LIKE '" + map.get("searchWord") + "%'";
		}
		
		query += "		ORDER BY ID DESC "
				+ "	) Tb "
				+ " ) "
				+ " WHERE rNum BETWEEN ? AND ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				
				dto.setId(rs.getLong(1));
				dto.setCoverImg(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAuthorId(rs.getLong(4));
				dto.setCatchphrase(rs.getString(21));
				
				board.add(dto);
				
//				dto.DTOPrintOut();
			}
		}catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	// 검색도서 목록 반환
		public List<Map<String, Object>> searchBookTotal(String searchWord, List<Long> authorList){
			List<Map<String, Object>> board = new Vector<Map<String, Object>>();
			
			String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID, TRANSLATOR, PRICE, book_category_id, PUBLISHER, CATCHPHRASE  FROM BOOK_TBL ";
			if(searchWord != null) {
				query += " WHERE QUANTITY >= 0 AND TITLE LIKE '%" + searchWord + "%'";
			}
			
			
			if(authorList != null && authorList.size() != 0) {
				for(Long ID : authorList) {
					query += " OR AUTHOR_ID = " + ID;
				}
			}
			
			System.out.println(query);
			
			try {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					Map<String, Object> map = new HashMap<String, Object>();
					
					BookDTO dto = new BookDTO();
					
					dto.setId(rs.getLong(1));
					dto.setCoverImg(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setAuthorId(rs.getLong(4));
					if (rs.getString(5) != null) {
						dto.setTranslator(rs.getString(5)+" | ");
					}
					dto.setPrice(rs.getInt(6));
					dto.setBookCategoryId(rs.getInt(7));
					dto.setPublisher(rs.getString(8));
					dto.setCatchphrase(rs.getString(9));
					
					AuthorDAO authorDao = new AuthorDAO();
					
					map.put("book", dto);
					map.put("author", authorDao.findAuthor(dto.getAuthorId()).getName());
					authorDao.close();
					
					
					board.add(map);
					
				}
			}catch (Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			return board;
		}
	
	// 검색도서 목록 반환
	public List<Map<String, Object>> searchBookForTitle(String searchWord){
		List<Map<String, Object>> board = new Vector<Map<String, Object>>();
		
		String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID, TRANSLATOR, PRICE, book_category_id, PUBLISHER, CATCHPHRASE  FROM BOOK_TBL ";
		if(searchWord != null) {
			query += " WHERE TITLE LIKE '%" + searchWord + "%'";
		}
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				
				BookDTO dto = new BookDTO();
				
				dto.setId(rs.getLong(1));
				dto.setCoverImg(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAuthorId(rs.getLong(4));
				if (rs.getString(5) != null) {
					dto.setTranslator(rs.getString(5)+" | ");
				}
				dto.setPrice(rs.getInt(6));
				dto.setBookCategoryId(rs.getInt(7));
				dto.setPublisher(rs.getString(8));
				dto.setCatchphrase(rs.getString(9));
				
				AuthorDAO authorDao = new AuthorDAO();
				
				map.put("book", dto);
				map.put("author", authorDao.findAuthor(dto.getAuthorId()).getName());
				authorDao.close();
				
				
				board.add(map);
				
			}
		}catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	// 검색도서 목록 반환
		public List<Long> searchAuthorForName(String searchWord){
			List<Long> board = new Vector<Long>();
			
			String query = "SELECT ID FROM AUTHOR_TBL ";
			if(searchWord != null) {
				query += " WHERE NAME LIKE '%" + searchWord + "%'";
			}
			
			try {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					board.add(rs.getLong(1));
				}
			}catch (Exception e) {
				System.out.println("작가조회 중 예외 발생");
				e.printStackTrace();
			}
			return board;
		}
	
	// 검색도서 목록 반환
	public List<Map<String, Object>> searchBookForAuthor(List<Long> authorList){
		List<Map<String, Object>> board = new Vector<Map<String, Object>>();
		
		String query = "SELECT ID, COVER_IMG, TITLE, AUTHOR_ID, TRANSLATOR, PRICE, book_category_id, PUBLISHER, CATCHPHRASE  FROM BOOK_TBL WHERE";
		
		boolean tem = false;
		
		if(authorList != null && authorList.size() != 0) {
			for(Long ID : authorList) {
				if(tem) query += " OR";
				
				query += " AUTHOR_ID = " + ID;
				tem = true;
			}
		}
		
		if(tem) {
			try {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					Map<String, Object> map = new HashMap<String, Object>();
					
					BookDTO dto = new BookDTO();
					
					dto.setId(rs.getLong(1));
					dto.setCoverImg(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setAuthorId(rs.getLong(4));
					if (rs.getString(5) != null) {
						dto.setTranslator(rs.getString(5)+" | ");
					}
					dto.setPrice(rs.getInt(6));
					dto.setBookCategoryId(rs.getInt(7));
					dto.setPublisher(rs.getString(8));
					dto.setCatchphrase(rs.getString(9));
					
					AuthorDAO authorDao = new AuthorDAO();
					
					map.put("book", dto);
					map.put("author", authorDao.findAuthor(dto.getAuthorId()).getName());
					authorDao.close();
					
					board.add(map);
				}
			}catch (Exception e) {
				System.out.println("작가아이디로 조회 중 예외 발생");
				e.printStackTrace();
			}
		}
		return board;
	}
}
