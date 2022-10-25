package org.iptime.booke.dao;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.dto.OrderDTO;

public class OrderDAO extends JDBConnect {
	
	public OrderDTO orderDTO(String paymentId) { //오더정보
		OrderDTO dto = null;
		
		try {
			String sql = "SELECT * FROM ORDER_TBL WHERE payment_id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, paymentId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new OrderDTO();
				
				dto.setId(rs.getLong(1));
				dto.setPaymentId(rs.getString(2));
				dto.setBookId(rs.getLong(3));
				dto.setQuantity(rs.getInt(4));
				
				System.out.println("주문내역 조회 성공");
				
//				System.out.println(rs.getLong(1));
//				System.out.println(rs.getString(2));
//				System.out.println(rs.getLong(3));
//				System.out.println(rs.getInt(4));
//				
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("주문내역 조회 중 오류발생");
		}
		return dto;
	}
	
	public List<Map<String, Object>> orderdetailinfo(String id){  //주문상세정보
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		try {
			String sql = "SELECT * FROM ORDER_TBL WHERE PAYMENT_ID = '" + id + "' ORDER BY ID DESC";
			System.out.println("sql:"+sql);
			
			psmt =con.prepareStatement(sql);
			rs = psmt.executeQuery(sql);
			
			System.out.println("order이거나오니");
			
			BookDAO bdao = new BookDAO();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				OrderDTO orderDTO = new OrderDTO();
				
				orderDTO.setId(rs.getLong(1));
				orderDTO.setPaymentId(rs.getString(2));
				orderDTO.setBookId(rs.getLong(3));
				orderDTO.setQuantity(rs.getInt(4));
				orderDTO.setRegisterDate(new Timestamp(rs.getDate(5).getTime()).toLocalDateTime());
				
				BookDTO bdto = bdao.paybookinfo(orderDTO.getBookId());
				
				map.put("order", orderDTO);
				map.put("book", bdto);
				
				result.add(map);
			}
			bdao.close();
			
		
		}catch (Exception e) {
			System.out.println("주문 상세 내역 불러오는중 오류 발생함까륵");
			e.printStackTrace();
		}
		return result;
	}
	
	public void sendOrder(OrderDTO order) {
		String query = "INSERT INTO ORDER_TBL (id, payment_id, book_id, quantity) VALUES (order_SEQ.nextval, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, order.getPaymentId());
			psmt.setLong(2, order.getBookId());
			psmt.setInt(3, order.getQuantity());
			psmt.executeUpdate();
			
			
			System.out.println("주문 전송 완료");
		} catch (Exception e) {
			System.out.println("주문 전송 중 오류 발생");
			e.printStackTrace();
		}
	}
	
//	public static void main(String[] args) {
//		OrderDAO dao = new OrderDAO();
//		dao.orderinfo(1L);
//	}
}
