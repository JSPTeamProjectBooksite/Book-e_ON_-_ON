package org.iptime.booke.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dao.OrderDAO;
import org.iptime.booke.dto.OrderDTO;


@WebServlet("/OrderController")
public class BillinghistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    public BillinghistoryController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		System.out.println(id);
		
		OrderDAO odao = new OrderDAO();
		BookDAO bdao = new BookDAO();
		
		//주문 정보 가져옴
		List<OrderDTO> orderList = odao.orderdetailinfo(id);
		List<OrderDTO> bookList = bdao.
		

		
		for(int i=0; i<orderList.size();i++) {
			
			Long bookId = orderList.get(i).getBookId();
			bookList[i] = bdao.readBookforReview(bookId).getTitle();
			
			System.out.println(bookList[i]);
			
		}
		
		
		
		Long Id = orderList.get(1).getBookId();
		System.out.println(Id);
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("bookList", bookList);
		request.getRequestDispatcher("./PaymentList.jsp").forward(request, response);
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
