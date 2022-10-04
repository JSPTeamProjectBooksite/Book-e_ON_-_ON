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
import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String UserId = (String) session.getAttribute("user_id");
		session.setAttribute("user_id", UserId);
		
		PaymentDAO dao = new PaymentDAO();
		//유저
		MemberDTO delinfo = dao.delinfo((String)session.getAttribute("user_id"));
//		String id = req.getParameter("id");
//		System.out.println(id);
//		MemberDTO dto = dao.payment(id);
		System.out.println(delinfo);
		
		//책
		String[] bid = req.getParameterValues("selectedBooks"); //{"1","2","3","4"} (bid)
		String[] select = req.getParameterValues("bookCount"); //{"1","1","4","5"} (select)
		
		List<BookDTO> prodinfo = dao.prodinfo(bid, select);
		dao.close();
		
		

		req.setAttribute("delinfo", delinfo); // 유저정보
		req.setAttribute("prodinfo", prodinfo); // 도서 선택 정보
		
		
		req.getRequestDispatcher("paymentPage.jsp").forward(req, resp);

		
//		String[] bid = req.getParameterValues("selectedBooks"); //{"1","2","3","4"} (bid)
//		for (String i : bid) {
//			System.out.println(i);
//		}
//		String[] select = req.getParameterValues("bookCount"); //{"1","1","4","5"} (select)
//		for (String i : select) {
//			System.out.println(i);
//		}
		
		

	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
