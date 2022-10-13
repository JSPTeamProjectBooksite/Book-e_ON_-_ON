package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.AuthorDAO;
import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dto.AuthorDTO;
import org.iptime.booke.dto.BookDTO;

@WebServlet("/ManagerBook")
public class ManagerBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookDAO bookDao = new BookDAO();
		AuthorDAO authorDao = new AuthorDAO();

		ArrayList<BookDTO> bookList = bookDao.ManagerBookInfo();
		ArrayList<String> authorList = new ArrayList<String>();
		
		for(BookDTO book : bookList) {
			authorList.add(authorDao.findAuthor(book.getAuthorId()).getName());
		}
		
		bookDao.close();
		authorDao.close();
		
		request.setAttribute("bookList", bookList);
		request.setAttribute("authorList", authorList);
		request.getRequestDispatcher("./ManageBook.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
