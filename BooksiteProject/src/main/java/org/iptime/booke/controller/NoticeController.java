package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dto.PostDTO;

/**
 * Servlet implementation class NoticeController
 */
@WebServlet("/notice")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<PostDTO> postList = daooo();
		request.setAttribute("postList", postList);

		request.getRequestDispatcher("/NoticePage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private List<PostDTO> daooo() {
		List<PostDTO> postList = new ArrayList<PostDTO>();
		
		Date date = new Date();

		for(int i = 0; i < 15; i++)
			postList.add(new PostDTO("이벤트", "올해 절대 놓치면 안되는 초특가 상품 top10", date));

		return postList;
	}
}
