package org.iptime.booke.dao;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.OrderDTO;

public class OrderDAO extends DBConnPool {
	
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
}
