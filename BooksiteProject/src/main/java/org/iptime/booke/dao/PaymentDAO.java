package org.iptime.booke.dao;

//<<<<<<< Updated upstream
import java.util.ArrayList;
import java.util.List;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.PaymentDTO;


public class PaymentDAO extends JDBConnect {
	// 사용자 받아오는 메소드
	public PaymentDTO delinfo(String email) {
		PaymentDTO dto = new PaymentDTO();
		try {
			
			String sql = "SELECT * " + "FROM member_TBL " + "WHERE EMAIL = ? ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();

			if (rs.next()) {
				PaymentDTO delinfo = new PaymentDTO(rs.getString(1), rs.getString(2),rs.getString(3), rs.getString(4));
//=======
//import org.iptime.booke.common.JDBConnect;
//import org.iptime.booke.dto.MemberDTO;
//
//public class PaymentDAO extends JDBConnect {
//
//	public MemberDTO delinfo(String id) {
//		MemberDTO dto = new MemberDTO();
//		try {
//			
//			String sql = "SELECT NAME, ID, PHONENUMBER, ADDRESS " + "FROM TBL_USER " + "WHERE ID = ? ";
//			
//			psmt = con.prepareStatement(sql);
//			psmt.setString(1, id);
//			rs = psmt.executeQuery();
//
//			if (rs.next()) {
//				MemberDTO delinfo = new MemberDTO(rs.getString(1), rs.getString(2),
//>>>>>>> Stashed changes
						
				return delinfo;
			}
		} catch (Exception e) {
			System.out.println("Member정보 조회 중 오류발생");
			e.printStackTrace();
		}
		return null;

	}
	//책 반환
	public List<PaymentDTO> prodinfo(String[] id, String[] select) {
		List<PaymentDTO> booklist = new ArrayList<PaymentDTO>();
		
		String sql = "SELECT * " + "FROM book_TBL " + "WHERE ID = ? ";
		
		for(int i = 0; i < id.length; i++) { //{"1","2","3","4"};
			
			Long idNum = Long.parseLong(id[i]); //1L
			
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setLong(1, idNum);
				rs = psmt.executeQuery();
				
				PaymentDTO dto = new PaymentDTO();
				
				if(rs.next()) {
					
					System.out.println("rs값 있음");
					
					dto.setId(rs.getLong(1));
					dto.setCoverImg(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setPrice(rs.getInt(6));
					dto.setBookCategoryId(rs.getInt(13));
					
					dto.setQuantity((Integer.parseInt(select[i])));//{"1","1","4","5"} (select)));
					
				}

				
//				dto.DTOPrintOut2();
				booklist.add(dto);
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("paymentDAO에서 오류발생");
			}
		}
		
		
		return booklist;
	}
}
