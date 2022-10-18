package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.PaymentDAO;
import org.iptime.booke.dto.PaymentDTO;

@WebServlet("/OrderDetailsController")
public class OrderDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderDetailsController() {
   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String orderId = request.getParameter("id");
		String orderMemberId = request.getParameter("memberid");
		String orderBookId = request.getParameter("bookid");
		String orderTotalAmount = request.getParameter("totalamount");
		String orderPointAmount = request.getParameter("pointamount");
		String orderActualAmoun = request.getParameter("actualamount");
		String orderShippingState = request.getParameter("shippingstate");
		String orderPaymentMethod = request.getParameter("paymentmethod");
		String orderShippingMessage = request.getParameter("shippingmessage");
		
		System.out.println(orderId);
		System.out.println(orderMemberId);
		System.out.println(orderBookId);
		System.out.println(orderTotalAmount);
		System.out.println(orderPointAmount);
		System.out.println(orderActualAmoun);
		System.out.println(orderShippingState);
		System.out.println(orderPaymentMethod);
		System.out.println(orderPaymentMethod);
		
		PaymentDTO paymentDTO = new PaymentDTO();
		paymentDTO.setId(orderId);
		paymentDTO.setMemberId(null);
		paymentDTO.setMemberId(null);
		paymentDTO.setTotalAmount(null);
		paymentDTO.setPointAmount(null);
		paymentDTO.setActualAmount(null);
		paymentDTO.setShippingState(orderShippingState);
		paymentDTO.setPaymentMethod(orderPaymentMethod);
		paymentDTO.setShippingMessage(orderShippingMessage);
		
		
		PaymentDAO dao = new PaymentDAO();
		int iResult = dao.OrderDetails(paymentDTO);
		dao.close();
		
		if(iResult ==1) {
			System.out.println("등록완료");
			response.sendRedirect("./main");
			return;
		}
		System.out.println("등록실패");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
