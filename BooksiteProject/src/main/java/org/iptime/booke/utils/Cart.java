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
        cookie.setPath("/cart/");       
        cookie.setMaxAge(cTime);     
        response.addCookie(cookie); 
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DetailPage 기준
		String bookId = request.getParameter("selectedBooks");
		String count = request.getParameter("bookCount");
		
		
		
		String bookCookie = bookId +"/"+ count;
		
		if(bookId != null && count != null) {
			cartCookie(response, bookId, bookCookie, 7 * (24*60*60));
			System.out.printf("[쿠키 생성][성공] %s : %s \n", bookId, bookCookie);
		} else {
			System.out.printf("[쿠키 생성][실패] bookId=%s, count=%s \n", bookId, count);
		}
		response.getWriter().println("<script>history.back();</script>");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("_method");
		
		if("DELETE".equalsIgnoreCase(method)) 
			doDelete(request, response);
		else
			doGet(request, response);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] bookIdList = request.getParameterValues("selectedBooks");
		
		if(bookIdList != null) {
			for(String bookId : bookIdList) {
				System.out.println("[쿠키 제거] "+ bookId);
				cartCookie(response, bookId, bookId, 0); 
			}
		}
		
		response.getWriter().println("<script>location.reload(true); history.back();</script>");
	}
}
