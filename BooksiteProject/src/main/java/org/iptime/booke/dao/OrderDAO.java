package org.iptime.booke.dao;

import java.util.ArrayList;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.OrderDTO;

public class OrderDAO extends JDBConnect {
	
	public OrderDTO orderDTO(String paymentId) {
		OrderDTO dto = null;
		
		try {
			String sql = "SELECT * FROM ORDER_TBL payment_id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(2, paymentId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new OrderDTO();
				
				dto.setId(rs.getLong(1));
				dto.setPaymentId(rs.getNString(2));
				dto.setBookId(rs.getLong(3));
				dto.setQuantity(rs.getInt(4));
				
				System.out.println("주문내역 조회 성공");
				
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("주문내역 조회 중 오류발생");
		}
		return dto;
	}
	
	public ArrayList<OrderDTO> Orderinfo(Long id){
		ArrayList<OrderDTO> values = new ArrayList<OrderDTO>();
		
		try {
			String sql = " SELECT * FROM ORDER_TBL WHERE MEMBER_ID =" + id;
			psmt =con.prepareStatement(sql);
			rs = psmt.executeQuery(sql);
			
			while(rs.next()) {
				OrderDTO orderDTO = new OrderDTO(rs.getLong(1), rs.getString(2), rs.getLong(3),
						rs.getInt(4), rs.getTimestamp(5).toLocalDateTime());
				
				values.add(orderDTO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return values;
	}

}
