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
		String reply = request.getParameter("reply");
		String inquiryState = request.getParameter("inquiryState");
		
		if(!("".equals(reply) || reply == null || inquiryId == null)) {
			InquiryDAO iDao = new InquiryDAO();
			iDao.adminAnswer(inquiryId, reply, inquiryState);
			iDao.close();
		}
		
		response.getWriter().println("<script>window.close();</script>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
