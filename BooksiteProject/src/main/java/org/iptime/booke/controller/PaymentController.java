package org.iptime.booke.controller;

import java.io.IOException;
//<<<<<<< Updated upstream
import java.util.List;
//=======
//>>>>>>> Stashed changes

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.PaymentDAO;
//<<<<<<< Updated upstream
import org.iptime.booke.dto.PaymentDTO;
//=======
//import org.iptime.booke.dto.MemberDTO;
//>>>>>>> Stashed changes

@WebServlet("/payment")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String UserId = (String) session.getAttribute("user_id");
		session.setAttribute("user_id", UserId);
		
		PaymentDAO dao = new PaymentDAO();
//<<<<<<< Updated upstream
		//유저
		PaymentDTO delinfo = dao.delinfo((String)session.getAttribute("email"));
		System.out.println("로그인 아이디 : " + (String)session.getAttribute("email"));
//		String id = req.getParameter("id");
//		System.out.println(id);
//		MemberDTO dto = dao.payment(id);
		System.out.println(delinfo);
		
		//책
		String[] id = req.getParameterValues("selectedBooks"); //{"1","2","3","4"} (bid)
		String[] select = req.getParameterValues("bookCount"); //{"1","1","4","5"} (select)
		
		List<PaymentDTO> prodinfo = dao.prodinfo(id, select);
		dao.close();
		
		

		req.setAttribute("delinfo", delinfo); // 유저정보
		req.setAttribute("prodinfo", prodinfo); // 도서 선택 정보
		
		
		req.getRequestDispatcher("paymentPage.jsp").forward(req, resp);

//=======
//		
//		MemberDTO delinfo = dao.delinfo((String)session.getAttribute("user_id"));
////		String id = req.getParameter("id");
////		System.out.println(id);
////		MemberDTO dto = dao.payment(id);
//		System.out.println(delinfo);
//		dao.close();
//
//		req.setAttribute("delinfo", delinfo);
//		req.getRequestDispatcher("paymentPage.jsp").forward(req, resp);
//
//>>>>>>> Stashed changes
		
//		String[] bid = req.getParameterValues("selectedBooks");
//		for (String i : bid) {
//			System.out.println(i);
//		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
