package org.iptime.booke.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.dto.MemberDTO;

public class PaymentDAO extends JDBConnect {
	// 사용자 받아오는 메소드
	public MemberDTO delinfo(String id) {
		MemberDTO dto = new MemberDTO();
		try {
			
			String sql = "SELECT NAME, ID, PHONENUMBER, ADDRESS " + "FROM TBL_USER " + "WHERE ID = ? ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				MemberDTO delinfo = new MemberDTO(rs.getString(1), rs.getString(2),
						rs.getString(3), rs.getString(4));
				return delinfo;
			}
		} catch (Exception e) {
			System.out.println("Member정보 조회 중 오류발생");
			e.printStackTrace();
		}
		return null;

	}
	//책 반환
	public List<BookDTO> prodinfo(String[] bid, String[] select) {
		List<BookDTO> booklist = new ArrayList<BookDTO>();
		
		String sql = "SELECT * " + "FROM BOOK_TABLE " + "WHERE BID = ? ";
		
		for(int i = 0; i < bid.length; i++) { //{"1","2","3","4"};
			
			Long bidNum = Long.parseLong(bid[i]); //1L
			
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setLong(1, bidNum);
				rs = psmt.executeQuery();
				
				BookDTO dto = new BookDTO();
				
				if(rs.next()) {
					
					System.out.println("rs값 있음");
					
					dto.setBid(rs.getLong(1));
					dto.setImage(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setPrice(rs.getLong(6));
					dto.setBookCategoryId(rs.getString(12));
					
					dto.setSelect(Integer.parseInt(select[i]));//{"1","1","4","5"} (select)
					
				}

				
				dto.DTOPrintOut2();
				booklist.add(dto);
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("paymentDAO에서 오류발생");
			}
		}
		
		
		return booklist;
	}
}
