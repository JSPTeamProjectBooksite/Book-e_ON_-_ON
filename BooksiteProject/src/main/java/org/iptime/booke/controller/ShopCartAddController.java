package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.utils.CartCookie;

/**
 * Servlet implementation class ShopCartCookie
 */
@WebServlet("/cart/add")
public class ShopCartAddController extends HttpServlet implements CartCookie {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DetailPage 기준
		String bookId = request.getParameter("bookId");
		Integer bookCount = Integer.parseInt(request.getParameter("bookCount"));
		
		
		boolean flag = false;
		Cookie[] cookies = request.getCookies();	
		
		if(cookies != null) {
			for(Cookie ck : cookies) {
				String[] val = ck.getValue().split("/");
				String cBookId = val[0];

				if(val.length == 2 && cBookId.equals(bookId)) {
					flag = true;
					break;
				}
			}
		}
		
		
		if(bookId != null && bookCount != null) {
			String bookCookie = bookId +"/"+ bookCount;
			setCookieCart(response, bookId, bookCookie, 7);
			System.out.printf("[쿠키 값 변경][성공] %s : %s \n", bookId, bookCookie);
			
		} else {
			System.out.printf("[쿠키 값 변경][실패] bookId=%s, add=%s \n", bookId, bookCount);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
