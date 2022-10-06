package org.iptime.booke.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.dto.MemberDTO;

public class PaymentDAO extends JDBConnect {
	// 사용자 받아오는 메소드
	public MemberDTO delinfo(String email) {
		MemberDTO dto = new MemberDTO();
		try {
			
			String sql = "SELECT NAME, EMAIL, PHONE_NUM, ADDRESS " + "FROM MEMBER_TBL " + "WHERE EMAIL = ? ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, email);
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
	public List<BookDTO> prodinfo(String[] id) {
		List<BookDTO> booklist = new ArrayList<BookDTO>();
		
		String sql = "SELECT * " + "FROM BOOK_TBL " + "WHERE ID = ? ";
		
		for(int i = 0; i < id.length; i++) { //{"1","2","3","4"};
			
			Long idNum = Long.parseLong(id[i]); //1L
			
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setLong(1, idNum);
				rs = psmt.executeQuery();
				
				BookDTO dto = new BookDTO();
				
				if(rs.next()) {
					
					System.out.println("rs값 있음");
					
					dto.setId(rs.getLong(1));
					dto.setCoverImg(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setPrice(rs.getInt(6));
					dto.setBookCategoryId(rs.getInt(13));
					dto.setQuantity(rs.getInt(20));
					
//					dto.setSelect(Integer.parseInt(select[i]));//{"1","1","4","5"} (select)
					
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
