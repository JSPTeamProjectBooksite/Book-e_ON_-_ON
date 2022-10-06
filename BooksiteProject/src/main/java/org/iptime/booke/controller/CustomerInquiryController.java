package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.CustomerCenterDAO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/customercenter")
public class CustomerInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		String UserId = (String) session.getAttribute("user_id");
		session.setAttribute("user_id", UserId);

		CustomerCenterDAO dao = new CustomerCenterDAO();
		
		MemberDTO cusinfo = dao.cusinfo((String) session.getAttribute("user_id"));
		System.out.println(cusinfo);

	}
}
