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

		List<BookDTO> bookList = daoo();
		req.setAttribute("bookList", bookList);
		
		req.getRequestDispatcher("/paymentPage.jsp").forward(req, resp);
	}

	protected void dopost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	private List<BookDTO> daoo() {
		List<BookDTO> bookList = new ArrayList<BookDTO>();

		bookList.add(new BookDTO("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, "김부기", "경기도 성남시 분당구 돌마로46 5층", 1, "bookies@gamil.com"));
		return bookList;

	}
}
