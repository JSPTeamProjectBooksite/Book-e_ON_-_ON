package org.iptime.booke.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.MainPageDAO;
import org.iptime.booke.dto.BookDTO;


@WebServlet("/main")
public class MainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MainPageDAO dao = new MainPageDAO();
		//인기항목으로 띄울 책의 bid들
		long[] poplist = new long[]{1,2,3,4,5,6};
		
		List<BookDTO> popularList = dao.selectPopularList(poplist);
		request.setAttribute("popularList", popularList);
		
		
		request.getRequestDispatcher("/MainPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
