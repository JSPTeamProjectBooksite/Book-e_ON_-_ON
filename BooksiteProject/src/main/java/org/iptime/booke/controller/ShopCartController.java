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
 * 장바구니 쿠키의 구성
 *  key : id
 *  value : id/count (책id와 수량은 '/'으로 구분됨)
 */
@WebServlet("/cart/list")
public class ShopCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		BookDAO bookDAO = new BookDAO();
		
		Cookie[] cookies = request.getCookies();	
		
		if(cookies != null) {
			for(Cookie ck : cookies) {
				try {
					String[] val = ck.getValue().split("/");
					String id = val[0];
					int count = Integer.parseInt(val[1]);
					
					Long idL = Long.valueOf(id);
					
					BookDTO dto = bookDAO.readBook(idL);
					dto.setCount(count);
					
					bookList.add(dto);
				} catch (Exception e) {
					continue;
				}
			}
		}
		bookDAO.close();
		
		request.setAttribute("bookList", bookList);
		response.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("/ShopCartPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
