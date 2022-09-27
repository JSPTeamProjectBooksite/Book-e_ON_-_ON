package org.iptime.booke.dao;

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
		
		String query = "SELECT COUNT(*) FROM book_table";
		
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
				+ "		SELECT * FROM book_table ";
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchFeild")
					+ " LIKE '" + map.get("searchWord") + "%'";
		}
		
		query += "		ORDER BY bid DESC "
				+ "	) Tb "
				+ " ) "
				+ " WHERE rNum BETWEEN ? AND ?";
		
		try {
			System.out.println("됐냐?1");
			psmt = con.prepareStatement(query);
			System.out.println("됐냐?2");
			psmt.setString(1, map.get("start").toString());
			System.out.println("됐냐?3");
			psmt.setString(2, map.get("end").toString());
			System.out.println("됐냐?4");
			rs = psmt.executeQuery();
			System.out.println("됐냐?5");
			
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				
				dto.setBid(rs.getLong(1));
				dto.setImage(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAuthor(rs.getString(4));
				dto.setPrice(rs.getLong(6));
				dto.setIntroduce(rs.getString(13));
				dto.setPublisher(rs.getString(15));
				dto.setAd(rs.getString(22));
				
				board.add(dto);
				
				dto.DTOPrintOut();
			}
		}catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
}
