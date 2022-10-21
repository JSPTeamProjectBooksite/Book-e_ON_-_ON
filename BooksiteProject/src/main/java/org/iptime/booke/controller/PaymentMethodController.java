package org.iptime.booke.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dao.OrderDAO;
import org.iptime.booke.dao.PaymentDAO;
import org.iptime.booke.dto.OrderDTO;
import org.iptime.booke.dto.PaymentDTO;

@WebServlet("/payment.do")
public class PaymentMethodController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentMethodController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String memberId = request.getParameter("memberId");
		String[] bookId = request.getParameterValues("bookId");
		String[] selectCount = request.getParameterValues("selectCount");
		String paymentMethod = request.getParameter("paymentMethod");
		String[] deliveryTotalPointFinal = request.getParameter("DTPF").split(",");
		
		BookDAO bdao = new BookDAO();
		System.out.println("수량확인");
		Map<String, Object> stateMap = bdao.checkQuantity(bookId, selectCount);
		bdao.close();
		
		if(stateMap != null) {
			request.setAttribute("map", stateMap);
			request.getRequestDispatcher("ERRORPAGE.jsp").forward(request, response);
			return;
		}
		
//		System.out.println(memberId);
//		System.out.println(Arrays.toString(bookId));
//		System.out.println(Arrays.toString(selectCount));
//		System.out.println(paymentMethod);
//		System.out.println(Arrays.toString(deliveryTotalPointFinal));
		
		PaymentDAO paymentDao = new PaymentDAO();
		PaymentDTO paymentDto = new PaymentDTO();
//		System.out.println(paymentDao.makePaymentId());
		
		String paymentId = paymentDao.makePaymentId();
		
		paymentDto.setId(paymentId);
		paymentDto.setMemberId(Long.parseLong(memberId));
		paymentDto.setTotalAmount(Integer.parseInt(deliveryTotalPointFinal[1]));
		paymentDto.setPointAmount(Integer.parseInt(deliveryTotalPointFinal[2]));
		paymentDto.setActualAmount(Integer.parseInt(deliveryTotalPointFinal[3]));
		paymentDto.setShippingState("배송준비중");
		paymentDto.setPaymentMethod(paymentMethod);
		paymentDto.setShippingMessage("이상없음");
		
		paymentDao.OrderDetails(paymentDto);
		
		OrderDAO orderDao = new OrderDAO();
		for(int i = 0; i < bookId.length; i++) {
			OrderDTO orderDto = new OrderDTO();
			
			orderDto.setPaymentId(paymentId);
			orderDto.setBookId(Long.parseLong(bookId[i]));
			orderDto.setQuantity(Integer.parseInt(selectCount[i]));
			
			orderDao.sendOrder(orderDto);
			System.out.println("주문 내역 "+(i+1)+"개 등록함");
		}
		
		request.getRequestDispatcher("/SuccessOrder.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
