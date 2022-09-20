package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dto.BookDTO;

@WebServlet("/paymentPage")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<BookDTO> paymentList = Payment();
		RequestDispatcher dispatcher = req.getRequestDispatcher("./paymentPage.jsp");
		dispatcher.forward(req, resp);
	}

	protected void dopost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	private List<BookDTO> Payment() {
		List<BookDTO> paymentList = new ArrayList<BookDTO>();

		paymentList.add(new BookDTO("source/book/하루도_쉬운_날이_없어.png", "하루도 쉬운 날이 없어", 14000, "김부기", "경기도 성남시 분당구 돌마로46 5층", 1));
		return paymentList;

	}
}
