package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.AuthorDAO;
import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dto.AuthorDTO;
import org.iptime.booke.dto.BookDTO;

@WebServlet("/detail")
public class DetailPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Long BID = Long.parseLong(request.getParameter("BID"));

		BookDAO dao = new BookDAO();
		
		BookDTO bookInfo = dao.bookDetail(BID);

		dao.close();
		
		// 가격은 표시할때 정수형이 아닌 문자형으로 표시할 예정이다. 따로 저장할 변수를 만든다.
		// 18000 -> 18,000
		long price = bookInfo.getPrice();

		/*
		 * 가격은 정수형으로 정의되어있다. 하지만, 출력시 18,000원 이런식으로 표현하기 위해 3번마다 ','을 찍어둔 문자열을 만들어서 같이
		 * request한다.
		 */
		String bookPrice = "";

		for (int i = 0, n = (price + "").length(); i < n; i++) {
			bookPrice = price % 10 + bookPrice;
			price /= 10;

			if (i != n - 1 && (i + 1) % 3 == 0) {
				bookPrice = "," + bookPrice;
			}
		}
		
		// 저자 정보
		AuthorDAO authorDao = new AuthorDAO();
		AuthorDTO author = authorDao.findAuthor(bookInfo.getAuthorId());
		authorDao.close();

		request.setAttribute("bookInfo", bookInfo);
		request.setAttribute("price", bookPrice);
		request.setAttribute("author", author);

		request.getRequestDispatcher("/DetailPage.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
