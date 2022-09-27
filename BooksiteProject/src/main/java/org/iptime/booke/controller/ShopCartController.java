package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dto.BookDTO;

/**
 * Servlet implementation class ShopBasketController
 */
@WebServlet("/cart/list")
public class ShopCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		BookDAO bookDAO = new BookDAO();
		Long max = bookDAO.nextNumber();
		
		Cookie[] cookies = request.getCookies();		
		for(Cookie ck : cookies) {
			String val = ck.getValue();
			
			// 쿠키의 값이 숫자인지, 너무 높은지 낮은지 검사
			if(!val.matches("^[0-9]+$")) continue;
			Long idL = Long.valueOf(val);
			if(idL >= max || 0 >= idL) continue;
			
			BookDTO dto = bookDAO.readBook(idL);
			dto.setCount(1);
			
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
