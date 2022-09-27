package org.iptime.booke.utils;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShopCartCookie
 */
@WebServlet("/cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private void cartCookie(HttpServletResponse response, String cName,
            String cValue, int cTime) {
		Cookie cookie = new Cookie(cName, cValue); 
        cookie.setPath("/shopcart");       
        cookie.setMaxAge(cTime);     
        response.addCookie(cookie); 
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId = (String) request.getAttribute("bookId");
		
		if(bookId != null)
			cartCookie(response, bookId, bookId, 7 * (24*60*60));
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId = (String) request.getAttribute("bookId");
		
		if(bookId != null)
			cartCookie(response, bookId, bookId, 0); 
	}
}
