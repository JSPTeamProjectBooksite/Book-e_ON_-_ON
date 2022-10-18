package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dto.BookDTO;

@WebServlet("/introducePopup")
public class introducePopupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public introducePopupController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId = request.getParameter("id");
		
		System.out.println(bookId);
		
		BookDAO dao = new BookDAO();
		BookDTO book = dao.bookIntroduce(Long.parseLong(bookId));
		dao.close();
		
		request.setAttribute("book", book);
		request.getRequestDispatcher("introducePopup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
