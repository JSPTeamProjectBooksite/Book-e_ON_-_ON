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
		
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		List<Integer> MaxList = new ArrayList<Integer>();
		BookDAO bookDAO = new BookDAO();
				
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie ck : cookies) {
				
				try {
					String[] val = ck.getValue().split("/");
					String id = val[0];
					int count = Integer.parseInt(val[1]);
					
					Long idL = Long.valueOf(id);
					
					System.out.println("[쿠키 조회] " + ck.getValue());
					BookDTO dto = bookDAO.readBook(idL);
					int max = dto.getQuantity();
					dto.setQuantity(count);
					
					MaxList.add(max);
					bookList.add(dto);
				} catch (Exception e) {
					continue;
				}
			}
		}
		bookDAO.close();
		
		request.setAttribute("bookList", bookList);
		request.setAttribute("MaxList", MaxList);
		request.getRequestDispatcher("/ShopCartPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
