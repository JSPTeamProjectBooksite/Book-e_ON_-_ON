package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.BookReviewDAO;

@WebServlet("/reveiw.do")
public class ReveiwControllor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReveiwControllor() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8"); // 받은 문자를 UTF-8로 변경
		
		Long memberID = (Long)session.getAttribute("LoginID");
		Long bookID = Long.parseLong(request.getParameter("bookID"));
		int score = 0;
		if(request.getParameter("score") != null) {
			score = Integer.parseInt(request.getParameter("score"));
		}
		String comment = request.getParameter("reveiwBox");
		
		System.out.println("리퀘스크 받은 리뷰 : " + comment);
		
		BookReviewDAO dao = new BookReviewDAO();
		if(dao.writeReview(bookID, memberID, score, comment))
			System.out.println("리뷰가 성공적으로 작성 됨");
		dao.close();
		
		request.getRequestDispatcher("/HistoryBack.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
