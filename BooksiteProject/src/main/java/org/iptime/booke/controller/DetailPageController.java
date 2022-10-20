package org.iptime.booke.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.AuthorDAO;
import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dao.BookReviewDAO;
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
		dao.updateVisit(BID);

		dao.close();
			
		
		// 저자 정보
		AuthorDAO authorDao = new AuthorDAO();
		AuthorDTO author = authorDao.findAuthor(bookInfo.getAuthorId());
		authorDao.close();
		
		//리뷰 정보
		BookReviewDAO reviewDao = new BookReviewDAO();
		List<Map<String, Object>> reviewList = reviewDao.detailReview(BID);
		reviewDao.close();

		request.setAttribute("bookInfo", bookInfo);
		request.setAttribute("author", author);
		request.setAttribute("reviewList", reviewList);

		request.getRequestDispatcher("/DetailPage.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
