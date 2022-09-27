package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;
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
		
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		
//		String cValue = CookieManager.readCookie(request, "cart");
		String cValue = "1/2/3/4/5/6/7";
				
		System.out.printf("[Cookie] cart : %s\n", cValue);
		String[] bookIds = cValue.split("/");
		
		BookDAO bookDAO = new BookDAO();
		
		for(String id : bookIds) {
			Long idL = Long.valueOf(id);
			BookDTO dto = bookDAO.readBook(idL);
			bookList.add(dto);
		}
		bookDAO.close();

		request.setAttribute("bookList", bookList);

		request.getRequestDispatcher("/ShopCartPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
