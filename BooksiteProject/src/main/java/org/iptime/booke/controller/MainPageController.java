package org.iptime.booke.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;


@WebServlet("/main")
public class MainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookDAO dao = new BookDAO();
		
		//책 정보와 작가정보가 각각 다른 테이블에 저장되어 있으므로 map형태로 저장한다.
		List<Map<String, Object>> popularList = dao.selectPopularList(6);
		
		dao.close();
		
		request.setAttribute("popularList", popularList);
		request.getRequestDispatcher("/MainPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
