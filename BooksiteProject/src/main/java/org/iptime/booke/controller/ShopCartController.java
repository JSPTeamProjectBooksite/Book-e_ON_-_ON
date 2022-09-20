package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dto.BookDTO;

/**
 * Servlet implementation class ShopBasketController
 */
@WebServlet("/shopcart")
public class ShopCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<BookDTO> bookList = daooo();
		request.setAttribute("bookList", bookList);

		request.getRequestDispatcher("/ShopCart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private List<BookDTO> daooo() {
		List<BookDTO> bookList = new ArrayList<BookDTO>();

		bookList.add(new BookDTO("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, 2));
		bookList.add(new BookDTO("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, 2));
		bookList.add(new BookDTO("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, 2));

		return bookList;
	}
}
