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
import org.iptime.booke.utils.CookieManager;

/**
 * Servlet implementation class ShopBasketController
 */
@WebServlet("/shopcart")
public class ShopCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<BookDTO> bookList = daooo(request);
		request.setAttribute("bookList", bookList);

		request.getRequestDispatcher("/ShopCartPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private List<BookDTO> daooo(HttpServletRequest request) {
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		
		String cValue = CookieManager.readCookie(request, "cart");
				
		// 책의 id를 입력받음
		System.out.printf("[Cookie] cart : %s\n", cValue);


		bookList.add(new BookDTO("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, 2));
		bookList.add(new BookDTO("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, 2));
		bookList.add(new BookDTO("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, 2));
		

		return bookList;
	}
}
