package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dto.BookDTO;

@WebServlet("/ManageBookRevise")
public class ManageBookReviseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("chooseBook");	
		
		System.out.println("ID:"+id);
		
		BookDAO dao = new BookDAO();
		BookDTO book = dao.ManagerBookInfo(Long.parseLong(id));
		
		System.out.println("작가아이디 : " + book.getAuthorId());
		
		request.setAttribute("book", book);
		request.getRequestDispatcher("/BookReviseForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
