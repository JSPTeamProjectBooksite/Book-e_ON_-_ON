package org.iptime.booke.dao;

import java.util.ArrayList;
import java.util.List;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.BookDTO;

public class MainPageDAO extends DBConnPool {
	public MainPageDAO() {
		super();
	}
	
	public List<BookDTO> selectPopularList(long[] popbid){
		List<BookDTO> booklist = new ArrayList<>();
		
		String query = "SELECT BID, IMAGE, TITLE, AUTHOR " + "FROM BOOK_TABLE " + "WHERE BID = ? ";
		
		for(long l : popbid) {
			try {
				psmt = con.prepareStatement(query);
				psmt.setLong(1, l);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					BookDTO dto = new BookDTO();
					
					dto.setId(rs.getLong(1));
					dto.setImage(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setAuthor(rs.getString(4));
					
					booklist.add(dto);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("메인 인기항목 부럴오는 중 오류발생");
				e.printStackTrace();
			}
		}
		
		return booklist;
	}
}
