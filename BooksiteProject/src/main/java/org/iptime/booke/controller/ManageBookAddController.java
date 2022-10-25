package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dto.BookDTO;


@WebServlet("/MANAGE/BOOKADD")
public class ManageBookAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManageBookAddController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDTO book = (BookDTO)request.getAttribute("book");
		
		if(book==null) {	
			book = new BookDTO();
			book.setTitle("도서 제목");
			book.setDeliveryFee(2500);
		}
		
		
		request.setAttribute("book", book);
		request.getRequestDispatcher("/BookAddForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
