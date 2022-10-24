package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.InquiryDAO;

@WebServlet("/inquiryAnswer")
public class InquiryAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		Long inquiryId = Long.parseLong(request.getParameter("inquiryId"));
		String aContent = request.getParameter("aContent");
		
		InquiryDAO iDao = new InquiryDAO();
		iDao.adminAnswer(inquiryId, aContent);
		
		
		response.getWriter().println("<script>history.back();</script>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
