package org.iptime.booke.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.PaymentDAO;
import org.iptime.booke.dto.MemberDTO;


@WebServlet("/payment")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PaymentDAO dao = new PaymentDAO();
		String id = req.getParameter("id");
		System.out.println(id);
		MemberDTO dto = dao.payment(id);
		dao.close();
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("paymentPage.jsp").forward(req, resp);
			

		String[] bid = req.getParameterValues("selectedBooks");
		for (String i : bid) {
			System.out.println(i);
		}
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
