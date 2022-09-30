package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.PaymentDAO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String UserId = (String) session.getAttribute("user_id");
		session.setAttribute("user_id", UserId);
		
		PaymentDAO dao = new PaymentDAO();
		
		MemberDTO delinfo = dao.delinfo((String)session.getAttribute("user_id"));
//		String id = req.getParameter("id");
//		System.out.println(id);
//		MemberDTO dto = dao.payment(id);
		System.out.println(delinfo);
		dao.close();

		req.setAttribute("delinfo", delinfo);
		req.getRequestDispatcher("paymentPage.jsp").forward(req, resp);

		
//		String[] bid = req.getParameterValues("selectedBooks");
//		for (String i : bid) {
//			System.out.println(i);
//		}

	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
