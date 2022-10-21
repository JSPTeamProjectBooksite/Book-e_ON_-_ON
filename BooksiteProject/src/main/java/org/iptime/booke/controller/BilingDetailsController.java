package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dao.OrderDAO;
import org.iptime.booke.dao.PaymentDAO;
import org.iptime.booke.dto.MemberDTO;
import org.iptime.booke.dto.OrderDTO;
import org.iptime.booke.dto.PaymentDTO;

@WebServlet("/orderDetailInfo")
public class BilingDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 

    public BilingDetailsController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인 정보
		HttpSession session = request.getSession();
		Long UserId = (Long)session.getAttribute("LoginID");  
		
		System.out.println("주문자ID: "+UserId);
			
		MemberDAO memberDao = new MemberDAO();
		MemberDTO delinfo = memberDao.userInfo(UserId); 
		memberDao.close();
		
		//결제정보
		String id = request.getParameter("id");
		PaymentDAO paymentDao = new PaymentDAO();
		PaymentDTO orderinfo = paymentDao.orderInfo(id);
		paymentDao.close();
		
		//책정보(bookid, 구매수량)
		
	
	
		
		request.setAttribute("delinfo", delinfo);
		request.setAttribute("orderinfo", orderinfo);
		request.getRequestDispatcher("PaymentDetails.jsp").forward(request, response);
	}

	
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}