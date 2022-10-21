package org.iptime.booke.dao;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.PaymentDTO;

public class PaymentDAO extends JDBConnect {
//	public List<PaymentDTO> prodinfo(String[] id, String[] select) {
//		List<PaymentDTO> booklist = new ArrayList<PaymentDTO>();
//
//		String sql = "SELECT * " + "FROM book_TBL " + "WHERE ID = ? ";
//
//		for (int i = 0; i < id.length; i++) { // {"1","2","3","4"};
//
//			Long idNum = Long.parseLong(id[i]); // 1L
//
//			try {
//				psmt = con.prepareStatement(sql);
//				psmt.setLong(1, idNum);
//				rs = psmt.executeQuery();
//
//				PaymentDTO dto = new PaymentDTO();
//
//				if (rs.next()) {
//
//					System.out.println("rs값 있음");
//
//					dto.setId(rs.getLong(1));
//					dto.setCoverImg(rs.getString(2));
//					dto.setTitle(rs.getString(3));
//					dto.setPrice(rs.getInt(6));
//					dto.setBookCategoryId(rs.getInt(13));
//
//					dto.setQuantity((Integer.parseInt(select[i])));// {"1","1","4","5"} (select)));
//
//				}
//
////				dto.DTOPrintOut2();
//				booklist.add(dto);
//
//			} catch (Exception e) {
//				e.printStackTrace();
//				System.out.println("paymentDAO에서 오류발생");
//			}
//		}
//
//		return booklist;
//	}
	
	public String makePaymentId() {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
		
		String result = "B"+now.format(formatter);
		
//		System.out.println(result);

		try {
			String query = "SELECT ID FROM payment_TBL WHERE ID LIKE '"+ result +"%' ORDER BY ID DESC";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
//				System.out.println(rs.getString(1));
//				System.out.println(rs.getString(1).substring(7));
				int num = Integer.parseInt(rs.getString(1).substring(7));
				
				result += String.format("%05d", num+1);
			}else {
				result += String.format("%05d", 1);
			}

			System.out.println("생성된 paymentID : " + result);
		} catch (Exception e) {
			System.out.println("paymentID 생성 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	

	public int OrderDetails(PaymentDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO payment_TBL("
					+ "ID, MEMBER_ID, TOTAL_AMOUNT, POINT_AMOUNT, ACTUAL_AMOUNT, SHIPPING_STATE, PAYMENT_METHOD, SHIPPING_MESSAGE) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setLong(2, dto.getMemberId());
			psmt.setLong(3, dto.getTotalAmount());
			psmt.setLong(4, dto.getPointAmount());
			psmt.setLong(5, dto.getActualAmount());
			psmt.setString(6, dto.getShippingState());
			psmt.setString(7, dto.getPaymentMethod());
			psmt.setString(8, dto.getShippingMessage());
			result = psmt.executeUpdate();

			System.out.println("주문상세내역 저장 성공");

		} catch (Exception e) {
			System.out.println("주문상세내역 등록 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public PaymentDTO orderInfo(String id) {
		PaymentDTO dto = null;
		
		try {
			String sql = "SELECT * FROM PAYMENT_TBL WHERE ID = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			System.out.println("이거 나오냐?");
			if(rs.next()) {
				dto = new PaymentDTO();
				
				dto.setId(rs.getString(1));
				dto.setMemberId(rs.getLong(2));
				dto.setTotalAmount(rs.getInt(3));
				dto.setPointAmount(rs.getInt(4));
				dto.setActualAmount(rs.getInt(5));
				dto.setShippingState(rs.getString(6));
				dto.setPaymentMethod(rs.getString(7));
				dto.setShippingMessage(rs.getString(8));
				dto.setRegisterDate(new Timestamp(rs.getDate(9).getTime()).toLocalDateTime());
				
				System.out.println("상세 주문정보 조회 성공");
			}
		}
		 catch (Exception e) {
			 System.out.println("상세주문 정보 조회 중 오류발생");
			e.printStackTrace();
		}
		return dto;
	}

	public List<PaymentDTO> paymentInfo(Long id) {
		List<PaymentDTO> dtoList = new ArrayList<PaymentDTO>();
		
		try {
			String sql = "SELECT * FROM PAYMENT_TBL WHERE MEMBER_ID = " + id + " ORDER BY ID DESC";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				PaymentDTO dto = new PaymentDTO();
				
				dto.setId(rs.getString(1));
				dto.setMemberId(rs.getLong(2));
				dto.setTotalAmount(rs.getInt(3));
				dto.setPointAmount(rs.getInt(4));
				dto.setActualAmount(rs.getInt(5));
				dto.setShippingState(rs.getString(6));
				dto.setPaymentMethod(rs.getString(7));
				dto.setShippingMessage(rs.getString(8));
				dto.setRegisterDate(new Timestamp(rs.getDate(9).getTime()).toLocalDateTime());
				
				System.out.println("상세 주문정보 조회 성공");
				dtoList.add(dto);
			}
		}
		 catch (Exception e) {
			e.printStackTrace();
			System.out.println("상세주문 정보 조회 중 오류발생");
		}
		return dtoList;
	}
}
