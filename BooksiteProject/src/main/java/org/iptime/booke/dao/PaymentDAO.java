package org.iptime.booke.dao;

//<<<<<<< Updated upstream
import java.util.ArrayList;
import java.util.List;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.PaymentDTO;

public class PaymentDAO extends JDBConnect {
//	// 사용자 받아오는 메소드
//	public PaymentDTO delinfo(L) {
//		PaymentDTO dto = null
//				
//				
//				
//		try {
//			
//			String sql = "SELECT * " + "FROM member_TBL " + "WHERE EMAIL = ? ";
//			
//			psmt = con.prepareStatement(sql);
//			psmt.setString(1, email);
//			rs = psmt.executeQuery();
//
//			if (rs.next()) {
//				
//				
//						
//				return delinfo;
//			}
//		} catch (Exception e) {
//			System.out.println("Member정보 조회 중 오류발생");
//			e.printStackTrace();
//		}
//		return null;
//
//	}
	// 책 반환
	public List<PaymentDTO> prodinfo(String[] id, String[] select) {
		List<PaymentDTO> booklist = new ArrayList<PaymentDTO>();

		String sql = "SELECT * " + "FROM book_TBL " + "WHERE ID = ? ";

		for (int i = 0; i < id.length; i++) { // {"1","2","3","4"};

			Long idNum = Long.parseLong(id[i]); // 1L

			try {
				psmt = con.prepareStatement(sql);
				psmt.setLong(1, idNum);
				rs = psmt.executeQuery();

				PaymentDTO dto = new PaymentDTO();

				if (rs.next()) {

					System.out.println("rs값 있음");

					dto.setId(rs.getLong(1));
					dto.setCoverImg(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setPrice(rs.getInt(6));
					dto.setBookCategoryId(rs.getInt(13));

					dto.setQuantity((Integer.parseInt(select[i])));// {"1","1","4","5"} (select)));

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

	public int OrderDetails(PaymentDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO payment_TBL("
					+ "ID, MEMBER_ID, BOOK_ID, TOTAL_AMOUNT, POINT_AMOUNT, ACTUAL_AMOUNT, SHIPPING_STATE, PAYMENT_METHOD, SHIPPING_MESSAGE) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, "2022101701");
			psmt.setLong(2, dto.getMemberId());
			psmt.setLong(3, dto.getBookId());
			psmt.setLong(4, dto.getTotalAmount());
			psmt.setLong(5, dto.getPointAmount());
			psmt.setLong(6, dto.getActualAmount());
			psmt.setString(7, dto.getShippingState());
			psmt.setString(8, dto.getPaymentMethod());
			psmt.setString(9, dto.getShippingMessage());
			result = psmt.executeUpdate();
			
			System.out.println("주문상세내역 저장 성공");
			
			} catch (Exception e) {
				System.out.println("문의 등록 중 예외 발생");
				e.printStackTrace();
			}
			return result;
	}
			
			
		}

