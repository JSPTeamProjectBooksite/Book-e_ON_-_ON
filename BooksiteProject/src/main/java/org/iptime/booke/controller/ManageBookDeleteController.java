package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;

@WebServlet("/ManageBookDelete")
public class ManageBookDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("chooseBook");		
		BookDAO dao = new BookDAO();
		
		int result = dao.deleteBook(idx);
		
		if(result == 1) {
			System.out.println("책 삭제 완료");
		} else {
			System.out.println("책 삭제 실패");			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
