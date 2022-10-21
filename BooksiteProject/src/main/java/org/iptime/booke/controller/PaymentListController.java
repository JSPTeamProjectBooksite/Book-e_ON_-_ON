package org.iptime.booke.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.PaymentDAO;
import org.iptime.booke.dto.PaymentDTO;


@WebServlet("/payment/list")
public class PaymentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    public PaymentListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		
		Long id = (Long)session.getAttribute("LoginID");
		
		System.out.println("주문목록을 요청한 아이디 : "+id);
		
		List<PaymentDTO> paymentList = null;
		
		//로그인 한 경우
		if(id != null) {
			PaymentDAO pdao = new PaymentDAO();
			paymentList = pdao.paymentInfo(id);
			pdao.close();
		}
		request.setAttribute("paymentList", paymentList);
		request.getRequestDispatcher("/PaymentList.jsp").forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
