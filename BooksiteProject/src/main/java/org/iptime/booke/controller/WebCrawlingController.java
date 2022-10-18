package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.utils.WebCrawlingTest;

@WebServlet("/webCrawling")
public class WebCrawlingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WebCrawlingController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("교보링크에서 검색합니다.");
		String URL = request.getParameter("URL");
		BookDTO book = WebCrawlingTest.webCrawling(URL);
		
		request.setAttribute("book", book);
		request.getRequestDispatcher("/BookAddForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
