package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookReviewDAO;

@WebServlet("/like.do")
public class ReviewLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewLikeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long reviewID = null;
		if(request.getParameter("whatReviewLike").length() > 0) {
			reviewID = Long.parseLong(request.getParameter("whatReviewLike"));
		}
		BookReviewDAO dao = new BookReviewDAO();
		if(dao.likeReview(reviewID))
			System.out.println("좋아요~♥");
		dao.close();
		
		request.getRequestDispatcher("/HistoryBack.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
